package operations 
{
	import operations.IOperation;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class OperationGenerator 
	{
		private static var _operations:Vector.<IOperation>
		
		public function OperationGenerator() 
		{

		}
		
		public static function initialize():void
		{
			_operations = new Vector.<IOperation>();
			_operations.push(new OperationPlus());
			_operations.push(new OperationMinus());
			_operations.push(new OperationMultiplication());
		}
		
		public static function getRandomOperation():IOperation
		{
			var random:int = Math.random() * _operations.length;
			
			switch (random) 
			{
				case 0:
					return _operations[0];
				case 1:
					return _operations[1];
				case 2:
					return _operations[2];

				default: return _operations[0];
			}
		}
		
	}

}