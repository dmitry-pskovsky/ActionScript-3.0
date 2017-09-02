package statementLines 
{
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class StatementTracer 
	{
		
		public function StatementTracer() 
		{
			
		}
		
		public static function traceStatementLine(statementLine:StatementLine):void
		{
			var line:String = statementLine.statements[0].traceFirst();
			
			for (var i:int = 1; i < statementLine.statements.length; i++)
			{
				line += statementLine.statements[i].traceNext();
			}
			
			line += "=" + statementLine.result;
			
			trace(line);
		}
		
	}

}