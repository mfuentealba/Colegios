package vo
{
	import modelo.ModelApp;

	[Bindable]
	[RemoteClass(alias="Weborb.ContaColegio.MovimientoVO")]
	public class MovimientoVO
	{
		public var id:int;
		public var glosa:String;
		public var tipo_movimiento:String;
		
		public var tipo_documento:String;
		public var nro_doc:int
		private var _id_proveedor:int;
		private var _id_fuente_financiera:int;
		public var monto:int;
		public var cod_cuenta:String;
		public var cod_contable:String;
		public var fec_mvto:String;
		public var fec_ing:String;
		public var proveedor:ProveedorVO;
		public var estado:String;
		public var deuda:String;
		public var periodo:String;
		private var _forma_pago:int;
		public var formaPago:MovimientoFormaPagoVO;
		public var user:String;
		public var financiamiento:FinanciamientoVO;
		public var saldoCaja:int = 0;
		public var deudaAcum:int = 0;
		public var resultado:int = 0;
		public var asociado:int = 0;
		public var pago:int = 0;
		/*
		public var compromiso:CompromisoVO;
		public var arrPagos:Array;
		*/

		public function get id_fuente_financiera():int
		{
			return _id_fuente_financiera;
		}

		public function set id_fuente_financiera(value:int):void
		{
			_id_fuente_financiera = value;
			var modelApp:ModelApp = ModelApp.getInstance();
			this.financiamiento = modelApp.objFinanciamiento[value];
		}

		public function get forma_pago():int
		{
			return _forma_pago;
		}

		public function set forma_pago(value:int):void
		{
			_forma_pago = value;
			var modelApp:ModelApp = ModelApp.getInstance();
			this.formaPago = modelApp.objFormaPago[value];
		}

		public function get id_proveedor():int
		{
			return _id_proveedor;
		}

		public function set id_proveedor(value:int):void
		{
			_id_proveedor = value;
			var modelApp:ModelApp = ModelApp.getInstance();
			this.proveedor = modelApp.objProveedor[value];
			
		}

	}
}