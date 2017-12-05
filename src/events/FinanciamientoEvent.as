package events
{
	public class FinanciamientoEvent extends BaseEvent
	{
		public static const LISTAR:String = 'getAllFinanciamiento';
		public function FinanciamientoEvent(type:String, _callback:Function = null)
		{
			super(type);
			clase = "FinanciamientoEvent";			
			callback = _callback;
		}
	}
}