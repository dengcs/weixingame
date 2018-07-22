package view
{
	import ui.GameOverUI;
	import laya.utils.Handler;
	import com.hsharma.hungryHero.events.NavigationEvent;
	import laya.utils.Browser;
	import wx;

	/**
	 * ...
	 * @author
	 */
	public class GameOverDialog extends GameOverUI{
		public function GameOverDialog(){
			this.closeHandler = new Handler(this, onMyClosed);
		}
		public function setMyScore(myscore:String):void
		{
			this.myscore.text = myscore;

			if(Browser.onMiniGame)
			{
				wx.setUserCloudStorage({
					KVDataList: [{ key: "score", value: myscore.toString() }],
					success: function(res:Object):void {
						console.log("setusercloud成功",res);
						// 让子域更新当前用户的最高分，因为主域无法得到getUserCloadStorage;
						var openDataContext = wx.getOpenDataContext();
						openDataContext.postMessage({
							id: 'getFriendCloudStorage'
						});
					},
					fail: function(res:Object):void {
						trace("setcloud失败",res);
					}
				});
			}
		}

		public function onMyClosed(type:String):void {
			this.event(NavigationEvent.CHANGE_SCREEN);
		}
	}

}