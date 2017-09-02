package global 
{
	import parsers.global.Constants;

	/**
	 * ...
	 * @author ...
	 */

	public class Utils 
	{
		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function Utils() 
		{
			
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public static function getClass(asLinking:String):Class
		{
			var SWFclass:Class;
			
			if (Resources.SFWContentLoaderInfo)
			{
				SWFclass = Class(Resources.SFWContentLoaderInfo.applicationDomain.getDefinition(asLinking));
				if (SWFclass)
					return SWFclass;
			}
			
			return null;
		}

		public static function generateClassLine(className:String, extendsClass:String = ""):String
		{
			var functionText:String = "";
			functionText += "\t" + "public class " + className;
			if (extendsClass != "")
				functionText += " extends " + extendsClass;
			functionText += "\n";
				
			return functionText;
		}

		public static function generateFunction(name:String, content:String = "", accesModifier:String = "public", parameters:String = "", returnType:String = "void"):String 
		{
			var functionText:String = "";
			functionText += "\t\t" + accesModifier + " function " + name + "(" + parameters + "):" + returnType + "\n";
			
			functionText += "\t\t{\n";
			functionText += content;
			functionText += "\n\t\t}" + Constants.LINE_FOLDING + Constants.LINE_FOLDING;
			
			return functionText;
		}

		public static function getClassNameByPath(path:String):String
		{
			var nodes:Array = path.split(".");

			for (var i:int = 0; i < nodes.length; i++)
			{
				if (i == nodes.length - 1)
				{
					return String(nodes[i]).replace("Template", "");
				}
			}
			
			return "";
		}

		public static function getClassOriginalNameByPath(path:String):String
		{
			var nodes:Array = path.split(".");

			for (var i:int = 0; i < nodes.length; i++)
			{
				if (i == nodes.length - 1)
				{
					return nodes[i];
				}
			}
			
			return "";
		}

		public static function setLinesTab(string:String, tabs:String):String 
		{
			var stings:Array = string.split(Constants.LINE_FOLDING);
			string = "";
			for each (var item:String in stings) 
			{
				item = tabs + item + Constants.LINE_FOLDING;
				string += item;
			}
			return string;
		}

		public static function getClassPackageByPath(path:String):String
		{
			var nodes:Array = path.split(".");

			for (var i:int = 0; i < nodes.length; i++)
			{
				if (i == nodes.length - 1)
				{
					return path.replace("." + getClassOriginalNameByPath(path), ""); 
				}
			}
			
			return "";
		}

	}
}