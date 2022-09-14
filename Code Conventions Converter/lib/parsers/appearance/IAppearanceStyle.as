package parsers.appearance {
	
	/**
	 * ...
	 * @author 
	 */
	public interface IAppearanceStyle 
	{
		function get CONSTRUCTOR():String;
		function get CONSTANTS():String;
		
		function get PRIVATE_VARIABLES():String;
		function get PRIVATE_FUNCTIONS():String;
		function get PRIVATE_SECTION():String;
		
		function get PUBLIC_VARIABLES():String;
		function get PUBLIC_FUNCTIONS():String;
		function get PUBLIC_SECTION():String;

		function get INTERNAL_VARIABLES():String;
		function get INTERNAL_FUNCTIONS():String;
		function get INTERNAL_SECTION():String;
		
		function get PROTECTED_VARIABLES():String;
		function get PROTECTED_FUNCTIONS():String;
		function get PROTECTED_SECTION():String;
		
		function get OTHER_VARIABLES():String;
		function get OTHER_FUNCTIONS():String;
		function get OTHER_SECTION():String;
	}
	
	
	
}