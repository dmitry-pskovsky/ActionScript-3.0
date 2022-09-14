package  
{
	import flash.filesystem.File;

	/**
	 * ...
	 * @author Dima Petrichenko
	 */

	public class Operations 
	{
		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function Operations() 
		{
			
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public static function getFileName(file:File):String
		{
			var str:String = file.nativePath.slice(0, file.nativePath.lastIndexOf("."));
			return str.slice(file.nativePath.lastIndexOf("\\") + 1);
		}

		public static function removeSlashComents(content:Array):Array
		{
			var str:Array = [];
			var textPattern:RegExp = /[^\f\n\r\t\v]/;
			var contentNew:Array = [];
			var patternSlash:RegExp = /\/\//;
			
			for each (var string:String in content) 
			{
				if (patternSlash.test(string))
				{
					str = string.split("//");
					if (textPattern.test(String(str[0])))
					{
						str[0] += "\n";
						contentNew.push(str[0]);
					}
				}
				else
				{
					contentNew.push(string);
				}
			}
			
			return contentNew;
		}

		public static function removeStarComents(content:Array):Array 
		{
			var pattern:RegExp = /\s\/\*/;
			var contentString:String = "";
			var tempStr:String = "";
			var tempArr:Array = [];
			var tempArr2:Array = [];
			
			for each (var string:String in content) 
			{
				contentString += string;
			}
			
			while (pattern.test(contentString))
			{
				tempStr = contentString.slice(contentString.indexOf("/*"), contentString.indexOf("*/") + 2);
				contentString = contentString.replace(tempStr, "");
			}
			
			tempArr = contentString.split("\n");
			
			for each (string in tempArr) 
			{
				if (string.length > 0)
				{
					string += "\n";
					tempArr2.push(string);
				}
			}

			return tempArr2;
		}

		public static function removeEmptyLines(content:Array):Array 
		{
			var textPattern:RegExp = /[^\f\n\r\t\v]/;
			var contentNew:Array = [];
			var previousEmpty:Boolean = false;
			
			for each (var string:String in content) 
			{
				if (textPattern.test(string))
				{
					contentNew.push(string);
					previousEmpty = false;
				}
				else
				{
					if (!previousEmpty)
					{
						contentNew.push(string);
						previousEmpty = true;
					}
				}
			}
			
			return contentNew;
		}

	}
}