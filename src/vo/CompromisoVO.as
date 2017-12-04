package vo
{
	public class CompromisoVO
	{
		public function CompromisoVO()
		{
			public var id:int;
			public var glosa:String;
			public var tipo:String;//Ingreso o Egreso
			public var fecha:String;
			public static const INGRESO:String = 'Ingreso';
			public static const EGRESO:String = 'Egreso';
		}
	}
}