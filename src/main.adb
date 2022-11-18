with MyController; -- This embeds and instantiates the MyController package
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
with MicroBit;
with MicroBit.Console; use MicroBit.Console;
with MyMotorDriver; use MyMotorDriver;
with MyBrain; use MyBrain;
with ada.Real_Time; use ada.real_time;

with Ada.Execution_Time; use Ada.Execution_Time;

-- NOTE ----------
-- See the mycontroller_empty package first for a single file empty Sense-Think-Act (STA) template
-- The mycontroller package contains a better structured STA template with each task having its own file
-- Build your own controller from scratch using the template and structured coding principles as a guide line.
-- Use
------------------

--Empty main running as a task currently set to lowest priority. Can be used as it is a normal task!

Procedure Main with Priority => 2 is
   -- a range between 0 and 1023 meaning 0V to 3.3V
   Value : constant Analog_Value := 76;
   myClock : Time;
   LongestDistance : integer := 0;
   ResetTimer : integer := 0;
   Angle : Analog_Value := 27;

   --Time_Now_Stopwatch : Time;
   --Time_Now_CPU : CPU_Time;
   --Elapsed_Stopwatch : Time_Span := Time_Span_Zero;
   --Elapsed_CPU : Time_Span := Time_Span_Zero;
   --Biggest_Stopwatch : Time_Span := Time_Span_Zero;
   --Biggest_CPU : Time_Span := Time_Span_Zero;

begin
   -- To create an analog output signal we need frequency and amplitude

   --  We set the frequency by setting the period (remember f=1/t).
   Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us

   --  To set the amplitude we use a trick called duty cycle. For example:
   --  A 100% duty cycle means a DC signal (always up), eg the frequency is 0, despite being set.
   --  A 50% duty cycle means on average 1.65V but it also means 50% the pulse is up at 3.3V and 50% the pulse is down at 0V.
   --  A 10% duty cycle means 10% of 3.3V = on average 0.33V: 10% up, 90% down.
   Write (9, Value);

   loop
	-- Generating PWM signal to control a servo motor without a motor library
   -- First look at the data sheet of the motor for example: https://components101.com/motors/mg995-servo-motor

   -- The MG995 servo motor needs a 50 Hz frequency or 20 ms (already done above)
	-- The spec says a valid duty cycle is 0.5 ms/20ms = 2.5% (-90 degree)
	--                                     1.5 ms/20ms = 7.5% ( 0 degree)
   --                                     2.5 ms/20ms = 12.5% ( +90 degree)
      myClock := clock;
      if MotorDriver.GetCurrentState = stop and brain.GetBooleanSearching = true then
         Write (9, Analog_Value(27));

         While ResetTimer < 10 loop -- Make sure it gets sensor readings from the minimum angle. (takes time to get there at start)
            myClock := clock;
            if integer(brain.GetMeasurementSensor1) > LongestDistance then
               LongestDistance := integer(brain.GetMeasurementSensor1);
               brain.SetNewAngle(27);
               Put("Longest Distance: " & LongestDistance'Image);
               Put_Line(" Best angle: " & integer(brain.GetNewAngle)'Image);
            end if;
            ResetTimer := ResetTimer +1;
            delay until myClock + Milliseconds(30);
         end loop;
         ResetTimer := 0;

         for I in Analog_Value range 27.. 127 loop
            myClock := clock;

            --Elapsed_Stopwatch := Time_Span_Zero; -- Start measuring  ---------------
            --Elapsed_CPU := Time_Span_Zero;

            --Time_Now_Stopwatch := Clock;
            --Time_Now_CPU := Clock;

            Write (9, I);

            if integer(brain.GetMeasurementSensor1) > LongestDistance then
               LongestDistance := integer(brain.GetMeasurementSensor1);
               brain.SetNewAngle(integer(I));
               Put("Longest Distance: " & LongestDistance'Image);
               Put_Line(" Best angle: " & integer(brain.GetNewAngle)'Image);
            end if;

            if I = 127 then
               Put_line("Found best angle!");
               brain.SetBooleanSearching(false);
               LongestDistance := 0; --Reset to prepare for next search/calculate cycle. (Else it will just compound on every stop/search)
               Write(9, Analog_Value(77)); -- Reset the Servo.
            end if;

            --Elapsed_CPU := Elapsed_CPU + (Clock - Time_Now_CPU);
            --Elapsed_Stopwatch := Elapsed_Stopwatch + (Clock - Time_Now_Stopwatch);

            --if Elapsed_CPU > Biggest_CPU and Elapsed_CPU < Milliseconds(1000) then
            --   Biggest_CPU := Elapsed_CPU;
            --end if;
            --if Elapsed_Stopwatch > Biggest_Stopwatch and Elapsed_Stopwatch < Milliseconds(1000) then
            --   Biggest_Stopwatch := Elapsed_Stopwatch;
            --end if;

            --Put_Line ("Biggest CPU time: " & To_Duration (Biggest_CPU)'Image & " seconds");
            --Put_Line ("Biggest Stopwatch time: " & To_Duration (Biggest_Stopwatch)'Image & " seconds");
            --Put_Line ("CPU time: " & To_Duration (Elapsed_CPU)'Image & " seconds");
            --Put_Line ("Stopwatch time: " & To_Duration (Elapsed_Stopwatch)'Image & " seconds"); --------------

            delay until myClock + Milliseconds(30);
         end loop;

      elsif MotorDriver.GetCurrentState = Forward then

         -- Loop for value between 25 = 2.5% of 1023 (3.3V) and 127 = 12.5% of 1023.
         for I in Analog_Value range 55.. 77 loop -- Angle is incremented with 2 every iteration so it goes from 55 to 99.
            exit when MotorDriver.GetDirection = stop;

            if I = 55 then
               Angle := 55;
               Write (9, Angle);
            elsif I = 77 then
               myClock := clock;
               Write (9, Angle);
            else
               myClock := clock;
               Angle := Angle+2;
               Write(9, Angle);
            end if;

            delay until myClock + Milliseconds(30);
            --Wait 2 frames of 50Hz = 40ms (delay is always needed because a servo needs time to physically rotate. Delay depends on amount of rotation and rotation speed of servo)
            --we also set the period to be 20ms, so faster than 20ms makes no sense.
         end loop;

         for I in reverse Analog_Value range 77.. 99 loop -- Angle is decremented with 2 every iteration so it goes from 99 to 55.
            exit when MotorDriver.GetDirection = stop;
            myClock := clock;

            if I = 99 then
               Angle := 99;
               Write (9, Angle);
               delay until myClock + Milliseconds(30);
            elsif I = 77 then
               myClock := clock;
               Write (9, Angle);
            else
               Angle := Angle-2;
               Write (9, Angle);
               delay until myClock + Milliseconds(30);
            end if;

         end loop;

      end if;
      delay until myClock + Milliseconds(30);

   end loop;
end Main;
