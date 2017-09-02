package squares 
{
	import flash.accessibility.AccessibilityProperties;
	import flash.display.LoaderInfo;
	import flash.geom.Point;
	import flash.geom.Transform;
	import flash.geom.Rectangle;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import mx.core.IFlexDisplayObject;
	import squares.squareStyles.SquareStyle;
	import squareStyles.DefaultStyle;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class SquareView extends Sprite
	{
		private var _squareProperties:SquareProperties;
		private var _squareStyle:SquareStyle;
		
		public function SquareView(squareProperties:SquareProperties = new SquareProperties(0, 0, 10, 10), squareStyle:SquareStyle = new DefaultStyle()) 
		{
			_squareProperties = squareProperties;
			_squareStyle = squareStyle;
			initialize();
		}
		
		private function initialize():void 
		{
			graphics.beginFill(_squareStyle.fillColor, _squareStyle.filAlpha);
			graphics.drawRect(_squareProperties.x, _squareProperties.y, _squareProperties.width, _squareProperties.height);
			graphics.lineStyle(_squareStyle.thikness, _squareStyle.lineColor, _squareStyle.lineAlpha);
		}
		
	}

}