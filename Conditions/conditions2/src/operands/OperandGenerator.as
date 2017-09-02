package operands 
{
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class OperandGenerator 
	{
		private static var _operands:Vector.<int>;
		
		public function OperandGenerator() 
		{

		}
		
		public static function initialize():void
		{
			_operands = new Vector.<int>();
			_operands.push(1);
			_operands.push(3);
			//_operands.push(2);
		}
		
		public static function generateRandomOperand():Number
		{
			return int(Math.random() * 10);
			//----------------------------
			/*
			var random:int = Math.random() * _operands.length;
			
			switch (random) 
			{
				case 0:
					return _operands[0];
				case 1:
					return _operands[1];
				//case 2:
					//return _operands[2];

				default: return _operands[0];
			}
			*/
		}
		
	}

}