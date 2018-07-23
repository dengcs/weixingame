package sdk 
{
	import wx;
	import laya.display.Sprite;
	import ui.test.RBaseUI;
	import laya.ui.List;
	import laya.utils.Handler;
	/**
	 * ...
	 * @author lizhi
	 */
	public class WXShareUtils 
	{
		var list:List;
		public function WXShareUtils() 
		{
				wx.onMessage(
					function(data:Object):void{
						trace("onmessage", data);
						var id:int = data.id;
						switch(id){
							case "getFriendCloudStorage":
							{
								wx.getFriendCloudStorage({
									keyList:["score"],
								  success: function(res):void {
									drawRankList(res);
								  }
								})
								break;
							}
							case "showRank":
							{
								showRank();
								break;
							}
							case "hideRank":
							{
								hideRank();
								break;
							}
						}
					}
				);

				// var sharedCanvas = wx.getSharedCanvas();
				// var context = sharedCanvas.getContext('2d');
				// context.fillStyle="#FF0000";
				// context.fillRect(0,0,600,600);
		}
		
		//private function drawRankList(res:Object):void{
			//trace("drawRankList",res);
//
			//if(view&&view.parent){
				//view.removeSelf();
			//}
			//view=new Sprite();
			//Laya.stage.addChild(view);
			//for(var i:Number=0;i<res.data.length;i++){
				//var data:Object=res.data[i];
				//var rb:RBaseUI=new RBaseUI();
				//rb.y=i*70;
				//view.addChild(rb);
				//rb.name_txt.text=data.nickname;
				//for each(var kv:Object in data.KVDataList){
					//if(kv.key=="score"){
						//rb.v_txt.text=kv.value;
					//}
				//}
				//rb.h_img.skin=data.avatarUrl;
			//}
		//}

		private function sortScore(a:Object, b:Object):Boolean
		{
			return parseInt(a.score) < parseInt(b.score);
		}
		
		private function drawRankList(res:Object):void
		{
			trace("drawRankList", res);
			if(list == null)
			{
				list = new List();
			}

			if(list && list.parent){
				list.removeSelf();
			}			
			
			list.itemRender = RBaseUI;
			
			list.repeatX = 1;
			list.repeatY = 4;			
			
			// 使用但隐藏滚动条
			list.vScrollBarSkin = "";			
			
			list.renderHandler = new Handler(this, updateItem);

			Laya.stage.addChild(list);
			
			// 设置数据项为对应图片的路径
			var dataArray:Array = [];
			for(var i:Number=0;i<res.data.length;i++)
			{
				var data:Object = res.data[i];
				
				dataArray.push({"nickname":data.nickname,"score":data.KVDataList[0].value,"img":data.avatarUrl});
			}

			dataArray.sort(sortScore);

			list.array = dataArray;

			list.x = (Laya.stage.width - list.width)/2;
			list.y = 0;			
		}
		
		private function updateItem(cell:RBaseUI, index:int):void 
		{
			cell.name_txt.text = cell.dataSource.nickname;
			cell.v_txt.text = cell.dataSource.score;
			cell.h_img.skin = cell.dataSource.img;
		}

		private function hideRank():void
		{	
			list.visible = false;
		}

		private function showRank():void
		{
			list.visible = true;
		}
	}

}