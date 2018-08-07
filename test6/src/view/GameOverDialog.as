package view
{
	import sdk.WXUtils;
	import ui.GameOverUI;
	import laya.utils.Handler;
	import com.hsharma.hungryHero.events.NavigationEvent;
	import laya.utils.Browser;
	import wx;
	import laya.events.Event;

	/**
	 * ...
	 * @author
	 */
	public class GameOverDialog extends GameOverUI{

		private var left_num:int;

		public function GameOverDialog(){
			left_num = 20;
			this.closeHandler = new Handler(this, onMyClosed);
			this.img_invite.on(Event.CLICK, this, onInvite);
		}
		public function setMyScore(myscore:String):void
		{
			this.myscore.text = myscore;
			
			//WXUtils.instance.setMyScore(myscore);			
		}

		public function onMyClosed(type:String):void {
			if(type == "close")
			{
				this.event(NavigationEvent.DIALOG_TO_GAME);
				Laya.timer.clearAll(this);
			}
		}

		private function onInvite():void
		{
			var reliveHandler:Handler = Handler.create(this, relive, null, true);
			WXUtils.instance.showShare(reliveHandler);
		}
		
		private function relive():void
		{
			this.event(NavigationEvent.DIALOG_TO_GAME, {id:"relive"});
			this.close("relive");
		}

		public override function onOpened():void {
			left_num = 20;
			Laya.timer.loop(1000, this, onLoop);
		}

		private function onLoop():void
		{
			this.lab_lefttime.text = (left_num--).toString();
			if(left_num <= 0)
			{
				this.event(NavigationEvent.DIALOG_TO_GAME);
				this.clearAndClose();				
			}
		}

		public function clearAndClose():void
		{
			Laya.timer.clearAll(this);
			this.close("other");
		}
	}

}