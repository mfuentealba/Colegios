package vo
{
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
		public var id_fuente_financiera:int;
		public var monto:int;
		public var cod_cuenta:String;
		public var cod_contable:String;
		public var fec_mvto:String;
		public var fec_ing:String;
		public var proveedor:ProveedorVO;
		
		/*
		public var compromiso:CompromisoVO;
		public var arrPagos:Array;
		*/

		public function get id_proveedor():int
		{
			return _id_proveedor;
		}

		public function set id_proveedor(value:int):void
		{
			_id_proveedor = value;
			
		}

	}
}