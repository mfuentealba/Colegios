package events
{
	

	public class GenerarPlanillasEvent extends BaseEvent
	{
		public static const GENERAR_PLANILLAS:String = 'fnGenerarPlamillas';
		public var year:String;
		
		public function GenerarPlanillasEvent(type:String, _year:String, _callback:Function = null)
		{
			super(type, bubbles, cancelable);
			clase = "GenerarPlanillasEvent";
			this.year = _year;
			callback = _callback;
		}
	}
}