package events
{
	import vo.MovimientoVO;

	public class MovimientoEvent extends BaseEvent
	{
		public static const LISTAR:String = 'getAllMovimiento';
		public static const CREAR:String = 'crearMovimiento';
		
		public var movVO:MovimientoVO;
		public var filtros:Object;
		
		public function MovimientoEvent(type:String, _callback:Function = null, _movVO:MovimientoVO = null, _filtros:Object = null)
		{
			super(type);
			clase = "MovimientoEvent";			
			callback = _callback;
			this.movVO = _movVO;
			this.filtros = _filtros;
		}
	}
}