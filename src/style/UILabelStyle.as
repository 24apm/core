package style
{
	import flash.text.TextFormat;
	
	import flashx.textLayout.formats.TextAlign;
	
	public class UILabelStyle
	{
		public var font:String;
		public var size:uint;
		public var align:String;
		public var indent:Object;
		public var leading:Object;
		public var bold:Boolean;
		public function UILabelStyle(font:String="Arial", size:uint = 12, align:String="center", bold:Boolean = false, indent:Object=null, leading:Object=null)
		{
			this.font = font;
			this.size = size;
			this.align = align;
			this.indent = indent;
			this.leading = leading;
			this.bold = bold;
		}
	}
}