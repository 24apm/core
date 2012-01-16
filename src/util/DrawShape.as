package util
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import spark.primitives.Graphic;
	
	import style.RectangleStyle;

	public class DrawShape
	{
		public function DrawShape()
		{
		}
		public static function drawRect(g:Graphics, recConfig:Rectangle, recStyle:RectangleStyle = null):void
		{
			if(recStyle == null)
				recStyle = new RectangleStyle();
			g.beginFill(recStyle.color, recStyle.alpha);
			g.drawRect(recConfig.x, recConfig.y, recConfig.width, recConfig.height);
			g.endFill();
		}
		public static function drawRoundRect(g:Graphics, recConfig:Rectangle, recStyle:RectangleStyle = null):void
		{
			if(recStyle == null)
				recStyle = new RectangleStyle();
			g.beginFill(recStyle.color, recStyle.alpha);
			g.drawRoundRect(recConfig.x, recConfig.y, recConfig.width, recConfig.height, recStyle.ellipseWidth, recStyle.ellipseHeight);
			g.endFill();
		}		
		public static function drawBitmapRoundRect(g:Graphics, recConfig:Rectangle, recStyle:RectangleStyle = null):void
		{
			if(recStyle.bitmap)
				g.beginBitmapFill(recStyle.bitmap);
			g.drawRoundRect(recConfig.x, recConfig.y, recConfig.width, recConfig.height, recStyle.ellipseWidth, recStyle.ellipseHeight);
			g.endFill();
		}	
	}
}