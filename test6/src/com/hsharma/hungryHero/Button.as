package com.hsharma.hungryHero 
{
	import laya.ui.Image;
	/**
	 * ...
	 * @author lizhi
	 */
	public class Button extends Image
	{
		public var fontColor:int;
		public function Button(name:String/*bmd:BitmapData,rect:Rectangle*/) 
		{
			skin = Assets.getTexture(name);
			//addChild(new Bitmap(bmd));
			
		}
		
	}

}