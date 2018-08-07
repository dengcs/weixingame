package utils
{
	import laya.display.Sprite;
	import com.hsharma.hungryHero.GameConstants;

	/**
	 * ...
	 * @author
	 */
	public class PositionHelper{
		public function PositionHelper(){
			
		}

		public static function relocateY(me:Sprite):void
		{
			var mvY:Number = GameConstants.stageHeight - Laya.stage.height;	
			me.y = me.y - mvY;
		}

		public static function relocateCenter(me:Sprite):void
		{
			me.y = Laya.stage.height/2 - me.height/2;
		}
	}

}