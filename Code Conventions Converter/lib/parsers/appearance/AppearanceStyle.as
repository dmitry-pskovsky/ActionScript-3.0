package parsers.appearance 
{
	/**
	 * ...
	 * @author 
	 */
	public class AppearanceStyle implements IAppearanceStyle 
	{
		private static const CONSTRUCTOR_CONTENT:String = "<CONSTRUCTOR>";
		private static const CONSTANTS_CONTENT:String = "<CONSTANTS>";
		
		private static const PRIVATE_VARIABLES_CONTENT:String = "<PRIVATE_VARIABLES>";
		private static const PRIVATE_FUNCTIONS_CONTENT:String = "<PRIVATE_FUNCTIONS>";
		private static const PRIVATE_SECTION_CONTENT:String = "<PRIVATE_SECTION>";
		
		private static const PUBLIC_VARIABLES_CONTENT:String = "<PUBLIC_VARIABLES>";
		private static const PUBLIC_FUNCTIONS_CONTENT:String = "<PUBLIC_FUNCTIONS>";
		private static const PUBLIC_SECTION_CONTENT:String = "<PUBLIC_SECTION>";
		
		private static const INTERNAL_VARIABLES_CONTENT:String = "<INTERNAL_VARIABLES>";
		private static const INTERNAL_FUNCTIONS_CONTENT:String = "<INTERNAL_FUNCTIONS>";
		private static const INTERNAL_SECTION_CONTENT:String = "<INTERNAL_SECTION>";
		
		private static const PROTECTED_VARIABLES_CONTENT:String = "<PROTECTED_VARIABLES>";
		private static const PROTECTED_FUNCTIONS_CONTENT:String = "<PROTECTED_FUNCTIONS>";
		private static const PROTECTED_SECTION_CONTENT:String = "<PROTECTED_SECTION>";
		
		private static const OTHER_VARIABLES_CONTENT:String = "<OTHER_VARIABLES>";
		private static const OTHER_FUNCTIONS_CONTENT:String = "<OTHER_FUNCTIONS>";
		private static const OTHER_SECTION_CONTENT:String = "<OTHER_SECTION>";
		
		private var _content:Object = {};
		
		
		public function AppearanceStyle(content:Object) 
		{
			_content = content;
		}
		
		/* INTERFACE parsers.appearance.IAppearanceStyle */
		
		public function get CONSTRUCTOR():String 
		{
			return _content[CONSTRUCTOR_CONTENT];
		}
		
		public function get CONSTANTS():String 
		{
			return _content[CONSTANTS_CONTENT];
		}
		
		public function get PRIVATE_VARIABLES():String 
		{
			return _content[PRIVATE_VARIABLES_CONTENT];
		}
		
		public function get PRIVATE_FUNCTIONS():String 
		{
			return _content[PRIVATE_FUNCTIONS_CONTENT];
		}
		
		public function get PRIVATE_SECTION():String 
		{
			return _content[PRIVATE_SECTION_CONTENT];
		}
		
		public function get PUBLIC_VARIABLES():String 
		{
			return _content[PUBLIC_VARIABLES_CONTENT];
		}
		
		public function get PUBLIC_FUNCTIONS():String 
		{
			return _content[PUBLIC_FUNCTIONS_CONTENT];
		}
		
		public function get PUBLIC_SECTION():String 
		{
			return _content[PUBLIC_SECTION_CONTENT];
		}
		
		public function get INTERNAL_VARIABLES():String 
		{
			return _content[INTERNAL_VARIABLES_CONTENT];
		}
		
		public function get INTERNAL_FUNCTIONS():String 
		{
			return _content[INTERNAL_FUNCTIONS_CONTENT];
		}
		
		public function get INTERNAL_SECTION():String 
		{
			return _content[INTERNAL_SECTION_CONTENT];
		}
		
		public function get PROTECTED_VARIABLES():String 
		{
			return _content[PROTECTED_VARIABLES_CONTENT];
		}
		
		public function get PROTECTED_FUNCTIONS():String 
		{
			return _content[PROTECTED_FUNCTIONS_CONTENT];
		}
		
		public function get PROTECTED_SECTION():String 
		{
			return _content[PROTECTED_SECTION_CONTENT];
		}
		
		public function get OTHER_VARIABLES():String 
		{
			return _content[OTHER_VARIABLES_CONTENT];
		}
		
		public function get OTHER_FUNCTIONS():String 
		{
			return _content[OTHER_FUNCTIONS_CONTENT];
		}
		
		public function get OTHER_SECTION():String 
		{
			return _content[OTHER_SECTION_CONTENT];
		}
		
	}

}