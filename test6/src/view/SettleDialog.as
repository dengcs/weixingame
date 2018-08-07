package view
{
	import laya.events.Event;
	import laya.resource.Texture;
	import laya.utils.Browser;
	import ui.SettleDialogUI;	
	import laya.utils.Handler;
	import com.hsharma.hungryHero.events.NavigationEvent;
	import wx;
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
			if(type == "close")
			{
				this.event(NavigationEvent.DIALOG_TO_GAME, {id: "playAgain"});
			}
		}
	}

}