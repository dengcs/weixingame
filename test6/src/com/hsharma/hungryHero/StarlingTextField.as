package com.hsharma.hungryHero 
{
	import laya.ui.Label;
	/**
	 * ...
	 * @author lizhi
	 */
	public class StarlingTextField extends Label
	{
		
		public function StarlingTextField(width:Number,height:Number,text:String,fontName:String,fontSize:Number,color:String) 
		{
			this.width = width;
			this.height = height;
			wordWrap = true;
			//defaultTextFormat = new TextFormat(fontName,fontSize, color);
			this.font = fontName;
			this.fontSize = fontSize;
			this.color =color;
			this.text = text;
		}
		
		/*override public function get text():String 
		{
			return super.text;
		}
		
		override public function set text(value:String):void 
		{
			super.text = "value";
		}*/
	}

}