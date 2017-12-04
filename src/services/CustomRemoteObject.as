package services
{
	
	
	
	import modelo.ModelApp;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.InvokeEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public dynamic class CustomRemoteObject extends RemoteObject
	{
		public var item:*;
		public var callback:Function;
		
		[Bindable] private var modelApp:ModelApp = ModelApp.getInstance();
		public function CustomRemoteObject(destination:String=null)
		{
			super(destination);
			addEventListener(ResultEvent.RESULT, fnDesbloqueo);
			addEventListener(FaultEvent.FAULT, fnDesbloqueo);
			addEventListener(InvokeEvent.INVOKE, fnBloqueo);
		}
		
		private function fnDesbloqueo(e:*):void{
			modelApp.cntrBl--;
		}
		
		private function fnBloqueo(e:*):void{
			modelApp.cntrBl++;
		}
	}
}