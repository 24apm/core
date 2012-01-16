package style
{
	import flash.display.BitmapData;

	public class RectangleStyle
	{
		public var color:uint;
		public var alpha:Number;
		public var ellipseWidth:Number;
		public var ellipseHeight:Number;
		public var bitmap:BitmapData;
		
		public function RectangleStyle(color:uint = 0x0, alpha:Number = 1.0
		,ellipseWidth:Number = 0, ellipseHeight:Number = 0, bitmap:BitmapData = null)
		{
			this.color = color;
			this.alpha = alpha;
			this.ellipseWidth = ellipseWidth;
			this.ellipseHeight = ellipseHeight;
			this.bitmap = bitmap;
		}
	}
}