package config
{
	public class UILoaderConfig
	{
		public static const TOP_LEFT:String = "topLeft";
		public static const CENTER:String = "center";
		
		public var orientation:String;
		public function UILoaderConfig(orientation:String)
		{
			this.orientation = orientation;
		}
		public static function dummy():UILoaderConfig
		{
			return new UILoaderConfig(TOP_LEFT);
		}

	}
}