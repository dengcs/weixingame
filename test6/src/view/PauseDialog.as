package view
{
	import laya.events.Event;
	import ui.PauseDialogUI;
	import laya.utils.Handler;
	import com.hsharma.hungryHero.events.NavigationEvent;
	/**
	 * ...
	 * @dengcs
	 */
	public class PauseDialog extends ui.PauseDialogUI{
		public function PauseDialog(){
			img_main.on(Event.CLICK, this, onMain);
			img_restart.on(Event.CLICK, this, onRestart);
			img_continue.on(Event.CLICK, this, onContinue);			
			
			this.closeHandler = new Handler(this, onMyClosed);
		}

		private function onMain():void 
		{
			this.event(NavigationEvent.DIALOG_TO_GAME, {id: "main"});
		}

		private function onRestart():void 
		{
			this.event(NavigationEvent.DIALOG_TO_GAME, {id: "restart"});
		}

		private function onContinue():void 
		{
			this.event(NavigationEvent.DIALOG_TO_GAME, {id: "continue"});
		}

		private function onMyClosed(type:String):void {
			if(type == "close")
			{
				this.event(NavigationEvent.DIALOG_TO_GAME, {id: "continue"});
			}
		}
	}

}