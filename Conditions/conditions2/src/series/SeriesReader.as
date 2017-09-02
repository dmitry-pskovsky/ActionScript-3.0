package series 
{
	import operations.OperationPlus;
	import operations.OperationPriority;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class SeriesReader 
	{
		
		public function SeriesReader() 
		{
			
		}
		
		public static function readseries(series1:Series):Number
		{
			var result:Number = 0;
			var tempSeries:Series = series1.clone();
			var tempSeriesElement:SeriesElement;
			
			for (var j:int = 0; j < tempSeries.length; j++) 
			{
				if (tempSeries.getElement(j).operation.priority == OperationPriority.HIGHT)
				{
					if(j > 0)
					{
						tempSeriesElement = new SeriesElement(tempSeries.getElement(j - 1).operation, tempSeries.getElement(j).operation.apply(tempSeries.getElement(j - 1).value, tempSeries.getElement(j).value));
						tempSeries.removeElement(j - 1);
						tempSeries.removeElement(j - 1);
						tempSeries.addElement(j - 1, tempSeriesElement);
					}
					else
					{
						tempSeries.removeElement(j);
						tempSeries.addElement(j, new SeriesElement(new OperationPlus(), 0));
					}
					j--;
				}
			}
			
			for (var i:int = 0; i < tempSeries.length; i++) 
			{
				result = Series(tempSeries).getElement(i).operation.apply(result, Series(tempSeries).getElement(i).value);
			}
			
			return result;
		}
		
	}

}