package ui
{
	import com.greensock.TweenLite;
	
	import config.ScrollerConfig;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import style.RectangleStyle;
	
	import util.DrawShape;

	public class Scroller extends UIElement
	{
		private var _scrollables:Vector.<Scrollable>;
		private var _config:ScrollerConfig;
		
		private var _canvas:Sprite;
		private var _mask:Sprite;
		
		private var _currentIndex:uint = 0;
		
		private var _page:uint;
		
		public function get config():ScrollerConfig
		{
			return _config;
		}
		public function Scroller(scrollables:Vector.<Scrollable>, config:ScrollerConfig)
		{
			super();
			_scrollables = scrollables;
			_config = config;
		}
		protected override function init(e:Event=null):void
		{
			super.init(e);

			_canvas = new Sprite();
			addChild(_canvas);
			
			var scrollable:Scrollable;
			for(var i:int = 0; i < _scrollables.length; i++)
			{
				scrollable = _scrollables[i];
				_canvas.addChild(scrollable);
				scrollable.x = ((i % _config.scrollablesPerPage) + (uint(i / (_config.scrollablesPerPage * _config.scrollerRows)))*_config.scrollablesPerPage) * (_config.scrollableSize.x + _config.spacing);
				scrollable.y = uint(i/_config.scrollablesPerPage % _config.scrollerRows) * (_config.scrollableSize.y + _config.spacing);
			
			}
			
			_mask = new Sprite();
			DrawShape.drawRect(_mask.graphics, new Rectangle(0,0, _config.scrollerSize.x, _config.scrollerSize.y), new RectangleStyle(0xFF0000,0.2));
			addChild(_mask);
			_canvas.mask = _mask;
			
			scrollTo(_currentIndex);
		}
		public function get currentIndex():uint
		{
			return _currentIndex;
		}
		public function scrollTo(index:int):void
		{
			trace(index);
			var maxIndex:int = _scrollables.length - _config.scrollablesPerPage;
			if(index < 0)
			{
				index = 0;
			}
			else if(index > maxIndex)
			{
				index = maxIndex - 1;
			}
			if(index < 0) index = 0;
			_page = uint(index/(_config.scrollablesPerPage * _config.scrollerRows));
			var pageOffset:Number = _page * _config.scrollablesPerPage;
			
			var tweenX:Number = -((_config.scrollableSize.x + _config.spacing) * pageOffset);
			TweenLite.to(_canvas, 2, {x:tweenX, ease:100});
			// TweenLite.to(_canvas, 3, {x:tweenX, ease:Bounce.easeOut});
			_currentIndex = index;
			
			
		}
	}
}