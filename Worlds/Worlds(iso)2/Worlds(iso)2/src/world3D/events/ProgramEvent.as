package world3D.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class ProgramEvent extends Event 
	{
		public static const ON_RENDER_TICK:String = 'onRenderTick';
		public static const GET_DIAGRAMM_INFO:String = 'GetDiagrammInfo';
		public static const GET_GRAPHIC_INFO:String = 'GetGraphicInfo';
		
		private var _data:Object;
		
		public function ProgramEvent(type:String, data:Object = null) 
		{
			super(type);
			
			_data = data;
		}
		
		public function get data():Object 
		{
			return _data;
		}
		
	}

}