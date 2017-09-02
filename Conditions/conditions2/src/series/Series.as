package series 
{
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Series implements ITracableElement
	{
		private var _elements:Vector.<ISeriesElement>;
		
		public function Series() 
		{
			
		}
		
		public function get length():int
		{
			return _elements.length;
		}
		
		public function addElement(index:int, seriesElement:SeriesElement):void
		{
			if (!_elements)
				_elements = new Vector.<ISeriesElement>();
				
			if (index > _elements.length)
				_elements.push(seriesElement);
			else
				_elements.splice(index, 0, seriesElement);
		}
		
		public function removeElement(index:int):void
		{
			if (!_elements)
				return;
				
			if (index > _elements.length)
				return;
			
			_elements.splice(index, 1);
		}
		
		public function getElement(index:int):ISeriesElement
		{
			if (index > _elements.length || index < 0)
				return null;
			else
				return _elements[index];
		}
		
		public function traceValue():String
		{
			var str:String = "";
			
			for (var i:int = 0; i < _elements.length; i++) 
			{
				str += _elements[i].operation.traceValue() + _elements[i].value;
			}
			
			return str;
		}
		
		public function clone():Series
		{
			var series1:Series = new Series();
			
			for (var i:int = 0; i < _elements.length; i++) 
			{
				series1.addElement(i, new SeriesElement(_elements[i].operation, _elements[i].value));
			}
			
			return series1;
		}
		
	}

}