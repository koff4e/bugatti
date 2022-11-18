With Ada.Real_Time; use Ada.Real_Time;
With MicroBit.Console; use MicroBit.Console;

--Important: use Microbit.IOsForTasking for controlling pins as the timer used there is implemented as an protected object
With MicroBit.IOsForTasking; use MicroBit.IOsForTasking;

with Ada.Execution_Time; use Ada.Execution_Time;

package body TaskAct is

   task body act is
      myClock : Time; 
      --Time_Now_Stopwatch : Time;
      --Time_Now_CPU : CPU_Time;
      --Elapsed_Stopwatch : Time_Span;
      --Elapsed_CPU : Time_Span;
      --Biggest_Stopwatch : Time_Span;
      --Biggest_CPU : Time_Span;
   begin
      
      Setup; -- we do Setup once at the start of the task;
      
      loop
         myClock := Clock;
         
         --Elapsed_Stopwatch := Time_Span_Zero; -- Start measuring  ---------------
         --Elapsed_CPU := Time_Span_Zero;
         
         --Time_Now_Stopwatch := Clock;
         --Time_Now_CPU := Clock;
     
         Drive(MotorDriver.GetDirection);
         
         --Elapsed_CPU := Elapsed_CPU + (Clock - Time_Now_CPU);
         --Elapsed_Stopwatch := Elapsed_Stopwatch + (Clock - Time_Now_Stopwatch);
         --if Elapsed_CPU > Biggest_CPU then
         --   Biggest_CPU := Elapsed_CPU;
         --end if;
         --if Elapsed_Stopwatch > Biggest_Stopwatch then
         --   Biggest_Stopwatch := Elapsed_Stopwatch;
         --end if;
         
         --Put_Line ("Biggest CPU time: " & To_Duration (Biggest_CPU)'Image & " seconds");
         --Put_Line ("Biggest Stopwatch time: " & To_Duration (Biggest_Stopwatch)'Image & " seconds");
         --Put_Line ("CPU time: " & To_Duration (Elapsed_CPU)'Image & " seconds");
         --Put_Line ("Stopwatch time: " & To_Duration (Elapsed_Stopwatch)'Image & " seconds"); --------------
         
         --Put_Line ("Direction is: " & MotorDriver.GetDirection'Image);
       
         delay until myClock + Milliseconds(40);  --random period, but faster than 20 ms is no use because Set_Analog_Period_Us(20000) !
                                                  --faster is better but note the weakest link: if decisions in the thinking task come at 100ms and acting come at 20ms 
                                                  --then no change is set in the acting task for at least 5x (and is wasting power to wake up and execute task!)
      end loop;
   end act;
   
   procedure Setup is
   begin
      MotorDriver.SetMotorPins(V =>  (0,14,15, --LF pins (speed, pin1, pin2)
                                      0,12,13, --LB pins
                                      1,6,7, --RF pins
                                      1,2,3)); --RB pins
      
      --For example set the PWM period, as you only need to do this once
      Set_Analog_Period_Us (20_000); --20 ms = 50 Hz, typical for many actuators. You can change this, check the motor behavior with an oscilloscope.
     
   end Setup;
      
   procedure Drive (Direction : Directions) is
      p : MotorControllerPins := MotorDriver.GetMotorPins;
   begin
      case Direction is
         when Forward =>
            DriveWheel(w => (p.RF_IN1,p.RF_IN2,p.RF_ENA, True, False, 512)); --RF
            DriveWheel(w => (p.RB_IN3,p.RB_IN4,p.RB_ENB, True, False, 512)); --RB
            DriveWheel(w => (p.LF_IN3,p.LF_IN4,p.LF_ENB, True, False, 512)); --LF
            DriveWheel(w => (p.LB_IN1,p.LB_IN2,p.LB_ENA, True, False, 512)); --LB
         when Stop =>
            DriveWheel(w => (p.RF_IN1,p.RF_IN2,p.RF_ENA, False, False, 0)); --RF
            DriveWheel(w => (p.RB_IN3,p.RB_IN4,p.RB_ENB, False, False, 0)); --RB
            DriveWheel(w => (p.LF_IN3,p.LF_IN4,p.LF_ENB, False, False, 0)); --LF
            DriveWheel(w => (p.LB_IN1,p.LB_IN2,p.LB_ENA, False, False, 0)); --LB
         when LeftRotate =>   
            DriveWheel(w => (p.RF_IN1,p.RF_IN2,p.RF_ENA, True, False, 512)); --RF
            DriveWheel(w => (p.RB_IN3,p.RB_IN4,p.RB_ENB, True, False, 512)); --RB
            DriveWheel(w => (p.LF_IN3,p.LF_IN4,p.LF_ENB, False, True, 512)); --LF
            DriveWheel(w => (p.LB_IN1,p.LB_IN2,p.LB_ENA, False, True, 512)); --LB
         when RightRotate =>
            DriveWheel(w => (p.RF_IN1,p.RF_IN2,p.RF_ENA, False, True, 512)); --RF
            DriveWheel(w => (p.RB_IN3,p.RB_IN4,p.RB_ENB, False, True, 512)); --RB
            DriveWheel(w => (p.LF_IN3,p.LF_IN4,p.LF_ENB, True, False, 512)); --LF
            DriveWheel(w => (p.LB_IN1,p.LB_IN2,p.LB_ENA, True, False, 512)); --LB
      end case;
   end Drive;
   
   procedure DriveWheel(w : Wheel) is
     begin
          Set (w.PinForward, w.PinForwardValue);
          Set (w.PinBackward, w.PinBackwardValue);
          Write (w.PinSpeed, w.PinSpeedValue);   
      end DriveWheel;
   
end TaskAct;
