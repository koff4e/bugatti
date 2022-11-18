with Ultrasonic; use Ultrasonic;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
use MicroBit;

package MyBrain is

   protected Brain is
      function GetMeasurementSensor1 return Distance_cm; -- concurrent read operations are now possible
      function GetMeasurementSensor2 return Analog_Value; -- concurrent read operations are now possible
      function GetBooleanSearching return boolean;
      function GetNewAngle return integer;
  
      procedure SetMeasurementSensor1; -- but concurrent read/write are not!
      procedure SetMeasurementSensor2; -- but concurrent read/write are not!
      procedure SetBooleanSearching (trueorfalse : boolean);
      procedure SetNewAngle (angle : integer);
   private
      MeasurementSensor1 : Distance_cm := 0;
      MeasurementSensor2 : Analog_Value := 0;
      Searching : boolean := true; --Is it currently searching for the best path?
      NewAngle : integer; --The angle with the longest clear way.
   end Brain;

end MyBrain;
