package world3D.diagrams 
{
	import world3D.directional.gui.menu.Line;
	import mx.core.FontAsset;
	import org.papervision3d.core.geom.Lines3D;
	import org.papervision3d.core.geom.renderables.Line3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.core.geom.Vertices3D;
	import org.papervision3d.lights.PointLight3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.shadematerials.FlatShadeMaterial;
	import org.papervision3d.materials.special.Letter3DMaterial;
	import org.papervision3d.materials.special.LineMaterial;
	import org.papervision3d.objects.primitives.Plane;
	import org.papervision3d.typography.Font3D;
	import org.papervision3d.typography.fonts.HelveticaLight;
	import org.papervision3d.typography.Text3D;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class BottomLayer extends Plane
	{
		private var _light:PointLight3D;
		private var _bottomLayerWidth:int;
		private var _bottomLayerHeight:int;
		private var _lines:Lines3D;
		private var diagonals:int = 10;
		private var verticals:int = 10;
		
		public function BottomLayer() 
		{
			_bottomLayerWidth = 500;
			_bottomLayerHeight = 500;
			//new LineMaterial(0xFF0000, 0)
			super(new ColorMaterial(0x626262, 0.7), _bottomLayerWidth, _bottomLayerHeight, diagonals, verticals);
			initializeLines();
			material.doubleSided = true;
			x = -200;
			rotationX = 90;
			
			_light = new PointLight3D(true);
			_light.z = -500;
			_light.x = 0;
			_light.y = 0;
			
			//addVerticalScale();
		}
		
		private function addVerticalScale():void 
		{
			_lines.addLine(new Line3D(_lines, new LineMaterial(0x0000FF), 1, new Vertex3D( -_bottomLayerWidth / 2, -_bottomLayerHeight / 2, 0 -10), new Vertex3D( -_bottomLayerWidth / 2, -_bottomLayerHeight / 2, -450 - 10)));
			
			for (var i:int = 0; i < 10; i++)
			{
				addScaleDivision(new Vertex3D( -_bottomLayerWidth / 2, -_bottomLayerHeight / 2, 0), (-50 * i) - 10, i.toString());
			}
			
		}
		
		private function addScaleDivision(vertex:Vertex3D, z:int, text:String):void 
		{
			var text3D:Text3D = new Text3D(text, new HelveticaLight(),  new Letter3DMaterial(0x000000, 0.5));
			text3D.scaleX = 0.4;
			text3D.scaleY = 0.4;
			text3D.material.doubleSided = true;
			text3D.x = vertex.x - 40;
			text3D.y = vertex.y;
			text3D.z = z;
			text3D.rotationX = -90;
			addChild(text3D);
			
			_lines.addLine(new Line3D(_lines, new LineMaterial(0x0000FF), 1, new Vertex3D(vertex.x, vertex.y, z), new Vertex3D(vertex.x + 20, vertex.y, z)));
			_lines.addLine(new Line3D(_lines, new LineMaterial(0x0000FF), 1, new Vertex3D(vertex.x, vertex.y, z), new Vertex3D(vertex.x, vertex.y + 20, z)));
			
		}
		
		private function initializeLines():void 
		{
			_lines = new Lines3D();
			var lines:Array = [];
			var newline:Boolean = true;

			
			for (var i:int = -_bottomLayerWidth / 2; i <= _bottomLayerWidth / 2; i += 500 / 10)
			{
				_lines.addLine(new Line3D(_lines, new LineMaterial(0x484848), 1, new Vertex3D(i, -_bottomLayerHeight / 2, 0), new Vertex3D(i, _bottomLayerHeight / 2, 0)));
			}
			
			for (i = -_bottomLayerHeight / 2; i <= _bottomLayerHeight / 2; i += _bottomLayerWidth / 10)
			{
				_lines.addLine(new Line3D(_lines, new LineMaterial(0x484848), 1, new Vertex3D(- _bottomLayerWidth / 2, i, 0), new Vertex3D(_bottomLayerWidth / 2,  i, 0)));
			}
			addChild(_lines);
		}
		
		public function addDiagramRow(size:int, x:int = 0, y:int = 0):void
		{
			var diagramRow:DiagramRow = new DiagramRow(size * 50, _light);
			diagramRow.x = -_bottomLayerWidth / 2 + x + DiagramRow.DIAGRAM_WIDTH / 2;
			diagramRow.y = -_bottomLayerHeight / 2 + y + DiagramRow.DIAGRAM_WIDTH / 2;
			diagramRow.z = -5;
			addChild(diagramRow);
		}
		
		public function get bottomLayerWidth():int 
		{
			return _bottomLayerWidth;
		}
		
		public function get bottomLayerHeight():int 
		{
			return _bottomLayerHeight;
		}
		
	}

}