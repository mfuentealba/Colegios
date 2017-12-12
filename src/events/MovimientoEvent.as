package events
{
	import vo.MovimientoVO;

	public class MovimientoEvent extends BaseEvent
	{
		public static const LISTAR:String = 'getAllMovimiento';
		public static const CREAR:String = 'crearMovimiento';
		public static const CREAR_SALDO:String = 'crearMovimientoSaldo';
		public static const ELIMINAR:String = 'deleteMovimiento';
		public static const LISTAR_FORMA_PAGO:String = 'fnFormaPago';
		public static const PERIODO_ANTERIOR:String = 'getCierrePeriodo';
		
		public var movVO:*;
		public var filtros:Object;
		
		public function MovimientoEvent(type:String, _callback:Function = null, _movVO:* = null, _filtros:Object = null)
		{
			super(type);
			clase = "MovimientoEvent";			
			callback = _callback;
			this.movVO = _movVO;
			this.filtros = _filtros;
		}
	}
}