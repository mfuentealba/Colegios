package vo
{
	import modelo.ModelApp;

	[Bindable]
	[RemoteClass(alias="Weborb.ContaColegio.MovimientoSaldoVO")]
	public class MovimientoSaldoVO
	{
		public var id:String;
		public var id_padre:String;
		public var saldo_caja:int;
		public var deuda_acumulada:int;		
		public var resultado:int;
		

	}
}