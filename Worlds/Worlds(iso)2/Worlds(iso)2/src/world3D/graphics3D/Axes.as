package world3D.graphics3D 
{
	import flash.text.TextField;
	import org.papervision3d.core.geom.Lines3D;
	import org.papervision3d.core.geom.renderables.Line3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.core.proto.MaterialObject3D;
	import org.papervision3d.materials.special.Letter3DMaterial;
	import org.papervision3d.materials.special.LineMaterial;
	import org.papervision3d.typography.Font3D;
	import org.papervision3d.typography.fonts.HelveticaLight;
	import org.papervision3d.typography.fonts.HelveticaMedium;
	import org.papervision3d.typography.Text3D;
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Axes extends Lines3D
	{
		private var _length:int;
		private var _xLine:Line3D;
		private var _yLine:Line3D;
		private var _zLine:Line3D;
		private var _xTextField:Text3D;
		private var _yTextField:Text3D;
		private var _zTextField:Text3D;
		
		public function Axes() 
		{
			super(new LineMaterial(0x0000FF, 1));
			
			_length = 400;
			
			_xLine = new Line3D(this, new LineMaterial(0x0000FF, 1), 1, new Vertex3D(length, 0, 0), new Vertex3D( -length, 0, 0));
			addLine(_xLine);
			_yLine = new Line3D(this, new LineMaterial(0x0000FF, 1), 1, new Vertex3D(0, length, 0), new Vertex3D(0, -length, 0));
			addLine(_yLine);
			_zLine = new Line3D(this, new LineMaterial(0x0000FF, 1), 1, new Vertex3D(0, 0, length), new Vertex3D(0, 0, -length));
			addLine(_zLine);
			
			_xTextField = new Text3D('X', new HelveticaLight(),  new Letter3DMaterial(0x000000, 0.5));
			_xTextField.scaleX = 0.7;
			_xTextField.scaleY = 0.7;
			_xTextField.material.doubleSided = true;
			_xTextField.x = _xLine.v0.x + 20;
			_xTextField.y = _xLine.v0.y;
			addChild(_xTextField);
			
			_yTextField = new Text3D('Y', new HelveticaLight(),  new Letter3DMaterial(0x000000, 0.5));
			_yTextField.scaleX = 0.7;
			_yTextField.scaleY = 0.7;
			_yTextField.material.doubleSided = true;
			_yTextField.x = _yLine.v0.x;
			_yTextField.y = _yLine.v0.y + 30;
			addChild(_yTextField);
			
			//_zTextField = new Text3D('Z', new HelveticaLight(),  new Letter3DMaterial(0x000000, 0.5));
			//_zTextField.scaleX = 0.7;
			//_zTextField.scaleY = 0.7;
			//_zTextField.material.doubleSided = true;
			//_zTextField.x = _zLine.v0.x;
			//_zTextField.z = _zLine.v1.z;
			//addChild(_zTextField);
		}
		
		public function get length():int 
		{
			return _length;
		}
		
	}

}