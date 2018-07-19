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

package com.hsharma.hungryHero.ui
{
	import com.hsharma.hungryHero.Assets;
	import com.hsharma.hungryHero.Button;
	import com.hsharma.hungryHero.customObjects.Font;
	import com.hsharma.hungryHero.events.NavigationEvent;
	import com.hsharma.hungryHero.GameConstants;
	import com.hsharma.hungryHero.Quad;
	import com.hsharma.hungryHero.Sounds;
	import com.hsharma.hungryHero.StarlingTextField;
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.ui.Label;
	
	public class GameOverContainer extends Sprite
	{
		/** Background image. */
		private var bg:Quad;
		
		/** Message text field. */
		private var messageText:Label;
		
		/** Score container. */
		private var scoreContainer:Sprite;
		
		/** Score display - distance. */
		private var distanceText:Label;
		
		/** Score display - score. */
		private var scoreText:Label;
		
		/** Play again button. */
		private var playAgainBtn:Button;
		
		/** Main Menu button. */
		private var mainBtn:Button;
		
		/** About button. */
		private var aboutBtn:Button;
		
		/** Font - score display. */
		//private var fontScore:Font;
		
		/** Font - message display. */
		//private var fontMessage:Font;
		
		/** Score value - distance. */
		private var _distance:int;
		
		/** Score value - score. */
		private var _score:int;
		
		public function GameOverContainer()
		{
			super();
			
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
			
			drawGameOver();
		}
		
		/**
		 * Draw game over screen. 
		 * 
		 */
		private function drawGameOver():void
		{
			// Get fonts for text display.
			//fontMessage = com.hsharma.hungryHero.Fonts.getFont("ScoreValue");
			//fontScore = com.hsharma.hungryHero.Fonts.getFont("ScoreLabel");
			
			// Background quad.
			bg = new Quad(GameConstants.stageWidth, GameConstants.stageHeight, 0x000000);
			bg.alpha = 0.75;
			this.addChild(bg);
			
			// Message text field.
			messageText = new StarlingTextField(GameConstants.stageWidth, GameConstants.stageHeight * 0.5, "HERO WAS KILLED!", null, 20, "#f3e75f");
			//messageText.vAlign = VAlign.TOP;
			//messageText.height = messageText.textBounds.height;
			messageText.y = (GameConstants.stageHeight * 20)/100;
			this.addChild(messageText);
			
			// Score container.
			scoreContainer = new Sprite();
			scoreContainer.y = (GameConstants.stageHeight * 40)/100;
			this.addChild(scoreContainer);
			
			distanceText = new StarlingTextField(GameConstants.stageWidth, 100, "DISTANCE TRAVELLED: 0000000", null, 20, "#ffffff");
			//distanceText.vAlign = VAlign.TOP;
			//distanceText.height = distanceText.textBounds.height;
			scoreContainer.addChild(distanceText);
			
			scoreText = new StarlingTextField(GameConstants.stageWidth, 100, "SCORE: 0000000", null, 20, "#ffffff");
			//scoreText.vAlign = VAlign.TOP;
			scoreText.height = scoreText.height;
			scoreText.y = distanceText.y+distanceText.height + scoreText.height * 0.5;
			scoreContainer.addChild(scoreText);
			
			// Navigation buttons.
			mainBtn = new Button("gameOver_mainButton")
			mainBtn.y = (GameConstants.stageHeight * 70)/100;
			mainBtn.on(Event.CLICK, this,onMainClick);
			this.addChild(mainBtn);
			
			playAgainBtn = new Button("gameOver_playAgainButton")
			playAgainBtn.y = mainBtn.y + mainBtn.height * 0.5 - playAgainBtn.height * 0.5;
			playAgainBtn.on(Event.CLICK, this,onPlayAgainClick);
			this.addChild(playAgainBtn);
			
			aboutBtn = new Button("gameOver_aboutButton");
			aboutBtn.y = playAgainBtn.y + playAgainBtn.height * 0.5 - aboutBtn.height * 0.5;
			aboutBtn.on(Event.CLICK,this, onAboutClick);
			this.addChild(aboutBtn);
			
			mainBtn.x = GameConstants.stageWidth * 0.5 - (mainBtn.width + playAgainBtn.width + aboutBtn.width + 30) * 0.5;
			playAgainBtn.x = mainBtn.x + mainBtn.width + 10;
			aboutBtn.x = playAgainBtn.x + playAgainBtn.width + 10;
		}
		
		/**
		 * On play-again button click. 
		 * @param event
		 * 
		 */
		private function onPlayAgainClick(event:Event):void
		{
			if (!com.hsharma.hungryHero.Sounds.muted) com.hsharma.hungryHero.Sounds.playSound(Sounds.sndMushroom)//.play();
			
			this.event(NavigationEvent.CHANGE_SCREEN, {id: "playAgain"});
		}
		
		/**
		 * On main menu button click. 
		 * @param event
		 * 
		 */
		private function onMainClick(event:Event):void
		{
			if (!com.hsharma.hungryHero.Sounds.muted) com.hsharma.hungryHero.Sounds.playSound(Sounds.sndMushroom)//.play();
			
			this.event(NavigationEvent.CHANGE_SCREEN, {id: "mainMenu"});
		}
		
		/**
		 * On about button click. 
		 * @param event
		 * 
		 */
		private function onAboutClick(event:Event):void
		{
			if (!com.hsharma.hungryHero.Sounds.muted) com.hsharma.hungryHero.Sounds.playSound(Sounds.sndMushroom)//.play();
			
			this.event(NavigationEvent.CHANGE_SCREEN, {id: "about"});
		}
		
		/**
		 * Initialize Game Over container. 
		 * @param _score
		 * @param _distance
		 * 
		 */
		public function initialize(_score:int, _distance:int):void
		{
			this._distance = _distance;
			this._score = _score;

			distanceText.text = "DISTANCE TRAVELLED: " + this._distance.toString();
			scoreText.text = "SCORE: " + this._score.toString();
			
			this.alpha = 0;
			this.visible = true;
		}
		
		/**
		 * Score. 
		 * @return 
		 * 
		 */
		public function get score():int { return _score; }
		
		/**
		 * Distance. 
		 * @return 
		 * 
		 */
		public function get distance():int { return _distance; }
	}
}