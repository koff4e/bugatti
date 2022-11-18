with Microbit.IOsForTasking; use Microbit.IOsForTasking;
With Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
use MicroBit;

--with Ada.Execution_Time; use Ada.Execution_Time;


package body TaskSense is

   task body sense is
      
      myClock : Time;
      --Time_Now_Stopwatch : Time;
      --Time_Now_CPU : CPU_Time;
      --Elapsed_Stopwatch : Time_Span;
      --Elapsed_CPU : Time_Span;
      --Biggest_Stopwatch : Time_Span;
     -- Biggest_CPU : Time_Span;
      
   begin
      Ultrasonic.Setup(19,10);
      loop
         
         myClock := Clock; --important to get current time such that the period is exactly 200ms.
                           --you need to make sure that the instruction NEVER takes more than this period. 
                           --make sure to measure how long the task needs, see Tasking_Calculate_Execution_Time example in the repository.
                           --What if for some known or unknown reason the execution time becomes larger?
                           --When Worst Case Execution Time (WCET) is overrun so higher than your set period, see : https://www.sigada.org/ada_letters/dec2003/07_Puente_final.pdf
                           --In this template we put the responsiblity on the designer/developer.
         
         --Elapsed_Stopwatch := Time_Span_Zero; -- Start measuring  ---------------
         --Elapsed_CPU := Time_Span_Zero;
         
         --Time_Now_Stopwatch := Clock;
         --Time_Now_CPU := Clock;
         
         brain.SetMeasurementSensor1;
         brain.SetMeasurementSensor2;
         
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
         --Put_Line ("Stopwatch time: " & To_Duration (Elapsed_Stopwatch)'Image & " seconds");  ------------
         
         --Put_Line ("Read" & Distance_cm'Image(brain.GetMeasurementSensor1));
         --Put_Line ("Magnet" & Analog_Value'Image(brain.GetMeasurementSensor2));
         

         --delay (0.024); --simulate a sensor eg the ultrasonic sensors needs at least 24ms for 400cm range.
            
         delay until myClock + Milliseconds(25); --random period
         end loop;
   end sense;

end TaskSense;
