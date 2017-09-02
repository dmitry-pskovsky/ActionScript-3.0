package evolution 
{
	import series.Series;
	import series.SeriesReader;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class SeriesAdapter implements IOrganizm
	{
		private var _series:Series;
		
		public function SeriesAdapter(series:Series) 
		{
			_series = series;
		}
		
		/* INTERFACE evolution.IOrganizm */
		
		public function get value1():int 
		{
			var value:int;
			value = Math.abs(IdealNumber.number - SeriesReader.readseries(_series));
			return value;
		}
		
		public function get value2():int 
		{
			return _series.length;
		}
		
		public function get value():int
		{
			return value1 + value2;
		}
		
		public function get series():Series 
		{
			return _series;
		}
		
		public static function adaptSeries(seriesList:Vector.<Series>):Vector.<IOrganizm>
		{
			var array:Vector.<IOrganizm> = new Vector.<IOrganizm>();
			
			for (var i:int = 0; i < seriesList.length; i++) 
			{
				array.push(new SeriesAdapter(seriesList[i]));
			}
			
			return array;
		}
		
		public static function returnSeries(organizmList:Vector.<IOrganizm>):Vector.<Series>
		{
			var array:Vector.<Series> = new Vector.<Series>();
			
			for (var i:int = 0; i < organizmList.length; i++) 
			{
				array.push(organizmList[i].series);
			}
			
			return array;
		}
		
	}

}