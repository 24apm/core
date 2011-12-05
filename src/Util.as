package
{
	public class Util
	{
		public function Util()
		{
		}
		public static function rand(min:Number, max:Number):Number
		{
			return min + (Math.random() * (max - min));
		}
	}
}