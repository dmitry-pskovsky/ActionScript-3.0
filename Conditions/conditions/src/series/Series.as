package series 
{
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Series implements ITracableElement
	{
		private var _elements:Vector.<ISeriesElement>;
		private var _exElements:Vector.<ISeriesElement>;
		
		public function Series() 
		{

		}
		
		public function addElement(index:int, seriesElement:SeriesElement):void
		{
			_elements = _exElements;
			
			if (!_elements)
			{
				_elements = new Vector.<ISeriesElement>();
				_elements.push(new SeriesElementFirst(0));
				_elements.push(new SeriesElementLast(0));
			}
				
			if (index > _elements.length - 2)
			{
				_elements.pop();
				_elements.push(seriesElement);
				_elements.push(new SeriesElementLast(0));
			}
			else
			{
				_elements.splice(index + 1, 0, seriesElement);
			}
			
			update();

		}
		
		public function update():void
		{
			for (var i:int = 0; i < _elements.length; i++) 
			{
				if (i == 0)
				{
					_elements[i].value2 = _elements[i + 1].value1;
					continue;
				}
				
				if (i > 0 && _elements[i - 1])
				{
					_elements[i].value1 = _elements[i - 1].value2;
				}
					
			}
		}
		
		public function removeElement(index:int, seriesElement:SeriesElement):void
		{
			
		}
		
		public function traceValue():void
		{
			for (var i:int = 0; i < _elements.length; i++) 
			{
				ITracableElement(_elements[i]).traceValue();
			}
		}
		
		public function get result():Number
		{
			return 0;
		}
		
		public function hello():void
		{
			
		}
		
	}

}