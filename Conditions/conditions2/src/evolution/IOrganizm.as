package evolution 
{
	import series.Series;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public interface IOrganizm 
	{
		function get value1():int;
		function get value2():int;
		function get value():int;
		function get series():Series;
	}
	
}