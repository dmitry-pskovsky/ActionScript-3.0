package model.classContents 
{
	import global.Utils;
	import model.IClassContent;
	import model.superclasses.ISuperClass;
	import parsers.global.Constants;

	/**
	 * ...
	 * @author Dima Petrichenko
	 */

	public class ClassContent implements IClassContent
	{
		//=========================================================================
		// CONSTANTS
		//=========================================================================

		private const PACKAGE_CONTENT:String = "#&#package";
		private const IMPORT_CONTENT:String = "#&#import";
		private const DECLARATION_CONTENT:String = "#&#declaration";
		private const INITIALIZATION_CONTENT:String = "#&#initialization";
		private const DESRTOY_CONTENT:String = "#&#destroy";

		//=========================================================================
		// PRIVATE PROPERTIES
		//=========================================================================

		private var _contentText:String;
		private var _classPath:String;
		private var _importsBlock:String;
		private var _declarationBlock:String;
		private var _initializationBlock:String;
		private var _destroyBlock:String;

		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function ClassContent(classPath:String, superclass:ISuperClass) 
		{
			_importsBlock = "";
			_declarationBlock = "";
			_initializationBlock = "";
			_destroyBlock = "";
			_classPath = "package " + Utils.getClassPackageByPath(classPath);
			
			_contentText = PACKAGE_CONTENT + Constants.LINE_FOLDING + Constants.openBracket + IMPORT_CONTENT + Constants.LINE_FOLDING;
			
			_contentText += Utils.generateClassLine(Utils.getClassNameByPath(classPath), superclass.extendsText);
			_contentText += Constants.openClassBracket;
			_contentText += DECLARATION_CONTENT + Constants.LINE_FOLDING;
			_contentText += Utils.generateFunction(Utils.getClassNameByPath(classPath), "\t\t\tinitialize()");
			_contentText += Utils.generateFunction("initialize", INITIALIZATION_CONTENT);
			_contentText += Utils.generateFunction("destroy", DESRTOY_CONTENT);
			
			_contentText += Constants.closeClassBracket;
			_contentText += Constants.closeBracket;
			
			addComponentImports(superclass.importText);
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public function text():String
		{
			var contentText:String;
		
			_contentText = _contentText.replace(PACKAGE_CONTENT, _classPath);
			_contentText = _contentText.replace(IMPORT_CONTENT, _importsBlock);
			_contentText = _contentText.replace(DECLARATION_CONTENT, _declarationBlock);
			_contentText = _contentText.replace(INITIALIZATION_CONTENT, _initializationBlock);
			_contentText = _contentText.replace(DESRTOY_CONTENT, _destroyBlock);
			
			return _contentText;
		}

		public function addComponentImports(value:String):void
		{
			if (value != "")
				if (_importsBlock.search(value) == -1)
					_importsBlock += Constants.TAB + value + Constants.LINE_FOLDING;
		}

		public function addComponentDeclaration(value:String):void
		{
			if (value != "")
				_declarationBlock += Constants.TAB + Constants.TAB + value + Constants.LINE_FOLDING;
		}

		public function addComponentInitialization(value:String):void
		{
			if (value != "")
				_initializationBlock += Utils.setLinesTab(value, Constants.TAB + Constants.TAB + Constants.TAB);
		}

		public function addComponentDestroy(value:String):void
		{
			if (value != "")
				_destroyBlock += Constants.TAB + Constants.TAB + Constants.TAB + value + Constants.LINE_FOLDING;
		}

	}
}