
package sdk 
{
	/**
	 * ...
	 * @author lizhi
	 */
	import wx;
	import laya.events.Event;
	import laya.net.Loader;
	import laya.utils.Browser;
	import laya.utils.Handler;
	import laya.resource.Bitmap;
	public class WXUtils 
	{
		public static var instance:WXUtils;
		private var loginObj:Object;
		private var openid:String;
		private var nickName:String;
		private var avatarUrl:String;
		public function WXUtils() 
		{
			instance = this;
			if (Browser.onMiniGame)
			{			
				wx.login({
						success:function(obj:Object):void{
							loginObj = obj;
							trace(obj);
							// wx.getUserInfo({
							// 	openIdList:["selfOpenId","selfOpenId"],
							// 	success:function(res:Object):void{
							// 		trace("success", res.userInfo);
							// 		nickName = res.userInfo.nickName;
							// 		avatarUrl = res.userInfo.avatarUrl;
							// 		//getFriendCloudStorage();	
							// 	},
							// 	fail:function():void{
							// 		trace("fail");
							// 	}
							// });						
							
							wx.showShareMenu({withShareTicket: true});

							wx.onShareAppMessage(function():Object {
								// 用户点击了“转发”按钮
								return {
									title: "饿了么英雄",
									imageUrl: "https://dengcs.oss-cn-shenzhen.aliyuncs.com/promo.jpg",
									query: "",
									success:function(res:Object):void{
										trace("share2--success");
									},
									fail:function():void{
										trace("share2--fail");
									}
								}
							});
						}
					});
			}
		}
		
		/**
		 * 打开视频广告
		 */
		public function showRewardedVideoAd():void{
			if (Browser.onMiniGame){
				wx.showToast({
					  title: '提示',  
					content: '这是一个模态弹窗'
				  })
				return;
				var rewardedVideoAd = wx.createRewardedVideoAd({ adUnitId: 'xxxx' });
				rewardedVideoAd.show();
				rewardedVideoAd.onLoad(function():void{
					trace("视频广告加载成功");
				});
				rewardedVideoAd.onError(function(err):void{
				  trace(err);
				  wx.showToast({
					  title: '提示',  
					content: '这是一个模态弹窗'
				  })
				});
				rewardedVideoAd.onClose(function():void{
					trace("视频广告关闭");
				});
			}else{
				alert("此平台不支持视频广告");
			}
		}
		
		public  function getFriendCloudStorage():void{
			if (Browser.onMiniGame){
				if (/*openid==null*/nickName==null){
					//var url:String = "https://api.weixin.qq.com/sns/jscode2session?appid=wxf8c00b375759b281&secret=4addf8f786efa174e9c2fe297d3dfdd9&js_code="+loginObj.code+"&grant_type=authorization_code"
					//trace(url);
					//Laya.loader.load(url,Handler.create(this,onOpenIDLoaded),null,Loader.JSON,0,false);
				}else{				
					var openDataContext = wx.getOpenDataContext();
					openDataContext.postMessage({
					  id:"getFriendCloudStorage",nickName:nickName,avatarUrl:avatarUrl
					})
				}
			}
		}

		public function getSharedCanvas():Bitmap
		{
			if (Browser.onMiniGame)
			{
				var openDataContext:Object = wx.getOpenDataContext();
				var sharedCanvas:Bitmap = openDataContext.canvas;
				return sharedCanvas; 
			}
			return null;
		}
		
		public function setChaoyue(v:Number):void{
			if(Browser.onMiniGame)
			{
				var openDataContext = wx.getOpenDataContext();
				openDataContext.postMessage({
				  id:"chaoyue",value:v
				})
			}
		}
		
		public  function setMyScore(myscore:String):void
		{
			if(Browser.onMiniGame)
			{
				var openDataContext = wx.getOpenDataContext();
				openDataContext.postMessage({
				  id:"setMyScore",value:myscore
				})
			}
		}

		public function showShare(callBack:Handler):void
		{
			if(Browser.onMiniGame)
			{
				wx.shareAppMessage({
					title: "饿了么英雄",
					imageUrl: "https://dengcs.oss-cn-shenzhen.aliyuncs.com/promo.jpg",
					query: "",
					success:function(res:Object):void{						
						if(callBack != null)
						{
							callBack.run();
						}
					},
					fail:function():void{
						trace("share1-fail")
					}
				});
			}
		}
		
	}

}