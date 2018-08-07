/**
 *
 * Hungry Hero Game
 * http://www.hungryherogame.com
 * 
 * Copyright (c) 2012 Hemanth Sharma (www.hsharma.com). All rights reserved.
 * 
 * This ActionScript source code is free.
 * You can redistribute and/or modify it in accordance with the
 * terms of the accompanying Simplified BSD License Agreement.
 *  
 */

package com.hsharma.hungryHero.gameElements
{
	import com.hsharma.hungryHero.Assets;
	import com.hsharma.hungryHero.GameConstants;
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.ui.Image;
	
	/**
	 * This class defines each of background layers used in the InGame screen.
	 *  
	 * @author hsharma
	 * 
	 */
	public class BgLayer extends Sprite
	{
		/** Layer identification. */
		private var _layer:int;
		
		/** Primary image. */
		private var image1:Image;
		
		/** Secondary image. */
		private var image2:Image;
		
		/** Parallax depth - used to decide speed of the animation. */
		private var _parallaxDepth:Number;
		
		public function BgLayer(_layer:int)
		{
			super();
			this._layer = _layer;
			this.on(Event.ADDED, this, onAddedToStage);
		}
		
		private var heights:Array = [0,768,318,229,124];
		/**
		 * On added to stage. 
		 * @param event
		 * 
		 */
		private function onAddedToStage(event:Event):void
		{
			this.off(Event.ADDED, this, onAddedToStage);
			Laya.stage.on(Event.RESIZE, this, onResize);
			
			if (_layer == 1)
			{
				image1 = new Image(Assets.getTexture("bgLayer" + _layer));
				//image1.blendMode = BlendMode.NONE;
				image2 = new Image(Assets.getTexture("bgLayer" + _layer));
				//image2.blendMode = BlendMode.NONE;
			}
			else
			{
				image1 = new Image(Assets.getTexture("bgLayer" + _layer));//new Bitmap(com.hsharma.hungryHero.Assets.getAtlas().getTexture("bgLayer" + _layer));
				image2 = new Image(Assets.getTexture("bgLayer" + _layer));//new Bitmap(com.hsharma.hungryHero.Assets.getAtlas().getTexture("bgLayer" + _layer));
				//Assets.getAtlas().getTexture((image1 as Shape).graphics,"bgLayer" + _layer)
				//Assets.getAtlas().getTexture((image2 as Shape).graphics,"bgLayer" + _layer)
			}
			
			image1.x = 0;
			
			image2.x = 1024//image2.getBounds().width;
			this.addChild(image1);
			this.addChild(image2);
			
			onResize();
		}
		
		private function onResize():void 
		{			
			image1.y = Laya.stage.height - heights[_layer];//image1.height;
			image2.y = image1.y;
		}

		/**
		 * Parallax depth. 
		 * 
		 */
		public function get parallaxDepth():Number { return _parallaxDepth; }
		public function set parallaxDepth(value:Number):void { _parallaxDepth = value; }
	}
}