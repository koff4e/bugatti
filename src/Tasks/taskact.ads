with MyMotorDriver; use MyMotorDriver;

package TaskAct is

   task Act with Priority=> 0;

   procedure Setup;    
   procedure Drive (direction : Directions);
   procedure DriveWheel(w : Wheel);
end TaskAct;
