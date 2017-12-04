package services
{
	
	
	
	import com.adobe.serialization.json.JSON;
	
	import flash.events.EventDispatcher;
	import flash.net.Responder;
	
	import flashx.textLayout.events.ModelChange;
	
	import model.ModelApp;
	
	import mx.collections.ArrayCollection;
	import mx.managers.CursorManager;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;

	public class DelegadoNode extends EventDispatcher
	{
		
		
		protected var dbAsyncToken:AsyncToken;
		
		private var cache:ArrayCollection;
		
		public static const MOCK_ASYNC_TIME:int = 100;
		
		private var lastId:int;
		
		private static var delegado:DelegadoNode;
		private var connNode:ConexionSocket = ModelApp.getInstance().conexion;
		private var _callbackRecep:Function;
		
		public static function getInstance():DelegadoNode
		{
			if ( delegado== null ){
				delegado = new DelegadoNode();
				
			}			
			return delegado;
		}
		
		public function DelegadoNode()
		{
			if(delegado){
				throw new Error("Singleton... use getInstance()");
				
			} 
			
			delegado = this;
			init();
		}
		
		private function init():void
		{
			
			/*****CREA EL DIRECTORIO QUE NECESITO PARA LA BASE****/
			connNode.callbackRecep = this.callbackRecep;

		}
		
		public function fnIdentificarUsuario(callback:Function):void{
			connNode.envia('LOGIN|' + ModelApp.getInstance().usuarioActivo.username + '|', callback);
		}
		
		

		public function get callbackRecep():Function
		{
			return _callbackRecep;
		}

		public function set callbackRecep(value:Function):void
		{
			_callbackRecep = value;
			this.connNode.callbackRecep = value;
		}
		
		
	}
}