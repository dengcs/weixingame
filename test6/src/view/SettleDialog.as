package view
{
	import ui.SettleDialogUI;	
	import laya.utils.Handler;
	import com.hsharma.hungryHero.events.NavigationEvent;
	/**
	 * ...
	 * @dengcs
	 */
	public class SettleDialog extends SettleDialogUI{
		public function SettleDialog(){
			this.closeHandler = new Handler(this, onMyClosed);
		}

		public function setMyScore(myscore:String):void
		{
			this.myscore.text = myscore;
		}

		public function onMyClosed(type:String):void {
			this.event(NavigationEvent.CHANGE_SCREEN, {id: "playAgain"});
		}
	}

}