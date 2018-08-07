/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 

	public class SettleDialogUI extends Dialog {
		public var myscore:Label;
		public var showRank:Label;
		public var rank_box:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"Dialog","props":{"width":1024,"height":576,"alpha":1},"child":[{"type":"Image","props":{"y":87,"x":270,"width":517,"skin":"gameOverDialog/img_bg.png","height":323,"alpha":1},"child":[{"type":"Image","props":{"y":49,"x":178,"width":166,"skin":"gameOverDialog/img_curscore.png","height":40}},{"type":"Label","props":{"y":119,"x":125,"width":273,"var":"myscore","text":"0","name":"myscore","height":47,"fontSize":35,"font":"Microsoft YaHei","color":"#ffffff","bold":false,"align":"center"}},{"type":"Label","props":{"y":289,"x":114,"width":300,"var":"showRank","underline":true,"text":"查看完整排行榜","name":"showRank","mouseEnabled":true,"italic":false,"hitTestPrior":false,"height":30,"fontSize":20,"font":"Microsoft YaHei","color":"#000000","bold":false,"align":"center"}}]},{"type":"Image","props":{"y":418,"x":373,"width":317,"skin":"gameOverDialog/img_again.png","name":"close","mouseEnabled":true,"height":92}},{"type":"Sprite","props":{"y":258,"x":317,"var":"rank_box"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}