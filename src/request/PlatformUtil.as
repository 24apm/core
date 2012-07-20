package request
{
	//import com.adobe.serialization.json.JSON;
	
	import com.adobe.serialization.json.JSON;
	
	import flash.external.ExternalInterface;
	import flash.utils.Dictionary;

	public class PlatformUtil
	{
		private static var _calls:Dictionary;
		private static var _token:uint = 0;
		
		private static const PLATFORM_CALLBACK:String = "platformCallback";
		public function PlatformUtil()
		{
		}
		public static function init():void
		{
			_calls = new Dictionary();
			ExternalInterface.addCallback(PLATFORM_CALLBACK,callback);
			
			
		}
		public static function call(funcName:String, onComplete:Function = null, funcParams:Object = null):void
		{
			_calls[_token] = onComplete;
			//trace("platform call: token:" + String(_token) + ", funcName:" + funcName + ", params:" + JSON.encode(funcParams));
			ExternalInterface.call(funcName, _token++, funcParams);	
		}
		protected static function callback(token:uint, callbackParams:Object = null):void
		{
			//trace("patformCallBack: token:" + String(_token) + ", params:" + JSON.encode(callbackParams));

			if(_calls[token])
			{
				_calls[token](callbackParams);	
				_calls[token] = null;
				delete(_calls[token]);
			}
		}
		public static function getMyData():Object
		{
			return ExternalInterface.call("getMe");
		}

		public static function publish():void
		{
			ExternalInterface.call("publish");
		}
		public static function request(uid:String = ""):void
		{
			ExternalInterface.call("request", uid);
		}
	}
}