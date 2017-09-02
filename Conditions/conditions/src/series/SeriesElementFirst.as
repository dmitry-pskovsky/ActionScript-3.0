package series 
{
	import operations.OperationPlus;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class SeriesElementFirst extends SeriesElement
	{
		
		public function SeriesElementFirst(value:Number) 
		{
			_value1 = 0;
			_operation = new OperationPlus();
			_value2 = value;
		}
		
	}

}