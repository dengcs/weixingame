package sdk 
{
	import wx;
	import laya.display.Sprite;
	import ui.test.ChaoyueUI;
	import ui.test.RBaseMinUI;
	import ui.test.RBaseUI;
	import laya.ui.List;
	import laya.utils.Browser;
	import laya.utils.Handler;
	import ui.test.RankMinUI;
	/**
	 * ...
	 * @author lizhi
	 */
	public class WXShareUtils 
	{
		public var instance:WXShareUtils;
		private var list:List;
		private var minilist:RankMinUI;
		private var chaoyue:ChaoyueUI=new ChaoyueUI;
		public var rankData:Array;
		public var sortedRankData:Array;
		
		private var nickName:String;
		private var avatarUrl:String;
		private var listX:Number=0;
		private var listY:Number = 120;
		private var listWidth:Number = 350;
	    private var listHeight:Number = 300;
		private var minListWidth:Number = 500;
		private var myScore:Number = 0;//我的当前分数
		private var myMaxScore:Number = 0;
		private var myobj:Object;
		public function WXShareUtils() 
		{
			instance = this;
			if (Browser.onMiniGame){
				wx.onMessage(
					function(data:Object):void{
						trace("onmessage", data);
						var id:int = data.id;
						switch(id){
							case "getFriendCloudStorage":
							//{
								nickName = data.nickName;
								avatarUrl=data.avatarUrl;
								getFriendCloudStorage();
								break;
							//}
							case "setMyScore":
							//{
								setMyScore(data.value);
								break;
							//}
							case "chaoyue":
								myScore = data.value;
								updateChaoyue();
								break;
							case "xy":
								listX = data.x;
								listY = data.y;
								if (listY<120){
									listY = 120;
								}
								drawRankList();
								break;
							case "wh":
								Laya.stage.width = data.w;
								Laya.stage.height = data.h;
								drawRankList();
								break;
							case "reisize":
								drawRankList();
								break;
								
						}
					}
				);
			}else{
				//测试
				rankData = [];
				rankData.length = 100;
				sortedRankData = rankData;
				drawRankList();
			}
			
				Laya.stage.addChild(chaoyue);
		}
		
		public function getFriendCloudStorage():void{
			wx.getFriendCloudStorage({
									keyList:["score"],
								  success: function(res):void {
									  rankData = res.data;
									  var dataArray:Array = [];
										for(var i:Number=0;i<rankData.length;i++)
										{
											var data:Object = rankData[i];
											if (data){
												var newdata:Object = {"nickname":data.nickname, "score":data.KVDataList[0].value, "img":data.avatarUrl};
												var isMe:Boolean = false;
												if (nickName == data.nickname && avatarUrl == data.avatarUrl){
													var kvs:Array = data.KVDataList;
													myobj = newdata;
													trace("找到了自己的openid");
													isMe = true;
													for each(var kv:Object in kvs){
														if (kv.key == "score"){
															myMaxScore = parseFloat(kv.value);
															break;
														}
													}
												}
												if (isMe){
													newdata.nickname = "我";
												}
												dataArray.push(newdata);
											}else{
												dataArray.push(null);
											}
										}

										dataArray.sort(sortScore);
										sortedRankData = dataArray;
									drawRankList();
								  }
								})
		}
		
		public function setMyScore(value:String):void{
			if (rankData&&nickName){
				if (myMaxScore>=parseFloat(value)){
					trace("历史分数是"+myMaxScore+" 当前分数是"+value+"不存储");
					return;
				}
			}
			
			wx.setUserCloudStorage({
					KVDataList: [{ key: "score", value: value }],
					success: function(res:Object):void {
						console.log("setusercloud成功",res);
						// 让子域更新当前用户的最高分，因为主域无法得到getUserCloadStorage;
						getFriendCloudStorage();
					},
					fail: function(res:Object):void {
						trace("setcloud失败",res);
					}
				});
		}
		
		private function updateChaoyue():void{
			chaoyue.y = 0;
			chaoyue.x = minListWidth;
			
			if (rankData&&nickName){
				for (var i:int = sortedRankData.length - 1; i >= 0; i-- ){
					var d:Object = sortedRankData[i];
					if(d){
						var score:Number=parseFloat(d.score)
						if (myScore<score){
							chaoyue.name_txt.text = d.nickname;
							chaoyue.v_txt.text = d.score;
							chaoyue.h_img.skin = d.img;
							chaoyue.info_txt.text = "即将超越";
							return;
						}
					}		
				}
			}
			
			if(myobj){
			chaoyue.name_txt.text = myobj.nickname;
			chaoyue.v_txt.text = myMaxScore+"";
			chaoyue.h_img.skin = myobj.img;
			}
			chaoyue.info_txt.text = "最高分";
		}

		private function sortScore(a:Object, b:Object):int
		{
			return (b?parseFloat(b.score):0) - (a?parseFloat(a.score):0);
		}
		
		private function drawRankList():void
		{
			if (rankData==null){
				return;
			}
			trace("drawRankList", rankData);
			
			if(list==null /*&& list.parent*/){
				list = new List;// .removeSelf();
				list.itemRender = RBaseUI;
				
				list.repeatX = 1;
				list.repeatY = 4;			
				
				// 使用但隐藏滚动条
				list.vScrollBarSkin = "";			
				
				list.renderHandler = new Handler(this, updateItem);
				Laya.stage.addChild(list);
			}
			

			//var s:Sprite = new Sprite();
			//s.graphics.drawRect( 20, 20, Laya.stage.width-40, Laya.stage.height-40, "#ff0000");
			//Laya.stage.addChild(s);
			
			
			list.array = sortedRankData;

			list.x = listX;//0//(Laya.stage.width - list.width)/2;
			list.y = listY;//0;
			
			if (minilist==null){
				minilist = new RankMinUI;
				minilist.list.renderHandler = new Handler(this, updateItemMin);
				Laya.stage.addChild(minilist);
			}
			minilist.y = 0;
			minilist.list.array = sortedRankData;
			
			updateChaoyue();
		}
		
		private function updateItem(cell:RBaseUI, index:int):void 
		{
			if(cell.dataSource){
			cell.name_txt.text = cell.dataSource.nickname;
			cell.v_txt.text = cell.dataSource.score;
			cell.h_img.skin = cell.dataSource.img;
			}else{
				cell.name_txt.text = "没数据";
			}
		}
		
		private function updateItemMin(cell:RBaseMinUI, index:int):void 
		{
			if(cell.dataSource){
				cell.name_txt.text = cell.dataSource.nickname;
				cell.v_txt.text = cell.dataSource.score;
				cell.h_img.skin = cell.dataSource.img;
			}else{
				cell.name_txt.text = "没数据";
			}
			cell.index_txt.text = (index + 1) + "";
		}
	}

}