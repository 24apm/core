package ui
{
	import config.ScrollerArrowsConfig;
	import config.ScrollerConfig;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import style.RectangleStyle;
	import style.Style;
	
	import util.DrawShape;

	public class Minimap extends UIElement
	{
		private var _background:Sprite;
		private var _scrollerMap:Scroller;
		private static const MAP_SIZE:uint = 20;
		private static const MAP_SPACING:uint = 2;
		private static var _mapConfig:Rectangle = new Rectangle(0,0,MAP_SIZE,MAP_SIZE);
		private static var _mapStyle:RectangleStyle = new RectangleStyle(0x777777);
		public function Minimap()
		{
			super();
		}
		protected override function init(e:Event=null):void
		{
			super.init(e);
			_background = new Sprite();
			addChild(_background);
			DrawShape.drawRect(_background.graphics, new Rectangle(0,0,200,50), new RectangleStyle());
			initMaps();
		}
		private function initMaps():void
		{
			var map:UIElement;
			var hori:uint = 10;
			var vert:uint = 4;
			
		
			var config:ScrollerConfig = new ScrollerConfig(new Point(MAP_SIZE,MAP_SIZE), new Point(500, 500), 10, 5, MAP_SPACING);
			var scrollables:Vector.<Scrollable> = new Vector.<Scrollable>();
			
			for (var i:uint = 0 ; i < 1; i++)
			{
				map = new UIElement();
				map.addChild(new UILabel(i.toString(), Style.labelStyleBasic));
				DrawShape.drawRect(map.graphics, _mapConfig, _mapStyle);
				//scrollables.push(new Scrollable(map));
			}
			_scrollerMap = new Scroller(scrollables, config);
			
			var scrollerArrows:ScrollerArrows = new ScrollerArrows(_scrollerMap, new ScrollerArrowsConfig(10));
			addChild(scrollerArrows);

		}
	}
}