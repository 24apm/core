package util
{
	import flash.geom.Point;

	public class Util
	{
	
		public static const LEFT:int = 0;
		public static const UP:int = 1;
		public static const RIGHT:int = 2;
		public static const DOWN:int = 3;
		
		public function Util()
		{
		}
		public static function rand(min:Number, max:Number):Number
		{
			return min + (Math.random() * (max+1 - min));
		}
		public static function randInt(min:Number, max:Number):int
		{
			return Math.floor(rand(min, max));
		}
		public static function getTimeStamp():Number
		{
			var now:Date = new Date();
			return now.getTime();
		}


	}
}