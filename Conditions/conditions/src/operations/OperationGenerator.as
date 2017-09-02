package operations 
{
	import operations.IOperation;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class OperationGenerator 
	{
		private var _operations:Vector.<IOperation>
		
		public function OperationGenerator() 
		{
			_operations = new Vector.<IOperation>();
			_operations.push(new OperationPlus());
			_operations.push(new OperationMinus());
		}
		
		public function getRandomOperation():IOperation
		{
			var random:int = Math.random() * _operations.length;
			
			switch (random) 
			{
				case 0:
					return _operations[0];
				case 1:
					return _operations[1];

				default: return _operations[0];
			}
		}
		
	}

}