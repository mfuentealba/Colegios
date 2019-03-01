package events
{
	import vo.UserVO;

	public class UserEvent extends BaseEvent
	{
		public static const LOGIN:String = 'fnLogin';
		public static const CAMBIO_PASS:String = 'fnPassUpdate';
		public var userVO:UserVO
		public function UserEvent(type:String, _callback:Function = null)
		{
			super(type, bubbles, cancelable);
			clase = "UserEvent";			
			callback = _callback;
		}
	}
}