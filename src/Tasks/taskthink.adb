With Ada.Real_Time; use Ada.Real_Time;
with mymotorDriver; use mymotorDriver;
With MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
With MicroBit.Console; use MicroBit.Console;

with Ada.Execution_Time; use Ada.Execution_Time;

package body TaskThink is

  task body think is
      myClock : Time;
      RotationDuration : integer;
      ResetTimer : integer := 0; --Used to check how many cycles it needs to do for a certain rotation before changing state.
      RotationCycles : integer;
      Period : integer := 35;
      
      --Time_Now_Stopwatch : Time;
      --Time_Now_CPU : CPU_Time;
      --Elapsed_Stopwatch : Time_Span;
      --Elapsed_CPU : Time_Span;
      --Biggest_Stopwatch : Time_Span;
      --Biggest_CPU : Time_Span;
      
   begin
      loop
         myClock := Clock;
         
         --Elapsed_Stopwatch := Time_Span_Zero; -- Start measuring  ---------------
         --Elapsed_CPU := Time_Span_Zero;
         
         --Time_Now_Stopwatch := Clock;
        -- Time_Now_CPU := Clock;
         
         if MotorDriver.GetCurrentState = stop and brain.GetBooleanSearching = false then
            if Brain.GetNewAngle > 77 then
               MotorDriver.SetDirection(LeftRotate);
               RotationDuration := (brain.GetNewAngle-77)*42; --Multiple of 42 milliseconds per degree is derived from the estimation that 90 degrees takes 2 seconds of rotation.
               RotationCycles := RotationDuration/Period;
            elsif brain.GetNewAngle < 78 then
               MotorDriver.SetDirection(RightRotate);
               RotationDuration := abs(brain.GetNewAngle-77)*42;
               RotationCycles := RotationDuration/Period;
            end if;
            put_line("RotationDuration: " & RotationDuration'image);
         end if;
         
         StateDecision(MotorDriver.GetCurrentState, RotationCycles, ResetTimer);
         
         --Elapsed_CPU := Elapsed_CPU + (Clock - Time_Now_CPU);
         --Elapsed_Stopwatch := Elapsed_Stopwatch + (Clock - Time_Now_Stopwatch);
         --if Elapsed_CPU > Biggest_CPU then
         --   Biggest_CPU := Elapsed_CPU;
         --end if;
         --if Elapsed_Stopwatch > Biggest_Stopwatch then
         --   Biggest_Stopwatch := Elapsed_Stopwatch;
         --end if;
         
        -- Put_Line ("Biggest CPU time: " & To_Duration (Biggest_CPU)'Image & " seconds");
        -- Put_Line ("Biggest Stopwatch time: " & To_Duration (Biggest_Stopwatch)'Image & " seconds");
         --Put_Line ("CPU time: " & To_Duration (Elapsed_CPU)'Image & " seconds");
        -- Put_Line ("Stopwatch time: " & To_Duration (Elapsed_Stopwatch)'Image & " seconds"); --------------
         
         delay until myClock + Milliseconds(35);  --random period
         
      end loop;           
      
   end think;
   
   procedure StateDecision (state : Statemachine; RotationCycles : IN OUT integer; ResetTimer : IN OUT integer) is
   begin
      case state is
         when Stop =>
            if brain.GetBooleanSearching = true then
               MotorDriver.SetCurrentState(stop);
            else
               MotorDriver.SetCurrentState(rotate);
            end if;
            
         when Rotate =>
            if ResetTimer < RotationCycles then
               MotorDriver.SetCurrentState(rotate);
               ResetTimer := ResetTimer+1;
            else
               MotorDriver.SetCurrentState(forward);
               ResetTimer := 0;
            end if;
            
         when Forward =>
            if integer (brain.GetMeasurementSensor1) > 15 then
               MotorDriver.SetCurrentState(forward);
               MotorDriver.SetDirection(forward);
            else
               MotorDriver.SetDirection(stop);
               MotorDriver.SetCurrentState(stop);
               Brain.SetBooleanSearching(true);
            end if;
            
      end case;
   end StateDecision;

end TaskThink;
