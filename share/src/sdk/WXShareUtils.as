package sdk 
{
	import wx;
	import laya.display.Sprite;
	import ui.test.RBaseUI;
	/**
	 * ...
	 * @author lizhi
	 */
	public class WXShareUtils 
	{
		var view:Sprite;
		public function WXShareUtils() 
		{
				wx.onMessage(
					function(data:Object):void{
						trace("onmessage", data);
						var id:int = data.id;
						switch(id){
							case "getFriendCloudStorage":
								wx.getFriendCloudStorage({
									keyList:["score"],
								  success: function(res):void {
									drawRankList(res);
								  }
								})
						}
					}
				);
				
				
				var sharedCanvas = wx.getSharedCanvas();
				var context = sharedCanvas.getContext('2d');
				context.fillStyle = 'red'
				context.fillRect(0, 0, 100, 100);
			//}else{
			//	trace("没有wx");
			//}
		}
		private function drawRankList(res:Object):void{
			trace("drawRankList",res);

			if(view&&view.parent){
				view.removeSelf();
			}
			view=new Sprite();
			Laya.stage.addChild(view);
			for(var i:Number=0;i<res.data.length;i++){
				var data:Object=res.data[i];
				var rb:RBaseUI=new RBaseUI();
				rb.y=i*70;
				view.addChild(rb);
				rb.name_txt.text=data.nickname;
				for each(var kv:Object in data.KVDataList){
					if(kv.key=="score"){
						rb.v_txt.text=kv.value;
					}
				}
				rb.h_img.skin=data.avatarUrl;
			}
		}
		
	}

}