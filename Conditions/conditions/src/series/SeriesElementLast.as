package series 
{
	import operations.OperationPlus;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class SeriesElementLast extends SeriesElement 
	{

		public function SeriesElementLast(value:Number) 
		{
			_value1 = value;
			_operation = new OperationPlus();
			_value2 = 0;
		}
		
	}

}