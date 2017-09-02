package evolution
{
	import flash.utils.getTimer;
	import operations.IOperation;
	import operations.OperationPriority;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Condition
	{
		
		public function Condition()
		{
		
		}
		
		public static function sortOut(elements:Vector.<IOrganizm>, ar:Array):Vector.<IOrganizm>
		{		
			
			ar.sortOn("value1", Array.NUMERIC);
			
			//trace(getTimer() - OperationPriority.duration, "---------------sort 1");
			//OperationPriority.duration = getTimer();
			
			var sorted:Array = [];
			var elements1:Array = [];
			
			elements1.push(ar[0]);
			
			for (var i:int = 0; i < ar.length; i++) 
			{
				if (i < ar.length - 1 && ar[i].value1 == ar[i + 1].value1)
				{
					elements1.push(ar[i + 1]);
				}
				else
				{
					elements1.sortOn("value2", Array.NUMERIC);
					sorted = sorted.concat(elements1);
					elements1 = [];
					if (i < ar.length - 1)
						elements1.push(ar[i + 1]);
				}
					
			}
			
			//trace(getTimer() - OperationPriority.duration, "---------------sort 2");
			//OperationPriority.duration = getTimer();

			sorted = sorted.splice(0, sorted.length / 2);
			sorted = sorted.splice(0, sorted.length / 2);
			sorted = sorted.splice(0, sorted.length / 2);
			sorted = sorted.splice(0, sorted.length / 2);

			var sorted2:Vector.<IOrganizm> = new Vector.<IOrganizm>();
			for (var j:int = 0; j < sorted.length; j++) 
			{
				sorted2.push(SeriesAdapter(sorted[j]));
			}
			
			return sorted2;
		}

	}

}