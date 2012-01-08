package util
{
	import flash.utils.Dictionary;
	
	import mx.messaging.AbstractConsumer;

	public class Tester
	{
		public function Tester()
		{
		}
		public static function testRand():void
		{
			trace("TESTING RANDOM");
			var dict:Dictionary = new Dictionary();
			for (var i:int = 0; i < 100000; i++)
			{
				if(!dict[Math.floor(Util.rand(0,4))])
					dict[Math.floor(Util.rand(0,4))] = 1;
				dict[Math.floor(Util.rand(0,4))]++;	
			}
			for (var value:Object in dict)
			{
				trace(value + ": " + dict[value]);
			}
		}
	}
}