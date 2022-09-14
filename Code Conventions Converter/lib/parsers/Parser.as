package parsers 
{
	import parsers.appearance.IAppearanceStyle;
	import parsers.components.FunctionCC;
	import parsers.components.IComponent;
	import parsers.global.Constants;

	/**
	 * ...
	 * @author Dima Petrichenko
	 */

	public class Parser 
	{
		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function Parser(content:String, fileName:String, contentSructure:Vector.<String>, appearance:IAppearanceStyle) 
		{
			_fileName = fileName;
			_content = content;
			var _contentStrings3:Array = _content.split(";");
			_contentStrings = _content.split("\n");
			_contentStructure = contentSructure;
			
			_appearance = appearance;
			
			var contentStrings2:Array = [];
			for each (var item:String in _contentStrings) 
			{
				item += "\n";
				contentStrings2.push(item);
			}
			_contentStrings = contentStrings2;
			
			for (var i:int = 0; i < _contentStrings.length; i++) 
			{
				checkOnAutor2(_contentStrings[i]);
			}
			
			_contentStrings = Operations.removeSlashComents(_contentStrings);
			_contentStrings = Operations.removeStarComents(_contentStrings);
			_contentStrings = Operations.removeEmptyLines(_contentStrings);
			
			initStringsNumbers();
			
			_functions = [];
			
			for (i = 0; i < _contentStrings.length; i++) 
			{
				checkOnAutor2(_contentStrings[i]);
				checkOnInterface(_contentStrings[i]);
				checkOnPackage(_contentStrings[i]);
				checkOnClassLine(_contentStrings[i]);
				checkOnFunction(_contentStrings[i]);
			}
			
			initializeImports();
			initializeVariables();
			
			amassContentNew();
			
			trace();
		}


		//=========================================================================
		// PUBLIC SECTION
		//=========================================================================

		public function get newContent():String
		{
			return _contentNew;
		}

		//=========================================================================
		// PRIVATE SECTION
		//=========================================================================

		private var _content:String;
		private var _contentStrings:Array;
		private var _functions:Array;
		private var publicFunctions:Array = [];
		private var privateFunctions:Array = [];
		private var intetnalFunctions:Array = [];
		private var protectedFunctions:Array = [];
		private var otherFunctions:Array = [];
		private var constructoFunction:FunctionCC;
		private var interfaceContent:Array = [];
		private var packageLine:String;
		private var classLine:String;
		private var stringsNumbers:Array;
		private var _variables:Array;
		private var _constants:Array;
		private var _autorBlock:String;
		private var privateVariables:Array = [];
		private var publicVariables:Array = [];
		private var internalVariables:Array = [];
		private var otherVariables:Array = [];
		private var _firstFunction:Boolean = false;
		private var _firstfunctionIndex:int;
		private var _imports:Array;
		private var _contentNew:String;
		private var _fileName:String;
		private var _contentStructure:Vector.<String>;
		private var _appearance:IAppearanceStyle;

		private function checkOnInterface(string:String):void  
		{
			var pattern:RegExp = /\sinterface /;
			if (pattern.test(string))
				interfaceContent = getInterface(string);
		}

		private function getInterface(string:String):Array 
		{
			var currentStringIndex:int = _contentStrings.indexOf(string);
						
			var openned:Array = [];
			var closed:Array = [];
			
			var currentString:String;
			
			while (currentStringIndex <= _contentStrings.length)
			{
				currentString =_contentStrings[currentStringIndex];
				
				for (var i:int = 0; i < currentString.length; i++)
				{
					if (currentString.charAt(i) == "{")
						openned.push(currentString.charAt(i));
						
					if (currentString.charAt(i) == "}")
						closed.push(currentString.charAt(i));
				}
				
				if (openned.length != 0 && openned.length == closed.length)
				{
					initStringsNumbers2(_contentStrings.indexOf(string) + 1, currentStringIndex);
					return _contentStrings.slice(_contentStrings.indexOf(string), currentStringIndex + 1);
				}
				else	
				{
					currentStringIndex++;
				}

			}
			
			return [];
		}

		private function checkOnAutor2(string:String):void 
		{
			var pattern:RegExp = /\s\/\*\*/;
			if (pattern.test(string))
			{
				_autorBlock = getAutorBlock(string);			
				if (_autorBlock.length > 0)
					_autorBlock = _autorBlock + "\n";
			}
		}

		private function getAutorBlock(string:String):String 
		{
			var pattern:RegExp = /\s\*\//;
			
			var currentStringIndex:int = _contentStrings.indexOf(string);

			var ready:String = "";
			
			var currentString:String;
			
			while (currentStringIndex <= _contentStrings.length - 1)
			{
				currentString = _contentStrings[currentStringIndex];
				
				if (pattern.test(currentString))
				{
					var arr:Array = _contentStrings.slice(_contentStrings.indexOf(string), currentStringIndex + 1);
					for each (var item:String in arr) 
					{
						ready += item;
					}
					return ready;
				}
				else	
				{
					currentStringIndex++;
				}
			}
			
			return "";
		}

		private function checkOnAutor():void 
		{
			var startIndex:int = _content.indexOf("/**");
			_autorBlock = _content.slice(startIndex, _content.indexOf("*/", startIndex) + 2);
			if (_autorBlock.length > 0)
				_autorBlock = "\t" + _autorBlock + "\n\n";
		}

		private function initializeVariables():void 
		{
			var pattern:RegExp = /\svar /;
			var patternConstants:RegExp = /\sconst /;
			var semicolonPattern:RegExp = /;/;
			
			_variables = [];
			_constants = [];
			
			for (var i:int = 0; i < stringsNumbers.length; i++) 
			{
				if(!stringsNumbers[i].functionLine)
					if (pattern.test(_contentStrings[stringsNumbers[i].index]))
					{
						_variables.push(_contentStrings[stringsNumbers[i].index]);
						while (!semicolonPattern.test(_contentStrings[stringsNumbers[i].index]))
						{
							i++;
							_variables.push(_contentStrings[stringsNumbers[i].index]);
						}	
					}
			}
			
			for (i = 0; i < stringsNumbers.length; i++) 
			{
				if (!stringsNumbers[i].functionLine)
					if (patternConstants.test(_contentStrings[stringsNumbers[i].index]))
					{
						_constants.push(_contentStrings[stringsNumbers[i].index]);
						while (!semicolonPattern.test(_contentStrings[stringsNumbers[i].index]))
						{
							i++;
							_constants.push(_contentStrings[stringsNumbers[i].index]);
						}
					}
			}
			
			for each (var string:String in _variables) 
			{
				initVar(string);
			}
			if (_constants.length > 0)
			{
				_constants.push("\n");
			}
			if (privateVariables.length > 0)
			{
				privateVariables.push("\n");
			}
			if (publicVariables.length > 0)
			{
				publicVariables.push("\n");
			}
			if (internalVariables.length > 0)
			{
				internalVariables.push("\n");
			}
			if (otherVariables.length > 0)
			{
				otherVariables.push("\n");
			}
		}

		private function initVar(string:String):void 
		{
			var privateVariablePattern:RegExp = /\sprivate /;
			var publicVariablePattern:RegExp = /\spublic /;
			var internalVariablePattern:RegExp = /\sinternal /;
		
			if (privateVariablePattern.test(string))
			{
				privateVariables.push(string);
			}
			else if (publicVariablePattern.test(string))
			{
				publicVariables.push(string);
			}
			else if (internalVariablePattern.test(string))
			{
				internalVariables.push(string);
			}
			else 
			{
				otherVariables.push(string);
			}
		}

		private function initStringsNumbers():void 
		{
			stringsNumbers = [];
			for (var i:int = 0; i < _contentStrings.length; i++) 
			{
				stringsNumbers.push( { index:i, functionLine:false } );
			}
		}

		private function checkOnClassLine(string:String):void 
		{
			var classPattern:RegExp = /\sclass [a-zA-Z]/;
			if (classPattern.test(string))
				classLine = string;
		}

		private function checkOnPackage(string:String):void 
		{
			var packagePattern:RegExp = /^package /m;
			if (packagePattern.test(string))
				packageLine = string;
		}

		private function initializeImports():void 
		{
			_imports = [];
			
			var importPattern:RegExp = /\simport /;
			
			for (var i:int = 0; i < _contentStrings.length; i++) 
			{
				if (importPattern.test(_contentStrings[i]))
					_imports.push(_contentStrings[i]);
			}
			
			for (var j:int = 0; j < _imports.length; j++) 
			{
				if (!importActualite(_imports[j]))
				{
					_imports.splice(j, 1);
					j = -1;
				}
			}

		}

		private function importActualite(string:String):Boolean
		{
			string = string.slice(string.lastIndexOf(".") + 1, string.lastIndexOf(";"));
			
			var useCount:int = -1;
			for (var i:int = 0; i < _contentStrings.length; i++) 
			{
				if (String(_contentStrings[i]).search(string) != -1)
					useCount++;
			}
			if (useCount > 0)
				return true;
			else
				return false;
		}

		private function checkOnFunction(string:String):void
		{
			var functionPattern:RegExp = /\sfunction /;
			var publicPattern:RegExp = /\spublic /;
			var privatePattern:RegExp = /\sprivate /;
			var internalPattern:RegExp = /\sinternal /;
			var protectedPattern:RegExp = /\sprotected /;
			
			var functionCC:FunctionCC;
			
			if (functionPattern.test(string))
			{
				_functions.push(string);
				functionCC = new FunctionCC(getFunction(string));
				
				checkOnConstructor(string);
				checkOnFirstFunction(string);
				
				if (checkOnConstructor(string))
				{
					constructoFunction = functionCC;
				}
				else if (publicPattern.test(string))
				{
					publicFunctions.push(functionCC);
				}
				else if (privatePattern.test(string))
				{
					privateFunctions.push(functionCC);
				}
				else if (internalPattern.test(string))
				{
					intetnalFunctions.push(functionCC);
				}
				else if (protectedPattern.test(string))
				{
					protectedFunctions.push(functionCC);
				}
				else 
				{
					otherFunctions.push(functionCC);
				}
	
			}	
			
		}

		private function checkOnFirstFunction(string:String):void 
		{
			if (!_firstFunction)
			{
				_firstFunction = true;
				_firstfunctionIndex = _contentStrings.indexOf(string);
			}
		}

		private function checkOnConstructor(string:String):Boolean 
		{
			var t:String = "";
			var pattern:RegExp = /function [a-zA-Z0-9]*/;
			
			if (pattern.test(string))
			{
				t = pattern.exec(string);
				var ar:Array = t.split(" ");
				var name:String = "";
				
				if(ar && ar.length > 0)
					name = ar[1];
				else
					name = "";
					
				if (name == _fileName)
					return true;
				else
					return false;
			}
			else
			{
				return false;
			}
		}

		private function getFunction(string:String):Array 
		{
			var currentStringIndex:int = _contentStrings.indexOf(string);
						
			var openned:Array = [];
			var closed:Array = [];
			
			var currentString:String;
			
			while (currentStringIndex <= _contentStrings.length - 1)
			{
				currentString = _contentStrings[currentStringIndex];
				
				for (var i:int = 0; i < currentString.length; i++)
				{
					if (currentString.charAt(i) == "{")
						openned.push(currentString.charAt(i));
						
					if (currentString.charAt(i) == "}")
						closed.push(currentString.charAt(i));
				}
				
				if (openned.length != 0 && openned.length == closed.length)
				{
					initStringsNumbers2(_contentStrings.indexOf(string) + 1, currentStringIndex);
					return _contentStrings.slice(_contentStrings.indexOf(string), currentStringIndex + 1);
				}
				else	
				{
					currentStringIndex++;
				}

			}
			
			return [];
		}

		private function initStringsNumbers2(a:int, b:int):void 
		{
			for (var i:int = a; i < b; i++) 
			{
				stringsNumbers[i].functionLine = true;
			}
		}

		private function amassContentElement(type:String):void
		{
			var l:int;
			switch (type) 
			{
				case Constants.CONTENT_IMPORTS:
					{
						for (var i:int = 0; i < _imports.length; i++) 
						{
							_contentNew += _imports[i];
						}
						_contentNew += "\n";
					}
				break;
				case Constants.CONTENT_CONSTRUCTOR:
					{
						if (constructoFunction)
						{
							_contentNew += _appearance.CONSTRUCTOR;
							_contentNew += constructoFunction.text();
							_contentNew += "\n";
						}
					}
				break;					
				case Constants.CONTENT_PRIVATE_FUNCTIONS:
					{
						if (privateFunctions.length > 0)
						{
							_contentNew += _appearance.PRIVATE_FUNCTIONS;
							for each (item in privateFunctions) 
							{
								_contentNew += item.text();
							}
						}
					}
				break;	
				case Constants.CONTENT_CONSTANTS:
					{
						if (_constants.length > 0)
						{
							_contentNew += _appearance.CONSTANTS;
							for (var j:int = 0; j < _constants.length; j++) 
							{
								_contentNew += _constants[j];
							}
						}
					}
				break;	
				case Constants.CONTENT_PUBLIC_VARIABLES:
					{
						if (publicVariables.length > 0)
						{
							_contentNew += _appearance.PUBLIC_VARIABLES;
							for (j = 0; j < publicVariables.length; j++) 
							{
								_contentNew += publicVariables[j];
							}
						}
					}
				break;	
				
				case Constants.CONTENT_PRIVATE_VARIABLES:
					{
						if (privateVariables.length > 0)
						{
							_contentNew += _appearance.PRIVATE_VARIABLES;
							for (j = 0; j < privateVariables.length; j++) 
							{
								_contentNew += privateVariables[j];
							}
						}
					}
				break;	
				case Constants.CONTENT_PUBLIC_FUNCTIONS:
					{
						if (publicFunctions.length > 0)
						{
							_contentNew += _appearance.PUBLIC_FUNCTIONS;
							for each (var item:IComponent in publicFunctions) 
							{
								_contentNew += item.text();
							}
						}
					}
				break;
				case Constants.CONTENT_PROTECTED_FUNCTIONS:
					{
						if (protectedFunctions.length > 0)
						{
							_contentNew += _appearance.PROTECTED_FUNCTIONS;
							for each (item in protectedFunctions) 
							{
								_contentNew += item.text();
							}
						}
					}
				break;
				case Constants.CONTENT_OTHER_VARIABLES:
					{
						if (otherVariables.length > 0)
						{
							_contentNew += _appearance.OTHER_VARIABLES;
							for (j = 0; j < otherVariables.length; j++) 
							{
								_contentNew += otherVariables[j];
							}
						}
					}
				break;
				case Constants.CONTENT_INTERNAL_VARIABLES:
					{
						if (internalVariables.length > 0)
						{
							_contentNew += _appearance.INTERNAL_VARIABLES;
							for (j = 0; j < internalVariables.length; j++) 
							{
								_contentNew += internalVariables[j];
							}
						}
					}
				break;
				case Constants.CONTENT_INTERNAL_FUNCTIONS:
					{
						if (intetnalFunctions.length > 0)
						{
							_contentNew += _appearance.INTERNAL_FUNCTIONS;
							for each (item in intetnalFunctions) 
							{
								_contentNew += item.text();
							}
						}
					}
				break;
				case Constants.INTERFACE_CONTENT:
					{
						if (interfaceContent.length > 0)
						{
							for (var k:int = 0; k < interfaceContent.length; k++) 
							{
								_contentNew += interfaceContent[k];
							}
							_contentNew += Constants.closeBracket;
							return;
						}
					}
				break;
				case Constants.AUTOR_BLOCK:
					{
						if (_autorBlock != null)
							_contentNew += _autorBlock;
					}
				break;
				case Constants.COMMENT_PUBLIC_BLOCK:
					{
						if (publicFunctions.length > 0 || publicVariables.length > 0)
						{
							_contentNew += _appearance.PUBLIC_SECTION;
							for (l = 0; l < publicVariables.length; l++) 
							{
								_contentNew += publicVariables[l];
							}
							
							for (l = 0; l < publicFunctions.length; l++) 
							{
								_contentNew += FunctionCC(publicFunctions[l]).text();
							}
						}
					}
				break;
				case Constants.COMMENT_PRIVATE_BLOCK:
					{
						if (privateFunctions.length > 0 || privateVariables.length > 0)
						{
							_contentNew += _appearance.PRIVATE_SECTION;
							for (l = 0; l < privateVariables.length; l++) 
							{
								_contentNew += privateVariables[l];
							}
							
							for (l = 0; l < privateFunctions.length; l++) 
							{
								_contentNew += FunctionCC(privateFunctions[l]).text();
							}
						}
					}
				break;
				case Constants.COMMENT_PROTECTED_BLOCK:
					{
						if (protectedFunctions.length > 0)
						{
							_contentNew += _appearance.PROTECTED_SECTION;
							for (l = 0; l < protectedFunctions.length; l++) 
							{
								_contentNew += FunctionCC(protectedFunctions[l]).text();
							}
						}
					}
				break;
				case Constants.COMMENT_INTERNAL_BLOCK:
					{

					}
				break;

			default:
				break;
			}
		}

		private function amassContentNew():void 
		{
			_contentNew = "";
			
			_contentNew += packageLine;
			_contentNew += Constants.openBracket;
			
			amassContentElement(_contentStructure[0]);
			amassContentElement(_contentStructure[1]);
			
			_contentNew += classLine;
			_contentNew += Constants.openClassBracket;
			
			for (var i:int = 2; i < _contentStructure.length; i++) 
			{
				amassContentElement(_contentStructure[i]);
			}

			_contentNew += Constants.closeClassBracket;
			_contentNew += Constants.closeBracket;
		}

	}
}