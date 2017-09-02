package gui.example
{
	import flash.display.Sprite;
	import gui.example.ExampleClassTemplate;
	import flash.text.TextField;

	public class ExampleClass extends Sprite
	{
		//=========================================================================
		// PRIVATE_PROPERTIES
		//=========================================================================

		private var _template:ExampleClassTemplate;
		private var _nameTextField:TextField;
		private var _surnameTextField:TextField;
		private var _lastNameTextField:TextField;
		private var _b1Button:ButtonSkin;

		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function ExampleClass():void
		{
			initialize()
		}


		//=========================================================================
		// PUBLIC_METHODS
		//=========================================================================

		public function initialize():void
		{
			_template = new ExampleClassTemplate();
			addChild(_template);
			
			_nameTextField = _template.nameTextField;
			_surnameTextField = _template.surnameTextField;
			_lastNameTextField = _template.lastNameTextField;
			_b1Button = new ButtonSkin(_template.b1Button, 'b1Button');
		}

		public function destroy():void
		{
			_template = null;
			_b1Button.destroy();
		}

	}
}