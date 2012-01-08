package ui
{
	import config.ScrollerArrowsConfig;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import util.DrawShape;

	public class ScrollerArrows extends UIElement
	{
		private var _scroller:Scroller;
		private var _config:ScrollerArrowsConfig;
		
		private var _leftArrow:UIElement;
		private var _rightArrow:UIElement;
		
		public function ScrollerArrows(scroller:Scroller, config:ScrollerArrowsConfig)
		{
			super();
			_scroller = scroller;
			_config = config;
		}
		protected override function init(e:Event=null):void
		{
			super.init(e);
			addChild(_scroller);
			
			_leftArrow = new UIElement();
			DrawShape.drawRect(_leftArrow.graphics, new Rectangle(0,0,30,100));
			addChild(_leftArrow);
			_leftArrow.addEventListener(MouseEvent.CLICK, onLeftClick);
			_leftArrow.x = -_leftArrow.width - _config.arrowSpacing;
			
			_rightArrow = new UIElement();
			DrawShape.drawRect(_rightArrow.graphics, new Rectangle(0,0,30,100));
			addChild(_rightArrow);
			_rightArrow.addEventListener(MouseEvent.CLICK, onRightClick);
			_rightArrow.x = _scroller.config.scrollerSize.x + _config.arrowSpacing;
		}
		private function onLeftClick(e:MouseEvent):void
		{
			_scroller.scrollTo(_scroller.currentIndex - _scroller.config.scrollablesPerPage - 1);
			
		}
		private function onRightClick(e:MouseEvent):void
		{
			_scroller.scrollTo(_scroller.currentIndex + _scroller.config.scrollablesPerPage + 1);
			
		}
	}
}