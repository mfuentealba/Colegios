package modelo
{
	
	import flash.globalization.NumberFormatter;
	
	import mx.collections.ArrayCollection;
	
	import vo.MovimientoSaldoVO;
	import vo.UserVO;

	[Bindable]
	public class ModelApp
	{
		public var indexPantalla:int = 0;
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
		public var arrYears:Array = [{label: 2016, data: 2016}, {label: 2017, data: 2017}, {label: 2018, data: 2018}, {label: 2019, data: 2019}, {label: 2020, data: 2020}, {label: 2021, data: 2021}, {label: 2022, data: 2022}, {label: 2023, data: 2023}, {label: 2024, data: 2024}, {label: 2025, data: 2025}, {label: 2026, data: 2026}, {label: 2027, data: 2027}, {label: 2028, data: 2028}, {label: 2029, data: 2029}, {label: 2030, data: 2030}];
		public var arrMeses:Array = [{label: 'Todos', data: '00'}, {label: 'Enero', data: '01'}, {label: 'Febrero', data: '02'}, {label: 'Marzo', data: '03'}, {label: 'Abril', data: '04'}, {label: 'Mayo', data: '05'}, {label: 'Junio', data: '06'}, {label: 'Julio', data: '07'}, {label: 'Agosto', data: '08'}, {label: 'Septiembre', data: '09'}, {label: 'Octubre', data: 10}, {label: 'Noviembre', data: 11}, {label: 'Diciembre', data: 12}];
		public var saldoCaja:int = 0;
		public var deuda:int = 0;
		public var resultado:int = 0;
		public var saldoCajaAcum:int = 0;
		public var deudaAcum:int = 0;
		public var resultadoAcum:int = 0;
		public var periodo:MovimientoSaldoVO = new MovimientoSaldoVO();
		public var userVO:UserVO;
		public var nf:NumberFormatter = new NumberFormatter('');
		
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