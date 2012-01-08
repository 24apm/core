package config
{
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class ScrollerConfig
	{
		public var scrollablesPerPage:uint;
		public var spacing:uint;
		public var scrollableSize:Point;
		public var scrollerSize:Point;
		

		public var scrollerRows:uint;
		
		public function ScrollerConfig(scrollableSize:Point, scrollerSize:Point, scrollablesPerPage:uint = 8, scrollerRows:uint = 1, spacing:uint = 0)
		{
			this.scrollableSize		= scrollableSize;
			this.scrollerSize 		= scrollerSize;
			this.spacing 			= spacing;
			this.scrollablesPerPage	= scrollablesPerPage;
			
			this.scrollerRows		= scrollerRows;
		}
	}
}