
package sdk 
{
	/**
	 * ...
	 * @author lizhi
	 */
	import wx;
	import laya.utils.Browser;
	public class WXUtils 
	{
		
		public function WXUtils() 
		{
			if(Browser.onMiniGame){
				
			
			wx.login(
				{
					success:function():void{
						wx.getUserInfo({
							openIdList:["selfOpenId","selfOpenId"],
							success:function(res:Object):void{
								trace("success",res.userInfo);
							},
							fail:function():void{
								trace("fail");
							}
						});

						wx.showShareMenu();
						
						wx.setUserCloudStorage({
							KVDataList: [{ key: "score", value: "100" }],
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
						var openDataContext = wx.getOpenDataContext();
						openDataContext.postMessage({
						  id:"getFriendCloudStorage",
							text: 'hello',
						  year: (new Date()).getFullYear()
						})
					}
				}
			);
			}
		}
		
	}

}