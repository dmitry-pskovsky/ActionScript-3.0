package operands 
{
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class OperandGenerator 
	{
		private var _operands:Vector.<int>;
		
		public function OperandGenerator() 
		{
			_operands = new Vector.<int>();
			_operands.push(6);
			_operands.push(7);
		}
		
		public function generateRandomOperand():Number
		{
			var random:int = Math.random() * _operands.length;
			
			switch (random) 
			{
				case 0:
					return _operands[0];
				case 1:
					return _operands[1];

				default: return _operands[0];
			}
		}
		
	}

}