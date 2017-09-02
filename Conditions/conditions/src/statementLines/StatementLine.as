package statementLines 
{
	import operands.OperandGenerator;
	import operations.OperationGenerator;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class StatementLine 
	{
		private var _statements:Vector.<Statement>;
		private var _operationGenerator:OperationGenerator;
		private var _operandGenerator:OperandGenerator;
		private var _result:Number;
		
		public function StatementLine(oparationGenerator:OperationGenerator, operandGenerator:OperandGenerator) 
		{
			_operationGenerator = oparationGenerator;
			_operandGenerator = operandGenerator;
			_statements = new Vector.<Statement>();
		}
		
		public function createStatement():void
		{
			var statement:Statement = new Statement(_operandGenerator.generateRandomOperand(), _operationGenerator.getRandomOperation(), _operandGenerator.generateRandomOperand());
			_statements.push(statement);
		}
		
		public function addStatement():void
		{
			var statement:Statement = new Statement(_statements[_statements.length - 1].result, _operationGenerator.getRandomOperation(), _operandGenerator.generateRandomOperand());
			_statements.push(statement);
		}
		
		public function get statements():Vector.<Statement> 
		{
			return _statements;
		}
		
		public function get result():Number 
		{
			return _statements[_statements.length - 1].result;
		}
		
	}

}