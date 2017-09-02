package series 
{
	import operands.OperandGenerator;
	import operations.OperationGenerator;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class SeriesElementGenerator 
	{
		
		public function SeriesElementGenerator() 
		{
			
		}
		
		public static function generateElement():SeriesElement
		{
			return new SeriesElement(OperationGenerator.getRandomOperation(), OperandGenerator.generateRandomOperand());
		}
		
	}

}