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
	//import com.hsharma.hungryHero.Fonts;
	//import com.hsharma.hungryHero.customObjects.Font;
	import com.hsharma.hungryHero.events.NavigationEvent;
	import com.hsharma.hungryHero.Sounds;
	//import com.hsharma.hungryHero.StarlingTextField;
	import laya.display.Animation;
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.ui.Image;
	import wx;
	import laya.utils.Browser;
	import laya.resource.Texture;
	import laya.webgl.shapes.Ellipse;
	
	/**
	 * This is the welcome or main menu class for the game.
	 *  
	 * @author hsharma
	 * 
	 */
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
		
		/** Screen mode - "welcome" or "about". */
		private var screenMode:String;

		/** Current date. */
		private var _currentDate:Date;
		
		/** Font - Regular text. */
		//private var fontRegular:Font;
		
		/** Hero art tween object. */
		private var tween_hero:Object;

		private var rankSprite:Sprite;
		private var rankTexture:Texture;

		private var rankCount:uint;
		
		public function Welcome()
		{
			super();
			this.visible = false;
			this.rankCount = 1;
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
			// GENERAL ELEMENTS
			
			bg = new Image(Assets.getTexture("bgWelcome"));
			//Assets.getTexture(bg.graphics,"BgWelcome")
			//bg.blendMode = BlendMode.NONE;
			this.addChild(bg);
			
			title =new Image(Assets.getTexture("welcome_title"))//Shape//new Bitmap(com.hsharma.hungryHero.Assets.getAtlas().getTexture(("welcome_title")));
			title.x = 600;
			title.y = 65;
			title.scale(0.5, 0.5);
			//Assets.getAtlas().getTexture(title.graphics,"welcome_title")
			this.addChild(title);

			rankBtn = new Button("welcome_rankButton");
			//Assets.getAtlas().getTexture(rankBtn.graphics,"about_backButton")
			rankBtn.x = 600;
			rankBtn.y = 355;
			rankBtn.scale(0.5, 0.5);
			rankBtn.on(Event.CLICK, this, onRankClick);
			this.addChild(rankBtn);
			
			// WELCOME ELEMENTS
			
			hero = new Image(Assets.getTexture("welcome_hero"));
			//Assets.getAtlas().getTexture(hero.graphics,"welcome_hero")
			hero.x = -hero.width;
			hero.y = 130;
			this.addChild(hero);
			
			playBtn = new Button("welcome_playButton");
			///Assets.getAtlas().getTexture(playBtn.graphics,"welcome_playButton")
			playBtn.x = 600;
			playBtn.y = 535;
			playBtn.scale(0.5, 0.5);
			playBtn.on(Event.CLICK, this, onPlayClick);
			this.addChild(playBtn);
			
			shareBtn = new Button("welcome_inviteButton");
			shareBtn.x = 100;
			shareBtn.y = 535;
			shareBtn.scale(0.5, 0.5);
			shareBtn.on(Event.CLICK, this, onShareClick);
			this.addChild(shareBtn);
			
			// ABOUT ELEMENTS
			//fontRegular = Fonts.getFont("Regular");		
			
		}
		
		/**
		 * On back button click from about screen. 
		 * @param event
		 * 
		 */
		private function onRankClick(event:Event):void
		{
			if (!Sounds.muted) {
				Sounds.playSound(Sounds.sndCoffee)//.play();
			}
			
			//initialize();
			if(Browser.onMiniGame){
				rankSprite = new Sprite();
				var openDataContext = wx.getOpenDataContext();
				var sharedCanvas = openDataContext.canvas;
				
				rankTexture=new Texture(sharedCanvas);
				//rankTexture.bitmap.alwaysChange=true;
				this.addChild(rankSprite);		

				var rx = (Laya.stage.width - rankTexture.width)/2;
				var ry = (Laya.stage.height - rankTexture.height)/2;

				rankSprite.graphics.clear(true);				

				if((this.rankCount%2) == 1)
				{
					rankSprite.visible = true;
					rankSprite.graphics.drawTexture(rankTexture, rx, ry, rankTexture.width, rankTexture.height);
				}else
				{
					rankSprite.visible = false;
					rankSprite.graphics.setAlpha(0);
				}
				this.rankCount += 1;
			}
		}
		
		/**
		 * On play button click. 
		 * @param event
		 * 
		 */
		private function onPlayClick(event:Event):void
		{
			trace("play");
			this.event(NavigationEvent.CHANGE_SCREEN, {id: "play"});
			
			if (!Sounds.muted) Sounds.playSound(Sounds.sndCoffee)//.play();
		}
		
		/**
		 * On about button click. 
		 * @param event
		 * 
		 */
		private function onShareClick(event:Event):void
		{
			if (!Sounds.muted) Sounds.playSound(Sounds.sndMushroom)//.play();
			showShare();
		}
		
		/**
		 * Show about screen. 
		 * 
		 */
		public function showShare():void
		{
			// screenMode = "about";
			
			// hero.visible = false;
			// playBtn.visible = false;
			// shareBtn.visible = false;
			
			// rankBtn.visible = true;
			
			if(Browser.onMiniGame)
			{
				wx.shareAppMessage({
					title: "饿了么英雄",
					imageUrl: "http://www.hungryherogame.com/images/promo.jpg",
					query: ""
				});
			}
		}
		
		/**
		 * Initialize welcome screen. 
		 * 
		 */
		public function initialize():void
		{
			disposeTemporarily();
			
			this.visible = true;
			
			// If not coming from about, restart playing background music.
			if (screenMode != "about")
			{
				if (!Sounds.muted) Sounds.playMusic(Sounds.sndBgMain)//.play(0, 999);
			}
			
			screenMode = "welcome";
			
			hero.visible = true;
			playBtn.visible = true;
			shareBtn.visible = true;
			
			rankBtn.visible = true;
			
			hero.x = -hero.width;
			hero.y = 100;
			
			//tween_hero = new Tween(hero, 4, Transitions.EASE_OUT);
			//tween_hero.animate("x", 80);
			//Starling.juggler.add(tween_hero);
			hero.x = 80;
			
			
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
			hero.y = 130 + (Math.cos(_currentDate.getTime() * 0.002)) * 25;
			rankBtn.y = 355 + (Math.cos(_currentDate.getTime() * 0.002)) * 10;
			playBtn.y = 535 + (Math.cos(_currentDate.getTime() * 0.002)) * 10;
			shareBtn.y = 535 + (Math.cos(_currentDate.getTime() * 0.002)) * 10;
		}
		
		/**
		 * Dispose objects temporarily. 
		 * 
		 */
		public function disposeTemporarily():void
		{
			this.visible = false;
			Laya.timer.clear(this, floatingAnimation);
			//if (this.hasListener(Event.FRAME)) this.off(Event.FRAME,this, floatingAnimation);
			
			if (screenMode != "about") {
				SoundManager.stopAll();
			}
		}
	}
}