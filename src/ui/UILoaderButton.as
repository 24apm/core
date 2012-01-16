package ui
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Elastic;
	
	import event.ItemEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import modal.ModalManager;

	public class UILoaderButton extends UIElement
	{
		private var _url:String;
		private var _loader:UILoader;
		
		private var _onClick:Function;
		
		private var _scale:Number = 1.1;
		public function UILoaderButton(url:String, onClick:Function)
		{
			super();
			_url = url;
			_onClick = onClick;
		}
		protected override function init(e:Event = null):void
		{
			super.init(e);
			
			_loader = new UILoader(_url);
			addChild(_loader);
			
			addEventListener(MouseEvent.CLICK, onClick);
			addEventListener(MouseEvent.ROLL_OUT, rOut);
			addEventListener(MouseEvent.ROLL_OVER, rOver);
		}
		private function onClick(e:MouseEvent):void
		{
			if(_onClick != null)
				_onClick();
		}
		private function rOut(e:MouseEvent):void
		{
			TweenLite.to(_loader, 1, {x: 0, y:0, scaleX:1, scaleY:1, ease:Elastic.easeOut});
			
		}
		private function rOver(e:MouseEvent):void
		{
			var xOffset:Number = -_loader.width*(_scale - 1)*0.5;
			var yOffset:Number =  -_loader.height*(_scale - 1)*0.5;
			
			TweenLite.to(_loader, 1, {x:xOffset, y:yOffset, scaleX:_scale, scaleY:_scale, ease:Elastic.easeOut});
		}				
		
	}
}