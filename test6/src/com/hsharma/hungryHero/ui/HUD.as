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
	import com.hsharma.hungryHero.GameConstants;
	import com.hsharma.hungryHero.StarlingTextField;
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.ui.Image;
	import com.hsharma.hungryHero.Assets;
	import laya.display.Stage;
	
	/**
	 * This class handles the Heads Up Display for the game.
	 *  
	 * @author hsharma
	 * 
	 */
	public class HUD extends Sprite
	{
		/** Lives left. */
		private var _lives:int;
		
		/** Distance travelled. */
		private var _distance:int;
		
		/** Food items score. */
		private var _foodScore:int;
		
		/** Lives icon.  */		
		private var livesImg:Image;
		
		/** Lives TextField. */		
		private var livesText:StarlingTextField;
		
		/** Distance icon. */		
		//private var distanceLabel:StarlingTextField;
		
		/** Distance TextField. */		
		//private var distanceText:StarlingTextField;
		
		/** Food Score icon. */
		private var foodScoreImg:Image;
		
		/** Food Score TextField. */		
		private var foodScoreText:StarlingTextField;
		
		/** Font for score label. */		
		//private var fontScoreLabel:Font;
		
		/** Font for score value. */		
		//private var fontScoreValue:Font;

		private var item1Img:Image;
		private var item2Img:Image;
		private var viewVideoImg:Image;
		
		public function HUD()
		{
			super();
			this.on(Event.ADDED,this, onAddedToStage);
		}
		
		/**
		 * On added to stage. 
		 * @param event
		 * 
		 */
		private function onAddedToStage(event:Event):void
		{
			off(Event.ADDED,this, onAddedToStage);
			// Get fonts for score labels and values.
			//fontScoreLabel = com.hsharma.hungryHero.Fonts.getFont("ScoreLabel");
			//fontScoreValue = com.hsharma.hungryHero.Fonts.getFont("ScoreValue");
			
			// Lives label
			livesImg = new Image(Assets.getTexture("img_life"));
			//livesLabel.hAlign = HAlign.RIGHT;
			//livesLabel.vAlign = VAlign.TOP;			
			livesImg.x = 150;
			livesImg.y = 20;
			livesImg.scale(0.5, 0.5);
			this.addChild(livesImg);
			
			// Lives
			livesText = new StarlingTextField(150, 20, "5", "Microsoft YaHei", 20, "#ffffff");
			//livesText.hAlign = HAlign.RIGHT;
			//livesText.vAlign = VAlign.TOP;

			livesText.x = Math.floor(livesImg.x + (livesImg.width*livesImg.scaleX)/2 - 20);
			livesText.y = livesImg.y + 5;
			this.addChild(livesText);
			
			// Distance label
			//distanceLabel = new StarlingTextField(150, 20, "D I S T A N C E", null, 20, "#ffffff");
			//distanceLabel.hAlign = HAlign.RIGHT;
			//distanceLabel.vAlign = VAlign.TOP;

			//distanceLabel.x = Math.floor(GameConstants.stageWidth - distanceLabel.width - 10);
			//distanceLabel.y = 5;
			//this.addChild(distanceLabel);
			
			// Distance
			//distanceText = new StarlingTextField(150, 75, "0", null, 20, "#ffffff");
			//distanceText.hAlign = HAlign.RIGHT;
			//distanceText.vAlign = VAlign.TOP;
			//distanceText.width = distanceLabel.width;
			
			//distanceText.x = Math.floor(distanceLabel.x + distanceLabel.width - distanceText.width);
			//distanceText.y = distanceLabel.y + distanceLabel.height;
			//this.addChild(distanceText);
			
			// Score label
			foodScoreImg = new Image(Assets.getTexture("img_score"));
			//foodScoreLabel.hAlign = HAlign.RIGHT;
			//foodScoreLabel.vAlign = VAlign.TOP;

			foodScoreImg.x = 660;
			foodScoreImg.y = 20;
			foodScoreImg.scale(0.5, 0.5);
			this.addChild(foodScoreImg);
			
			// Score
			foodScoreText = new StarlingTextField(150, 20, "0", "Microsoft YaHei", 20, "#ffffff");
			//foodScoreText.hAlign = HAlign.RIGHT;
			//foodScoreText.vAlign = VAlign.TOP;
			
			foodScoreText.x = Math.floor(foodScoreImg.x + (foodScoreImg.width*foodScoreImg.scaleX)/2 - 20);
			foodScoreText.y = foodScoreImg.y + 5;
			this.addChild(foodScoreText);
 
			item1Img = new Image(Assets.getTexture("item6"));
			item2Img = new Image(Assets.getTexture("item7"));
			viewVideoImg = new Image(Assets.getTexture("img_view_video"));
			viewVideoImg.x = 20;
			viewVideoImg.scale(0.5, 0.5);
			viewVideoImg.y = Laya.stage.height - viewVideoImg.height*viewVideoImg.scaleY - 20;
			this.addChild(viewVideoImg);

			item1Img.x = 50;
			item1Img.y = viewVideoImg.y - viewVideoImg.height*viewVideoImg.scaleY - 5;

			var circleImg1:Image = new Image(Assets.getTexture("img_circle"));
			circleImg1.scale(0.5, 0.5);
			circleImg1.x = 40;

			var circleLab1:StarlingTextField = new StarlingTextField(20, 20, "3", "Microsoft YaHei", 20, "#ffffff");
			circleLab1.x = circleImg1.width/4;
			circleLab1.y = circleImg1.height/4;
			circleImg1.addChild(circleLab1);

			item1Img.addChild(circleImg1);

			this.addChild(item1Img);

			item2Img.x = item1Img.x + item1Img.width + 20;
			item2Img.y = item1Img.y;

			var circleImg2:Image = new Image(Assets.getTexture("img_circle"));
			circleImg2.scale(0.5, 0.5);
			circleImg2.x = 40;

			var circleLab2:StarlingTextField = new StarlingTextField(20, 20, "1", "Microsoft YaHei", 20, "#ffffff");
			circleLab2.x = circleImg2.width/4;
			circleLab2.y = circleImg2.height/4;
			circleImg2.addChild(circleLab2);

			item2Img.addChild(circleImg2);

			this.addChild(item2Img);
		}

		/**
		 * Lives left. 
		 * @return 
		 * 
		 */
		public function get lives():int { return _lives; }
		public function set lives(value:int):void
		{
			_lives = value;
			livesText.text = _lives.toString();
		}

		/**
		 * Distance travelled. 
		 * @return 
		 * 
		 */
		// public function get distance():int { return _distance; }
		// public function set distance(value:int):void
		// {
		// 	_distance = value;
		// 	distanceText.text = _distance.toString();
		// }

		/**
		 * Food items score. 
		 * @return 
		 * 
		 */
		public function get foodScore():int { return _foodScore; }
		public function set foodScore(value:int):void
		{
			_foodScore = value;
			foodScoreText.text = _foodScore.toString();
		}
		
		/**
		 * Add leading zeros to the score numbers. 
		 * @param value
		 * @return 
		 * 
		 */
		private function addZeros(value:int):String {
			var ret:String = String(value);
			while (ret.length < 7) {
				ret = "0" + ret;
			}
			return ret;
		}
	}
}