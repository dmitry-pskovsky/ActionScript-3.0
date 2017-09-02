package world3D.graphics3D
{
	import org.papervision3d.core.math.Number3D;
	import org.papervision3d.materials.special.LineMaterial;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Diagram extends Axes 
	{
		private var _divisionSize:int;
		private var _points:Array;
		
		public function Diagram(intervalXMin:int = -10, intervalXMax:int = 10, xDivision:int = 1, aValue:int = 2, bValue:int = 0, divisionSize:int = 30) 
		{
			super();
			
			this.material = new LineMaterial(0xFF0000, 1);
			
			_divisionSize = divisionSize;
			_points = [];
			
			var lastX:Number = 0;
			var lastY:Number = 0;
			var lastZ:Number = 0;
			
			var y:Number = 0;
			var firstIteration:Boolean = true;
			
			for (var z:Number = -10; z < 10; z+= 1)
			{
				_points[z+10] = [];
				for (var x:Number = intervalXMin; x < intervalXMax; x+= 0.5)
				{
					y = aValue * Math.sin(x) + bValue;
						
					if (firstIteration)
					{
						addNewLine(1, x * _divisionSize, y * _divisionSize, z * _divisionSize, x * _divisionSize, y * _divisionSize, z * _divisionSize);
						firstIteration = false;
					}
					else
					{
						addNewLine(1, lastX * _divisionSize, lastY * _divisionSize, lastZ * _divisionSize, x * _divisionSize, y * _divisionSize, z * _divisionSize);
					}
						
					lastX = x;
					lastY = y;
					lastZ = z;
					
					_points[z+10].push(new Number3D(x * _divisionSize, y * _divisionSize, z * _divisionSize));
				}
				
				firstIteration = true;
			}

			for (var i:int = 0; i < _points.length - 1; i++)
			{
				for (var j:int = 0; j <  _points[i].length; j++)
				{
					if(_points[i + 1][j])
						addNewLine(1, _points[i][j].x, _points[i][j].y, _points[i][j].z, _points[i + 1][j].x, _points[i + 1][j].y, _points[i + 1][j].z);
				}
				
			}
		}
		
	}

}