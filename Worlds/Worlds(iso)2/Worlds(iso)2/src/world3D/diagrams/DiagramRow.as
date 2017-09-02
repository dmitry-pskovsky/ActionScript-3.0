package world3D.diagrams 
{
	import org.papervision3d.lights.PointLight3D;
	import org.papervision3d.materials.shadematerials.FlatShadeMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.objects.primitives.Cube;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class DiagramRow extends Cube
	{
		private var _cubeMat:WireframeMaterial;
		private var _materialsList:MaterialsList;
		private var _shadeMaterial:FlatShadeMaterial;
		
		private var rowHeight:int;
		
		public static const DIAGRAM_WIDTH:int = 50;
		
		public function DiagramRow(height:int, light:PointLight3D = null) 
		{
			_cubeMat = new WireframeMaterial(0x7EECF1, 1, 0.5);
			
			_shadeMaterial = new FlatShadeMaterial(light, 0x0066FF, 0x0000FF, 100);

			_materialsList = new MaterialsList();
			_materialsList.addMaterial(_shadeMaterial, 'front');
			_materialsList.addMaterial(_shadeMaterial, 'back');
			_materialsList.addMaterial(_shadeMaterial, 'top');
			_materialsList.addMaterial(_shadeMaterial, 'bottom');
			_materialsList.addMaterial(_shadeMaterial, 'left');
			_materialsList.addMaterial(_shadeMaterial, 'right');
			
			super(_materialsList, DIAGRAM_WIDTH - 1, height, DIAGRAM_WIDTH - 1, 4, 4, 4);
			
			z = ( -height / 2);
			rowHeight = height;
		}
		
		override public function get z():Number 
		{
			return super.z;
		}
		
		override public function set z(value:Number):void 
		{
			super.z = (-rowHeight / 2) + value;
		}
		
	}

}