with MyMotorDriver; use MyMotorDriver;
with MyBrain; use MyBrain;

package TaskThink is
   
   task Think with Priority=> 1;
   
   procedure StateDecision (state : Statemachine; RotationCycles : IN OUT integer; ResetTimer : IN OUT integer);
  
end TaskThink;
