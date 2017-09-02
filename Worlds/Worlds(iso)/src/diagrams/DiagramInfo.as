package diagrams 
{
	import events.ProgramEvent;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import gui.templates.DiagramInfoTemplate;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class DiagramInfo extends Sprite
	{
		private var _template:DiagramInfoTemplate;
		private var values:Array;
		
		public function DiagramInfo() 
		{
			_template = new DiagramInfoTemplate();
			addChild(_template);
			
			initialize();
		}
		
		private function initialize():void 
		{
			values = [];
			
			_template.row1Info.nameTextField.text = 'row 1:';
			_template.row2Info.nameTextField.text = 'row 2:';
			_template.row3Info.nameTextField.text = 'row 3:';
			_template.row4Info.nameTextField.text = 'row 4:';
			_template.row5Info.nameTextField.text = 'row 5:';
			
			_template.actionButton.addEventListener(MouseEvent.CLICK, clickHandler, false, 0, true);
		}
		
		private function clickHandler(event:MouseEvent):void 
		{
			var rowsInfo:Vector.<DiagramRowInfo> = new Vector.<DiagramRowInfo>();
			
			for (var i:int = 1; i < 6; i++)
			{
				values[i - 1] = int(_template['row' + i + 'Info'].valueTextField.text);
				rowsInfo.push(new DiagramRowInfo(values[i - 1]));
			}
			
			ProgrammRoot.dispatchEvent(new ProgramEvent(ProgramEvent.GET_DIAGRAMM_INFO, { rowsInfo:rowsInfo } ));

		}
		
	}

}