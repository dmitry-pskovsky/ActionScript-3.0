package gui.example
{
	import gui.iphone.feathers.texturizedObjects.TexturizedSprite;
	import feathers.controls.Label;
	import feathers.text.BitmapFontTextFormat;
	import flash.text.TextFormatAlign;
	import manager.gui.BitmapFontManager

	public class ExampleClass extends TexturizedSprite
	{
		//=========================================================================
		// PRIVATE_PROPERTIES
		//=========================================================================

		private var _nameTextField:Label;
		private var _surnameTextField:Label;
		private var _lastNameTextField:Label;

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
			nameTextField = new Label();
			nameTextField.textRendererProperties.textFormat = new BitmapFontTextFormat(BitmapFontManager.getFont(BitmapFontManager.COMMON_FONT), 12,0x0066CC, TextFormatAlign.CENTER);
			nameTextField.x = 10;
			nameTextField.y = 9.25;
			nameTextField.width = 99;
			nameTextField.text = hello;
			addChild(nameTextField);
			nameTextField.validate();
			
			surnameTextField = new Label();
			surnameTextField.textRendererProperties.textFormat = new BitmapFontTextFormat(BitmapFontManager.getFont(BitmapFontManager.COMMON_FONT), 12,0x0066CC, TextFormatAlign.CENTER);
			surnameTextField.x = 10;
			surnameTextField.y = 34.2;
			surnameTextField.width = 99;
			surnameTextField.text = hello;
			addChild(surnameTextField);
			surnameTextField.validate();
			
			lastNameTextField = new Label();
			lastNameTextField.textRendererProperties.textFormat = new BitmapFontTextFormat(BitmapFontManager.getFont(BitmapFontManager.COMMON_FONT), 12,0x0066CC, TextFormatAlign.CENTER);
			lastNameTextField.x = 10;
			lastNameTextField.y = 59.2;
			lastNameTextField.width = 99;
			lastNameTextField.text = hello;
			addChild(lastNameTextField);
			lastNameTextField.validate();
			
		}

		public function destroy():void
		{
		}

	}
}