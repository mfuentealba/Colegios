package events
{
	public class TipoDocumentoEvent extends BaseEvent
	{
		public static const LISTAR:String = 'getAllTipoDocumento';
		public function TipoDocumentoEvent(type:String, _callback:Function = null)
		{
			super(type, bubbles, cancelable);
			clase = "TipoDocumentoEvent";			
			callback = _callback;
		}
	}
}