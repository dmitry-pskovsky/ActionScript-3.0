package statementLines 
{
	import operands.OperandGenerator;
	import operations.OperationGenerator;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class StatementLinesGenerator 
	{
		private var _operationGenerator:OperationGenerator;
		private var _operandGenerator:OperandGenerator;
		
		public function StatementLinesGenerator(oparationGenerator:OperationGenerator, operandGenerator:OperandGenerator) 
		{
			_operationGenerator = oparationGenerator;
			_operandGenerator = operandGenerator;
		}
		
		public function generateLine():StatementLine
		{
			var statementLine:StatementLine = new StatementLine(_operationGenerator, _operandGenerator);
			statementLine.createStatement();
			
			for (var i:int = 0; i < 10; i++) 
			{
				statementLine.addStatement();
			}
			
			return statementLine;
		}
		
	}

}