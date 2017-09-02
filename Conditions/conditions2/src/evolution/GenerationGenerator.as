package evolution 
{
	import operands.OperandGenerator;
	import operations.OperationGenerator;
	import operations.OperationMinus;
	import series.Series;
	import series.SeriesElementGenerator;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class GenerationGenerator 
	{
		
		public function GenerationGenerator() 
		{
			
		}
		
		public function generate(seriestList:Vector.<Series>):Vector.<Series>
		{
			var series1:Series;
			var newSeriesList:Vector.<Series> = new Vector.<Series>();
			var tempSeries:Series;
			
			for (var i:int = 0; i < seriestList.length; i++) 
			{
				newSeriesList.push(seriestList[i]);
				//tempSeries = seriestList[i].clone();
				series1 = seriestList[i].clone();
				for (var j:int = 0; j < 15; j++) 
				{
					//series1 = tempSeries.clone();
					
					var r:int = Math.random() * 4;
					switch (r) 
					{
						case 0:
						{
							series1.addElement(Math.random() * series1.length, SeriesElementGenerator.generateElement());
							break;
						}
						case 1:
						{
							if(series1.length > 1)
								series1.removeElement(Math.random() * series1.length);
							break;
						}
						case 2:
						{
							series1.getElement(Math.random() * series1.length).operation = OperationGenerator.getRandomOperation();
							break;
						}
						case 3:
						{
							series1.getElement(Math.random() * series1.length).value = OperandGenerator.generateRandomOperand();
							break;
						}
						default:
						{
							break;
						}
					}
					
					newSeriesList.push(series1.clone());
				}
			}
			
			return newSeriesList;

		}
		
	}

}