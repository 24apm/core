package
{
	import com.greensock.TweenLite;
	
	import data.DirectionData;
	
	import event.ItemEvent;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flashx.textLayout.utils.CharacterUtil;

	public class UIDirectionalElement extends UIElement
	{
		public static const NONE:int = 0;
		public static const STUNNED:int = 1;
		protected var _directionalObj:DirectionData;
		private var _status:int = NONE;
		private var _stunnedTimer:Timer;
		
		public function UIDirectionalElement(directionalObj:DirectionData = null)
		{
			super();
			if(directionalObj == null)
			{
				directionalObj = new DirectionData(0,0);
			}
			_directionalObj = directionalObj;
		}
		protected override function init(e:Event=null):void
		{
			super.init(e);
			_stunnedTimer = new Timer(100, 10);
			addEventListener(MouseEvent.CLICK, click);
			//			
		}
		public function get status():int
		{
			return _status;
		}
		public function get directionalObj():DirectionData
		{
			return _directionalObj;
		}
		protected function click(e:MouseEvent):void
		{

			stunned();
		}
		public function stunned():void
		{
			if(!_stunnedTimer.running)
			{
				_stunnedTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onStunComplete);
				_stunnedTimer.addEventListener(TimerEvent.TIMER, onStunTick);
				_stunnedTimer.start();	
				_status = STUNNED;
			}
		}
		protected function onStunComplete(e:TimerEvent):void
		{
			_stunnedTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onStunComplete);
			_stunnedTimer.removeEventListener(TimerEvent.TIMER, onStunTick);
			_stunnedTimer.stop();
			_stunnedTimer.reset();
			_status = NONE;
			
			dispatchEvent(new ItemEvent(ItemEvent.ITEM_CLICKED, this, true));
		}
		private function onStunTick(e:TimerEvent):void
		{
			if(this.alpha > 0.9)
				this.alpha = 0.8;
			else
				this.alpha = 1;
		}
		public override function destruct():void
		{
			removeEventListener(MouseEvent.CLICK, click);
			
			super.destruct();
		}
	}
}