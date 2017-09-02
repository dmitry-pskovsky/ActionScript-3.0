package series 
{
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class SeriesGenerator 
	{
		
		public function SeriesGenerator() 
		{
			
		}
		
		public static function generate(length:int):Series
		{
			var series1:Series = new Series();
			
			for (var i:int = 0; i < length; i++) 
			{
				series1.addElement(1, SeriesElementGenerator.generateElement());
			}
			
			return series1;
		}
		
	}

}