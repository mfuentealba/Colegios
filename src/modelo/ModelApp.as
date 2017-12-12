package modelo
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class ModelApp
	{
		public static var modelApp:ModelApp;
		public var objProveedor:Object = {};
		public var objFinanciamiento:Object = {};
		public var arrProveedor:ArrayCollection = new ArrayCollection();
		public var cntrBl:int = 0;
		public var arrTipoMovimiento:ArrayCollection;
		public var arrFinanciamiento:ArrayCollection;// = new ArrayCollection([{id: 1, nombre: 'OP 1'}, {id: 2, nombre: 'OP 2'}]);
		public var arrFormaPago:ArrayCollection;
		public var arrMovimiento:ArrayCollection = new ArrayCollection();
		public var arrTipoDocumento:ArrayCollection;
		public var objTipoMovimiento:Object = {};
		public var objMovimiento:Object = {};
		public var objFormaPago:Object = {};
		public var objTipoDocumento:Object = {};
		public var arrYears:Array = [{label: 2016, data: 2016}, {label: 2017, data: 2017}, {label: 2018, data: 2018}, {label: 2019, data: 2019}, {label: 2020, data: 2020}, {label: 2021, data: 2021}, {label: 2022, data: 2022}, {label: 2023, data: 2023}];
		public var saldoCaja:int = 0;
		public var deuda:int = 0;
		public var resultado:int = 0;
		public var saldoCajaAcum:int = 0;
		public var deudaAcum:int = 0;
		public var resultadoAcum:int = 0;
		
		public function ModelApp()
		{
			if(modelApp){
				throw new Error("Singleton... use getInstance()");
			} 
			modelApp = this;
		}
		
		public static function getInstance():ModelApp
		{
			if ( modelApp == null ){
				modelApp = new ModelApp();
			}
			
			return modelApp;
		}
	}
}