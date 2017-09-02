package series 
{
	import operations.IOperation;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class SeriesElement implements ISeriesElement, ITracableElement
	{
		protected var _operation:IOperation;
		protected var _value1:Number;
		protected var _value2:Number;
		
		public function SeriesElement(value1:Number, oparation:IOperation, value2:Number) 
		{
			_value1 = value1;
			_operation = operation;
			_value2 = value2;
		}
		
		public function get operation():IOperation 
		{
			return _operation;
		}
		
		public function set operation(value:IOperation):void 
		{
			_operation = value;
		}
		
		public function get value1():Number 
		{
			return _value1;
		}
		
		public function set value1(value:Number):void 
		{
			_value1 = value;
		}
		
		public function get value2():Number 
		{
			return _value2;
		}
		
		public function set value2(value:Number):void 
		{
			_value2 = value;
		}
		
		public function traceValue():void
		{
			trace(value1, operation.traceValue(), value2);
		}
		
	}

}