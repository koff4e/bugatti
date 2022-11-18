with Ultrasonic; use Ultrasonic;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
use MicroBit;

package body MyBrain is

     
    protected body Brain is
      --  procedures can modify the data
      procedure SetMeasurementSensor1 is
      begin
         MeasurementSensor1 := Ultrasonic.Read;
      end SetMeasurementSensor1;

      --  functions cannot modify the data
      function GetMeasurementSensor1 return Distance_cm is
      begin
         return MeasurementSensor1;
      end GetMeasurementSensor1;
      
      --  procedures can modify the data
      procedure SetMeasurementSensor2 is
      begin
         MeasurementSensor2 := Analog(4);
      end SetMeasurementSensor2;

      --  functions cannot modify the data
      function GetMeasurementSensor2 return Analog_Value is
      begin
         return MeasurementSensor2;
      end GetMeasurementSensor2;
      
      procedure SetBooleanSearching(trueorfalse : boolean) is
      begin
         Searching := trueorfalse;
      end SetBooleanSearching;
      
      function GetBooleanSearching return boolean is
      begin
         return Searching;
      end GetBooleanSearching;
      
      procedure SetNewAngle (angle : integer) is
      begin
         NewAngle := angle;
      end SetNewAngle;
      
      function GetNewAngle return integer is
      begin
         return NewAngle;
      end GetNewAngle;
      
   end Brain;

end MyBrain;
