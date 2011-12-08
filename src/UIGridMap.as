package
{
	import flash.events.Event;
	import flash.geom.Point;

	public class UIGridMap extends UIElement
	{
		private var _gridMap:Vector.<UIGrid>;
		private var _tiles:Point;
		private var _gridSize:Point;
		private var _items:Vector.<UIElement>;
		private var _numberOfTiles:uint;
		/**
		 * @number 		= #of tiles x and y
		 * @gridSize	= gridMap size width and height
		 */
		public function UIGridMap(dimension:Point, gridSize:Point)
		{
			super();
			_gridSize = gridSize;
			_tiles = dimension;
		}
		public function get maxTiles():uint
		{
			return _numberOfTiles;
		}
		public function get hasSpace():Boolean
		{
			if(_items.length < _numberOfTiles)
				return true;
			else
				return false;
		}
		protected override function init(e:Event = null):void
		{
			super.init(e);
			
			_gridMap = new Vector.<UIGrid>();
			_items = new Vector.<UIElement>();
			
			var tilesWidth:Number = _gridSize.x / _tiles.x;
			var tilesHeight:Number = _gridSize.y / _tiles.y;
			var tilePoint:Point = new Point(tilesWidth, tilesHeight);
			_numberOfTiles = _tiles.x * _tiles.y;
			
			for (var i:int = 0; i < _numberOfTiles; i++)
			{
				var tile:UIGrid = new UIGrid(tilePoint);
				addChild(tile);
				
				_gridMap.push(tile);
				tile.x = i%_tiles.x * tilesWidth;
				tile.y = Math.floor(i/_tiles.x) * tilesHeight;
			}
		}
		public function addItem(item:UIElement):void
		{
			_items.push(item);
			_gridMap[_items.length-1].addItem(item);
		}
		public function getTileAt(p:Point):UIGrid
		{
			// todo
			return _gridMap[p.x + p.y*_tiles.x];
		}
	}
}