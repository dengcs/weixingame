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
	import com.hsharma.hungryHero.StarlingMovieClip;
	import laya.display.Sprite;
	import laya.events.Event;
	
	/**
	 * This class is the hero character.
	 *  
	 * @author hsharma
	 * 
	 */
	public class Hero extends Sprite
	{
		/** Hero character animation. */
		private var heroArt:StarlingMovieClip;
		
		/** State of the hero. */
		private var _state:int;
		
		public function Hero()
		{
			super();
			  mouseEnabled = false;
			on(Event.ADDED,this, onAddedToStage);
		}
		
		/**
		 * On added to stage. 
		 * @param event
		 * 
		 */
		private function onAddedToStage(event:Event):void
		{
			off(Event.ADDED,this, onAddedToStage);
			
			// Set the game state to idle.
			this.state = com.hsharma.hungryHero.GameConstants.GAME_STATE_IDLE;
			
			// Initialize hero art and hit area.
			createHeroArt();
		}
		
		/**
		 * Create hero art/visuals. 
		 * 
		 */
		private function createHeroArt():void
		{
			heroArt = new StarlingMovieClip(("fly_0001"), null,20);
			heroArt.x = Math.ceil(-heroArt.width/2);
			heroArt.y = Math.ceil(-heroArt.height/2);
			//starling.core.Starling.juggler.add(heroArt);
			this.addChild(heroArt);
		}
		
		/**
		 * State of the hero. 
		 * @return 
		 * 
		 */
		public function get state():int { return _state; }
		public function set state(value:int):void { _state = value; }

		/**
		 * Set hero animation speed. 
		 * @param speed
		 * 
		 */
		public function setHeroAnimationSpeed(speed:int):void {
			if (speed == 0) heroArt.fps = 20;
			else heroArt.fps = 60;
		}

		override public function get width():Number
		{
			if (heroArt) return heroArt.width;
			else return NaN;
		}

		override public function get height():Number
		{
			if (heroArt) return heroArt.height;
			else return NaN;
		}
		
		
		override public function get rotation():Number 
		{
			return super.rotation*Math.PI/180;
		}
		
		override public function set rotation(value:Number):void 
		{
			super.rotation = value*180/Math.PI;
		}
	}
}