
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
						
						var openDataContext = wx.getOpenDataContext();
						openDataContext.postMessage({
						  id:"getFriendCloudStorage"
						})
					}
				}
			);
			}
		}
		
	}

}