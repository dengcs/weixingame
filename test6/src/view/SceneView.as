package view
{
	import ui.SkillVideoUI;
	import sdk.WXUtils;
	import com.hsharma.hungryHero.events.NavigationEvent;
	import laya.events.Event;
	import laya.resource.Texture;
	import laya.display.Sprite;
	import laya.utils.Browser;
	import laya.utils.Handler;
	import laya.utils.Tween;
	import laya.resource.Bitmap;
	import com.hsharma.hungryHero.GameConstants;
	import utils.PositionHelper;
	import laya.webgl.shapes.Ellipse;

	/**
	 * ...
	 * @dengcs
	 */
	public class SceneView extends SkillVideoUI{
		/** Lives left. */
		private var _lives:int;

		/** Distance travelled. */
		private var _distance:int;
		
		/** Food items score. */
		private var _foodScore:int;

		//咖啡数
		private var _coffee:int;
		//蘑菇数
		private var _mushroom:int;

		public function SceneView(){
			img_mushroom_tips.alpha = 0;
			img_coffee_tips.alpha = 0;

			img_coffee.on(Event.CLICK, this, onAddCoffee);
			img_mushroom.on(Event.CLICK, this, onAddMushroom);
			img_pause.on(Event.CLICK, this, onPause);			
			onResize();
		}

		public function init():void
		{
			coffee = 1;
			mushroom = 1;
			lives = GameConstants.HERO_LIVES;
			foodScore = 0;
		}

		private function onResize():void 
		{
			PositionHelper.relocateY(img_coffee);
			PositionHelper.relocateY(img_mushroom);

			PositionHelper.relocateCenter(img_mushroom_tips);
			PositionHelper.relocateCenter(img_coffee_tips);
		}

		private function onVAD(type:int):void 
		{
			//WXUtils.instance.showRewardedVideoAd();

			if(type == 1)
			{
				WXUtils.instance.showShare(Handler.create(this, addMushroom, null, true));				
			}else{
				WXUtils.instance.showShare(Handler.create(this, addCoffee, null, true));				
			}
		}

		private function onPause():void
		{
			this.event(NavigationEvent.DIALOG_TO_GAME, {id:"pause"});
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
			lab_lives.text = _lives.toString();
		}

		/**
		 * Food items score. 
		 * @return 
		 * 
		 */
		public function get foodScore():int { return _foodScore; }
		public function set foodScore(value:int):void
		{
			_foodScore = value;
			lab_score.text = _foodScore.toString();
			WXUtils.instance.setChaoyue(value);
		}

		public function get coffee():int { return _coffee; }
		public function set coffee(value:int):void
		{
			_coffee = value;
			if(_coffee == 0)
			{
				lab_coffee.text = "+";
			}else{
				lab_coffee.text = _coffee.toString();
			}
		}

		public function get mushroom():int { return _mushroom; }
		public function set mushroom(value:int):void
		{
			_mushroom = value;
			if(_mushroom == 0)
			{
				lab_mushroom.text = "+";
			}else{
				lab_mushroom.text = _mushroom.toString();
			}
		}

		private function addCoffee():void
		{
			this.coffee++;
			img_coffee_tips.alpha = 1;
			Tween.to(img_coffee_tips,{alpha:0},1000);			
		}

		private function addMushroom():void
		{
			this.mushroom++;
			img_mushroom_tips.alpha = 1;
			Tween.to(img_mushroom_tips,{alpha:0},1000);
		}

		private function onAddCoffee():void{
			if(coffee>0)
			{
				coffee--;
				this.event(NavigationEvent.DIALOG_TO_GAME, {id:"coffee"});
			}else{
				onVAD(0);
			}
		}

		private function onAddMushroom():void{
			if(mushroom>0)
			{
				mushroom--;
				this.event(NavigationEvent.DIALOG_TO_GAME, {id:"mushroom"});
			}else{
				onVAD(1);
			}
		}
	}

}