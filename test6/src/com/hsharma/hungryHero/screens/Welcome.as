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

package com.hsharma.hungryHero.screens
{
	import com.hsharma.hungryHero.Assets;
	import com.hsharma.hungryHero.Button;
	import com.hsharma.hungryHero.StarlingTextField;
	import laya.media.SoundManager;
	import com.hsharma.hungryHero.events.NavigationEvent;
	import com.hsharma.hungryHero.Sounds;
	import laya.display.Animation;
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.ui.Image;
	import laya.resource.Texture;
	import sdk.WXUtils;
	import com.hsharma.hungryHero.GameConstants;
	import utils.PositionHelper;
	
	
	public class Welcome extends Sprite
	{
		/** Background image. */
		private var bg:Image;
		
		/** Game title. */
		private var title:Image;
		
		/** Play button. */
		private var playBtn:Button;
		
		/** About button. */
		private var shareBtn:Button;
		
		/** Hero artwork. */
		private var hero:Image;
				
		/** Back button. */
		private var rankBtn:Button;
		
		/** Current date. */
		private var _currentDate:Date;
		
		public function Welcome()
		{
			super();
			this.visible = false;
			this.on(Event.ADDED,this, onAddedToStage);
		}
		
		/**
		 * On added to stage. 
		 * @param event
		 * 
		 */
		private function onAddedToStage(event:Event):void
		{
			this.off(Event.ADDED,this, onAddedToStage);
			
			drawScreen();
		}
		
		/**
		 * Draw all the screen elements. 
		 * 
		 */
		private function drawScreen():void
		{			
			bg = new Image(Assets.getTexture("bgWelcome"));
			this.addChild(bg);
			
			title =new Image(Assets.getTexture("welcome_title"))//Shape//new Bitmap(com.hsharma.hungryHero.Assets.getAtlas().getTexture(("welcome_title")));
			title.x = 600;
			title.y = 10;
			this.addChild(title);

			rankBtn = new Button("welcome_rankButton");
			rankBtn.x = 600;
			rankBtn.y = 355;
			rankBtn.on(Event.CLICK, this, onRankClick);
			this.addChild(rankBtn);
			
			hero = new Image(Assets.getTexture("welcome_hero"));
			hero.x = 130;
			hero.y = 100;
			this.addChild(hero);
			
			playBtn = new Button("welcome_playButton");
			playBtn.x = 600;
			playBtn.y = Laya.stage.height - playBtn.height - 50;
			playBtn.on(Event.CLICK, this, onPlayClick);
			this.addChild(playBtn);
			
			shareBtn = new Button("welcome_inviteButton");
			shareBtn.x = 100;
			shareBtn.y = Laya.stage.height- shareBtn.height  - 50;
			shareBtn.on(Event.CLICK, this, onShareClick);
			this.addChild(shareBtn);

			hero.scale(0.6, 0.6);
		}
		
		/**
		 * On back button click from about screen. 
		 * @param event
		 * 
		 */
		private function onRankClick(event:Event):void
		{
			if (!Sounds.muted) Sounds.playSound(Sounds.sndMushroom);
		}
		
		/**
		 * On play button click. 
		 * @param event
		 * 
		 */
		private function onPlayClick(event:Event):void
		{
			trace("play");
			if (!Sounds.muted) Sounds.playSound(Sounds.sndCoffee);
			this.event(NavigationEvent.CHANGE_SCREEN);			
		}
		
		/**
		 * On about button click. 
		 * @param event
		 * 
		 */
		private function onShareClick(event:Event):void
		{
			if (!Sounds.muted) Sounds.playSound(Sounds.sndMushroom);
			WXUtils.instance.showShare(null);
		}
				
		/**
		 * Initialize welcome screen. 
		 * 
		 */
		public function initialize():void
		{
			disposeTemporarily();

			if (!Sounds.muted) Sounds.playMusic(Sounds.sndBgMain);
			
			this.visible = true;			
			
			Laya.timer.frameLoop(1,this, floatingAnimation);
		}
		
		/**
		 * Animate floating objects. 
		 * @param event
		 * 
		 */
		private function floatingAnimation(event:Event):void
		{
			_currentDate = new Date();
			
			hero.y = (Laya.stage.height - hero.height)/2 + 20;
			hero.y = hero.y + (Math.cos(_currentDate.getTime() * 0.002)) * 10;
			
			rankBtn.y = (Laya.stage.height - rankBtn.height)/2 + 20;
			rankBtn.y = rankBtn.y + (Math.cos(_currentDate.getTime() * 0.002)) * 10;
		}
		
		/**
		 * Dispose objects temporarily. 
		 * 
		 */
		public function disposeTemporarily():void
		{
			this.visible = false;
			Laya.timer.clear(this, floatingAnimation);
			SoundManager.stopAll();
		}
	}
}