package model.feathers.classComponentsFeathers {
	import flash.text.TextField;
	import flash.text.TextFormat;
	import model.IClassComponent;

	/**
	 * ...
	 * @author 
	 */

	public class LabelComponent implements IClassComponent
	{
		//=========================================================================
		// PRIVATE PROPERTIES
		//=========================================================================

		private var _name:String;
		private var _component:TextField;
		private var _textFormat:TextFormat;

		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function LabelComponent(name:String, component:Object) 
		{
			_name = name;
			_component = TextField(component);
			_textFormat = _component.getTextFormat();
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public function get importText():Vector.<String> 
		{
			var imports:Vector.<String> = new Vector.<String>();
			imports.push("import feathers.controls.Label;");
			imports.push("import feathers.text.BitmapFontTextFormat;");
			imports.push("import flash.text.TextFormatAlign;");
			imports.push("import manager.gui.BitmapFontManager;");
			return imports;
		}

		public function get declarationText():String 
		{
			return "private var _" + _name + ":Label;";
		}

		public function get initializationText():String 
		{
			return _name + " = new Label();\n" +
			_name + ".textRendererProperties.textFormat = new BitmapFontTextFormat(BitmapFontManager.getFont(BitmapFontManager.COMMON_FONT), " + _textFormat.size + "," + "0x" + displayInHex(uint(_textFormat.color)) + ", TextFormatAlign.CENTER);\n" + 
			_name + ".x = " + _component.x + ";\n" + 
			_name + ".y = " + _component.y + ";\n" + 
			_name + ".width = " + _component.width + ";\n" + 
			_name + ".text = " + _component.text + ";\n" + 
			"addChild(" + _name + ");\n" + 
			_name + ".validate();\n";
		}
	
		private function displayInHex(c:uint):String 
		{
			var r:String=extractRed(c).toString(16).toUpperCase();
			var g:String=extractGreen(c).toString(16).toUpperCase();
			var b:String=extractBlue(c).toString(16).toUpperCase();
			var hs:String="";
			var zero:String="0";
	
			if (r.length == 1)
			{
				r=zero.concat(r);
			}
	
			if (g.length == 1)
			{
				g=zero.concat(g);
			}
	
			if (b.length == 1)
			{
				b=zero.concat(b);
			}
			
			hs = r + g + b;
			
			return hs;
		}
		
		private function extractRed(c:uint):uint {
			return (( c >> 16 ) & 0xFF);
		}

		private function extractGreen(c:uint):uint 
		{
			return ( (c >> 8) & 0xFF );
		}
		
		private function extractBlue(c:uint):uint 
		{
			return ( c & 0xFF );
		}

		public function get destroyText():String 
		{
			return "";
		}

	}
}