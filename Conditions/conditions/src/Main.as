package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import operands.OperandGenerator;
	import operations.OperationGenerator;
	import series.Series;
	import series.SeriesElement;
	import statementLines.StatementLine;
	import statementLines.StatementLinesGenerator;
	import statementLines.StatementTracer;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// entry point
			/*
			var statementLinesGenerator:StatementLinesGenerator = new StatementLinesGenerator(new OperationGenerator(), new OperandGenerator());
			var statementLine:StatementLine = statementLinesGenerator.generateLine();
			
			StatementTracer.traceStatementLine(statementLine);
			*/
			
			var operationGenerator:OperationGenerator = new OperationGenerator();
			var operandGenerator:OperandGenerator = new OperandGenerator();
			
			var series:Series = new Series();
			
			Series(series).addElement(1, new SeriesElement(operandGenerator.generateRandomOperand(), operationGenerator.getRandomOperation(), operandGenerator.generateRandomOperand()));
			
			Series(series).traceValue();
		}
		
	}
	
}