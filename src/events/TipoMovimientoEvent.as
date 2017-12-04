package events
{
	public class TipoMovimientoEvent extends BaseEvent
	{
		public static const LISTAR:String = 'getAllTipoMovimiento';
		public function TipoMovimientoEvent(type:String, _callback:Function = null)
		{
			super(type, bubbles, cancelable);
			clase = "TipoMovimientoEvent";			
			callback = _callback;
		}
	}
}