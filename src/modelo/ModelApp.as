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
		public var arrMovimiento:ArrayCollection = new ArrayCollection();
		public var arrTipoDocumento:ArrayCollection;
		public var objTipoMovimiento:Object = {};
		public var objMovimiento:Object = {};
		public var objTipoDocumento:Object = {};
		
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