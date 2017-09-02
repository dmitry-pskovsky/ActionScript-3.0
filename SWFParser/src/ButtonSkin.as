package 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;

/*
	 * version 1.0
	 * @author Denis Babkin
	 */
	
	public class  ButtonSkin extends Sprite
	{
		
		// ============================================================================================
		// PUBLIC CONST 
		// ============================================================================================
		
		public static const VERSION:String = 'ButtonSkin-1.0';
		
		// ============================================================================================
		// PRIVATE PROPERTIES 
		// ============================================================================================
		
		protected var _stateOver:Boolean = false;
		protected var _stateDown:Boolean = false;
		protected var _disable:Boolean = false;
		protected var _alphaDisable:Number = 0.6;
		protected var _speedAnimationOver:Number = 0.3;
		protected var _animationOver:Boolean  = false;
		protected var _block:Boolean = false;
		protected var _blockOverOut:Boolean = false;
		
		protected var _skinButton:Object;
		protected var _data:Object;
		protected var _label:String;
		
		protected var _border:DisplayObjectContainer;
		protected var _skinUp:DisplayObject;
		protected var _skinOver:DisplayObject;
		protected var _skinDown:DisplayObject;
		protected var _skinDisable:DisplayObject;
		protected var _skinIcon:DisplayObject;
		protected var _skinBackground:DisplayObject;
		protected var _skinActive:DisplayObject;
		protected var _texture:DisplayObject;
		protected var _textField:TextField;
		protected var _disableTextField:TextField;
		protected var _skinHit:*;
		protected var _selected:Boolean;
		
		public function ButtonSkin(skinButton:*, label_:String = "", data_:Object = null, hitCreat:Boolean = false, letterSpacing:Number = 0, bold:Boolean = true):void
		{
			_label = label_;
			_data = data_;
			
			if (skinButton.parent)
			{
                var childIndex:int = skinButton.parent.getChildIndex(skinButton);
                skinButton.parent.addChildAt(this, childIndex);
				this.x = skinButton.x;
				this.y = skinButton.y;
				skinButton.x = 0;
				skinButton.y = 0;
			}

			this.addChild(skinButton);
			this.name = skinButton.name;



            if("border" in skinButton){
                _border = skinButton.border
                //GameUtils.convertToBitmapData(_border);
            }else{
                _border = new Sprite();
            }

            if("texture" in skinButton){
                _texture = skinButton.texture
            }else{
				_texture = new Sprite();
			}
			if ("skinUp" in skinButton)
				_skinUp = skinButton.skinUp;
			else 
				_skinUp = new Sprite();
			
			if ("skinOver" in skinButton)
			{
				_skinOver = skinButton.skinOver;
				_skinOver.alpha = 0;
			}
			else 
			{
				_skinOver = new Sprite();
			}
			
			if ("skinDown" in skinButton)
			{
				_skinDown = skinButton.skinDown;
				_skinDown.visible = false;
			}
			else 
			{
				_skinDown = new Sprite();
			}
			
			if ("skinHit" in skinButton)
			{
				_skinHit = skinButton.skinHit;
			}
			
			if ("skinActive" in skinButton)
			{
				_skinActive = skinButton.skinActive;
				_skinActive.visible = false;
			}
			if ("skinBackground" in skinButton)
			{
				_skinBackground = skinButton.skinBackground;
				_skinBackground.visible = true;
			}
			else
			{
				_skinBackground = new Sprite();
			}

			if ("skinDisable" in skinButton)
			{
				_skinDisable 			= skinButton.skinDisable;
				_skinDisable.visible 	= false;
				_skinDisable.alpha		= _alphaDisable;
			}
			else if (hitCreat)
			{
				_skinHit = new Sprite();
				_skinHit.graphics.beginFill(0x000000, 0);
				_skinHit.graphics.drawRect(0, 0, skinButton.width, skinButton.height);
				_skinHit.graphics.endFill();
				this.addChild(_skinHit);
				this.hitArea = _skinHit;
				_skinHit.mouseChildren = false;
				_skinHit.mouseEnabled = true
			}
			
			var textFormat:TextFormat 	= new TextFormat(null, null, null, bold);
			textFormat.letterSpacing 	= letterSpacing;
			if ("label" in skinButton)
			{
				_textField 						= skinButton.label;
				_textField.defaultTextFormat 	= textFormat
				_textField.text 				= _label;
			}			
			if ("disableLabel" in skinButton)
			{
				_disableTextField 					= skinButton.disableLabel;
				_disableTextField.defaultTextFormat = textFormat;
				_disableTextField.text 				= _label;
				_disableTextField.visible 			= false;
			}
			
			_skinButton = skinButton;



			this.addEventListener(MouseEvent.ROLL_OUT, rollOutHandler, false, 0, true);
			this.addEventListener(MouseEvent.ROLL_OVER, rollOverHandler, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler, false, 0, true);
			this.addEventListener(MouseEvent.CLICK, mouseClickHandler, false, 0, true);
			
			skinButton.mouseChildren = false;
			skinButton.mouseEnabled = true;
			this.mouseChildren = false;
			
			this.buttonMode = true;
			this.tabEnabled = false;
			this.tabChildren = false;
		}
		
		// ============================================================================================
		// PUBLIC GET SET SECTION 
		// ============================================================================================

        public function get data():Object
		{
			return _data;
		}
		
		public function get stateOver():Boolean 
		{
			return _stateOver;
		}
		
		public function set stateOver(value:Boolean):void
		{
			if (_stateOver == value) return;
				
			_stateOver = value;
			_skinOver.alpha = (_stateOver)? 1 : 0;
			
			if (!_stateOver && _stateDown) stateDown = false;
		}
		
		public function get stateDown():Boolean 
		{
			return _stateDown; 
		}
		
		public function set stateDown(value:Boolean):void
		{
			if (_stateDown == value) return;
				
			_stateDown = value;
			_skinDown.visible = _stateDown;
			_skinOver.alpha = 0;
			_skinOver.visible =  !_stateDown;
		}
		
		public function get disable():Boolean 
		{
			return _disable;
		}
		
		public function set disable(value:Boolean):void 
		{
			_disable = value;
			
			_skinOver.visible 	= !_disable;
			_skinDown.visible 	= (!_disable && _stateDown);
			
			
			if (!_stateOver)_skinOver.alpha = 0;
			this.buttonMode = !(_block || _disable);
			if (_skinDisable)
			{
				_skinDisable.visible 	= _disable;
				_skinUp.visible			= !_disable;
				if (_disableTextField)
				{
					_disableTextField.visible	= _disable;
					_textField.visible			= !_disable;
				}
			}
			else
			{
				this.alpha 	= (_disable) ? _alphaDisable : 1;
				stateDown	= false;
				stateOver	= false;
			}
			_skinBackground.visible = !_disable;
		}
		
		public function get block():Boolean
		{
			return _block;
		}
		
		public function set block(value:Boolean):void
		{
			_block = value;
			this.buttonMode = !(_block || _disable);
			
			if (_blockOverOut) return;
			_stateOver = false;
			_skinOver.visible 	= !_block;
			if (_skinDisable)
				_skinDisable.visible = block;
			if (_disable || _block) return;
			if (_stateDown)
			{
				_skinDown.visible = false;
				return;
			}
			
			if (!_animationOver)
			{
				this.addEventListener(Event.ENTER_FRAME, animationOver, false, 0, true);
				_animationOver = true;
			}
		}
		
		public function get label():String
		{
			if (_textField) return _textField.text;
			return "";
		}
		
		public function set label(value:String):void
		{
			if (_textField)
				_textField.text = value;
			if (_disableTextField)
				_disableTextField.text 	= value;
		}
		
		public function setLabelColor(value:uint, shadowValue:int = -1, thick:int = 0, strength:Number = 1.0):void
		{
			if (_textField)
			{
				var textFormat:TextFormat = new TextFormat(null, null, value, true);
				if (_textField.length == 0)
					_textField.defaultTextFormat = textFormat;
				else
					_textField.setTextFormat(textFormat);
					
				if (shadowValue >= 0)
				{
					_textField.thickness = thick;
					var shadow:DropShadowFilter = new DropShadowFilter(1, 270, shadowValue, 1, 1, 1, strength, 2);
					_textField.filters = [shadow];
				}
				textFormat = null;
			}
		}
		
		public function set labelLetterSpacing(value:Number):void
		{
			var format:TextFormat = new TextFormat();
			format.letterSpacing = value;
			_textField.setTextFormat(format);
		}
		
		public function get alphaDisable():Number
		{
			return _alphaDisable;
		}
		
		public function set alphaDisable(value:Number):void
		{
			_alphaDisable = value;
			if (_skinDisable)
				_skinDisable.alpha = _alphaDisable;
			if (_disable)
				this.alpha = _alphaDisable;
		}
		
		public function get blockOverOut():Boolean
		{
			return _blockOverOut;
		}
		
		public function set blockOverOut(value:Boolean):void
		{
			_blockOverOut = value;
		}
		public function set selected(value:Boolean):void
		{
			if (_skinActive)
			{
				_skinActive.visible = value;
			}
			else if (_skinDown)
			{
				_skinDown.visible = value;
			}
			_selected = value;
		}
		
		public function get selected():Boolean 
		{
			return _selected;
		}

        public function get texture():DisplayObject
        {
            return _texture;
        }

		public function get skinUp():DisplayObject
		{
			return _skinUp;
		}
		
		public function get skinDown():DisplayObject 
		{
			return _skinDown;
		}
		
		public function get textField():TextField
		{
			return _textField;
		}
		
		public function get skinButton():Object
		{
			return _skinButton;
		}
		
		// ============================================================================================
		// PUBLIC METHODS 
		// ============================================================================================
		
		public function destroy ():void
		{
			this.removeEventListener(MouseEvent.ROLL_OUT, rollOutHandler);
			this.removeEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
			this.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			this.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			this.removeEventListener(MouseEvent.CLICK, mouseClickHandler);
			this.removeEventListener(Event.ENTER_FRAME, animationOver);
			
			this.removeChild(DisplayObject(_skinButton));
			if(this.parent)
				this.parent.removeChild(this);
			
			if (!_animationOver)
				this.removeEventListener(Event.ENTER_FRAME, animationOver);
			
			_skinButton = null;
			_data = null;
			_label = null;
			_skinUp = null;
			_skinOver = null;
			_skinDown = null;
			_skinDisable = null;
			_skinIcon = null;
			_skinBackground = null;
			_textField = null;
			_disableTextField = null;
			_skinHit = null;
		}
		
		// ============================================================================================
		// PROTECTED MOUSE EVENT 
		// ============================================================================================
		
		protected function mouseDownHandler(event:MouseEvent):void
		{
			if (_disable || _block)
				event.stopImmediatePropagation();
			if (_disable || _block) return;
				
			_stateDown = true;
			_skinDown.visible = true;
			_skinOver.visible = false;
			_skinOver.alpha = 0;
		}
		
		protected function mouseUpHandler(event:MouseEvent):void
		{
			if (_disable || _block)
				event.stopImmediatePropagation();
			if (_disable || _block) return;
			_stateDown = false;
			
			_skinDown.visible = false;
			if (!this.hitTestPoint(mouseX, mouseY))
				_stateOver = true
			else
				_stateOver = false;
			
			_skinOver.visible = _stateOver;
			_skinOver.alpha = (_stateOver)? 1 : 0;
			
			if (_selected)
				_skinDown.visible = true;
		}
		
		protected function rollOutHandler(event:MouseEvent):void
		{
			if (_blockOverOut) return;
			if (_disable)
				event.stopImmediatePropagation();
			_stateOver = false;
			if (_disable || _block) return;
			if (_stateDown)
			{
				_skinDown.visible = false;
				return;
			}
			
			if (!_animationOver)
			{
				this.addEventListener(Event.ENTER_FRAME, animationOver, false, 0, true);
				_animationOver = true;
			}
		}
		
		protected function rollOverHandler(event:MouseEvent):void
		{
			if (_blockOverOut) return;
			if (_disable)
				event.stopImmediatePropagation();
			if (_disable || _block) return;
			if (_stateDown && !event.buttonDown)
			{
				_stateDown = false;
				_skinDown.visible = false;
			}
			
			if (_stateDown)
			{
				_skinDown.visible = true;
				return;
			}
			
			_stateOver = true;
			
			if (!_animationOver)
			{
				_skinOver.visible = true;
				this.addEventListener(Event.ENTER_FRAME, animationOver, false, 0, true);
				_animationOver = true;
			}
		}
		
		protected function mouseClickHandler(event:MouseEvent):void
		{
			if (_disable || _block)
				event.stopImmediatePropagation();
		}
		
		protected function animationOver(event:Event):void
		{
			if (_stateDown)
			{
				if (_stateOver)
					_skinOver.alpha = 1
					else _skinOver.alpha = -1;
			}else 
			{
				if (_stateOver)
					_skinOver.alpha += _speedAnimationOver
					else _skinOver.alpha -= _speedAnimationOver;
			}
			
			if (_stateOver && _skinOver.alpha >= 1 || !_stateOver && _skinOver.alpha <= 0)
			{
				_skinOver.alpha = (_skinOver.alpha >= 1)? 1 : 0;
				if (_stateDown) _skinDown.visible = (_skinOver.alpha == 1)? true : false;
				this.removeEventListener(Event.ENTER_FRAME, animationOver);
				_animationOver = false;
			}
		}
	}
}