package style
{
	import flash.filters.DropShadowFilter;
	
	import flashx.textLayout.formats.TextAlign;

	public class Style
	{
		public static const ARIAL:String = "Arial";
		public static const dropShadow:DropShadowFilter = new DropShadowFilter(7,45,0,0.75,7,7);
		
		public static const labelStyleBasic:UILabelStyle = new UILabelStyle();
		public static const labelStyleHeader:UILabelStyle = new UILabelStyle(ARIAL, 32, TextAlign.CENTER, true);
		public function Style()
		{
		}
	}
}