package view 
{
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	import flash.events.Event;

	public class BasicView extends UIElement
	{
		protected var _bgLayer:Sprite;
		protected var _obstacleLayer:Sprite;
		protected var _bgImg:UILoader;
		
		protected var _bgUrl:String;
		public function BasicView(bgUrl:String = null)
		{
			super();
			_bgUrl = bgUrl;
			if(_bgUrl == null)
			{
				_bgUrl = "";
			}
			this.alpha = 0;
			
		}
		protected override function init(e:Event=null):void
		{
			super.init(e);
			TweenLite.to(this, 1, {alpha:1});
		}


		public override function destruct():void
		{
			if(_bgImg)
			{
				_bgImg.destruct();
				_bgImg = null;
			}
			super.destruct();
		}
	}
}