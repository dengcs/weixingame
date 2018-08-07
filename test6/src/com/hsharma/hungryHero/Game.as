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

package com.hsharma.hungryHero
{
	//import com.hsharma.hungryHero.events.NavigationEvent;
	//import com.hsharma.hungryHero.screens.InGame;
	//import com.hsharma.hungryHero.screens.Welcome;
	//import com.hsharma.hungryHero.ui.SoundButton;
	import com.hsharma.hungryHero.events.NavigationEvent;
	import com.hsharma.hungryHero.screens.InGame;
	import com.hsharma.hungryHero.screens.Welcome;
	import com.hsharma.hungryHero.ui.SoundButton;
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.media.SoundManager;
	//import flash.events.Event;
	//import flash.events.MouseEvent;
	
	//import flash.media.SoundMixer;
	
	/**
	 * This class is the primary Starling Sprite based class
	 * that triggers the different screens. 
	 * 
	 * @author hsharma
	 * 
	 */
	public class Game extends Sprite
	{
		/** Screen - Welcome or Main Menu. */
		private var screenWelcome:Welcome;
		
		/** Screen - InGame. */
		private var screenInGame:InGame;
		
		/** Sound / Mute button. */
		private var soundButton:SoundButton;
		
		public function Game()
		{
			super();
			this.on(Event.ADDED,this, onAddedToStage);
		}
		
		/**
		 * On Game class added to stage. 
		 * @param event
		 * 
		 */
		private function onAddedToStage(event:Event):void
		{
			this.off(Event.ADDED,this, onAddedToStage);
			
			// Initialize screens.
			initScreens();
		}
		
		/**
		 * Initialize screens. 
		 * 
		 */
		private function initScreens():void
		{
			trace("inits");			
			// InGame screen.
			screenInGame = new InGame();
			screenInGame.on(NavigationEvent.CHANGE_SCREEN, this, onGameChangeScreen);
			this.addChild(screenInGame);
			
			// Welcome screen.
			screenWelcome = new Welcome();
			screenWelcome.on(NavigationEvent.CHANGE_SCREEN, this, onWelcomeChangeScreen);
			this.addChild(screenWelcome);

			// Create and add Sound/Mute button.
			soundButton = new SoundButton();
			soundButton.x = Math.floor(soundButton.width * 0.5);
			soundButton.y = Math.floor(soundButton.height * 0.5);
			soundButton.on(Event.CLICK, this, onSoundButtonClick);
			this.addChild(soundButton)
			
			// Initialize the Welcome screen by default. 
			screenWelcome.initialize();
		}		
		
		
		/**
		 * On click of the sound/mute button. 
		 * @param event
		 * 
		 */
		private function onSoundButtonClick(event:Event = null):void
		{
			if (Sounds.muted)
			{
				Sounds.muted = false;
				
				if (screenWelcome.visible) Sounds.playMusic(Sounds.sndBgMain);
				else if (screenInGame.visible) Sounds.playMusic(Sounds.sndBgGame);
				
				soundButton.showUnmuteState();
			}
			else
			{
				Sounds.muted = true;
				SoundManager.stopAll();
				
				soundButton.showMuteState();
			}
		}

		private function onGameChangeScreen():void
		{
			screenInGame.disposeTemporarily();
			screenWelcome.initialize();
		}
		
		
		private function onWelcomeChangeScreen():void
		{
			screenWelcome.disposeTemporarily();
			screenInGame.initialize();
		}
	}
}