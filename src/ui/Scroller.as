package ui
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.EaseLookup;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.Strong;
	
	import config.ScrollerConfig;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import spark.effects.easing.EaseInOutBase;
	
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
		
		private var _uniqueScrollableId:uint = 0;
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
			for(var i:uint = 0; i < _scrollables.length; i++)
			{
				addScrollable(_scrollables[i]);
			}
			positionScrollables();
			
			_mask = new Sprite();
			DrawShape.drawRect(_mask.graphics, new Rectangle(0,0, _config.scrollerSize.x, _config.scrollerSize.y), new RectangleStyle(0xFF0000,0.2));
			addChild(_mask);
			_canvas.mask = _mask;
			
			scrollTo(_currentIndex);
		}
		private function assignUniqueId(scrollable:Scrollable):void
		{
			scrollable.id = _uniqueScrollableId++;
		}
		public function addScrollables(scrollables:Vector.<Scrollable>):void
		{
			for (var i:uint = 0; i < scrollables.length; i++)
			{
				_scrollables.push(scrollables[i]);
				addScrollable(scrollables[i]);
			}
			positionScrollables();
		}
		private function addScrollable(scrollable:Scrollable):void
		{
			assignUniqueId(scrollable);
			_canvas.addChild(scrollable);
		}
		public function removeScrollableById(id:uint):void
		{
			// finding the vector's actual index based on id
			var foundIndex:int = -1;
			for (var i:uint; i < _scrollables.length; i++)
			{
				if(_scrollables[i].id == id)
				{
					foundIndex = i;
					break;
				}
			}
			
			// remove scrollable
			if(foundIndex > -1)
			{
				_scrollables[foundIndex].destruct();
				_scrollables[foundIndex] = null;
				_scrollables.splice(foundIndex, 1);
			}
			
			positionScrollables();
			
		}
		private function positionScrollables():void
		{
			var scrollable:Scrollable;
			for(var i:int = 0; i < _scrollables.length; i++)
			{
				scrollable = _scrollables[i];
				scrollable.x = ((i % _config.scrollablesPerRow) + (uint(i / (_config.scrollablesPerRow * _config.scrollerRows)))*_config.scrollablesPerRow) * (_config.scrollableSize.x + _config.spacing);
				scrollable.y = uint(i/_config.scrollablesPerRow % _config.scrollerRows) * (_config.scrollableSize.y + _config.spacing);
			}
		}
		public function get currentIndex():uint
		{
			return _currentIndex;
		}
		public function scrollTo(index:int):void
		{
			trace(index);
			var scrollablesPerPage:uint = _config.scrollablesPerRow*_config.scrollerRows;
			
			var maxIndex:int;
			// multi line
			if(_config.scrollerRows > 1)
			{
				maxIndex = _scrollables.length;
			}
			// single line
			else
			{
				maxIndex = _scrollables.length - scrollablesPerPage;
			}
				
			if(index < 0)
			{
				index = 0;
			}
			else if(index > maxIndex)
			{
				index = maxIndex - 1;
			}
			if(index < 0) index = 0;
			_page = uint(index/scrollablesPerPage);
			var pageOffset:Number = _page * _config.scrollablesPerRow;
			
			var tweenX:Number = -((_config.scrollableSize.x + _config.spacing) * pageOffset);
			TweenLite.to(_canvas, 1.5, {x:tweenX, ease:100});
			
			// TweenLite.to(_canvas, 3, {x:tweenX, ease:Bounce.easeOut});
			_currentIndex = index;
		}
	}
}