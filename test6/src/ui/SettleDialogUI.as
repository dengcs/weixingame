/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 

	public class SettleDialogUI extends Dialog {
		public var myscore:Label;
		public var showRank:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"Dialog","props":{"width":400,"height":400,"alpha":1},"child":[{"type":"Image","props":{"y":0,"x":0,"width":400,"skin":"gameOverDialog/img_bg.png","height":300,"alpha":1},"child":[{"type":"Image","props":{"y":12,"x":68,"width":264,"skin":"gameOverDialog/img_curscore.png","height":42}},{"type":"Label","props":{"y":70,"x":50,"width":300,"var":"myscore","text":"0","name":"myscore","height":60,"fontSize":40,"font":"Microsoft YaHei","color":"#ffffff","bold":false,"align":"center"}},{"type":"Label","props":{"y":270,"x":50,"width":300,"var":"showRank","underline":true,"text":"查看完整排行榜","name":"showRank","mouseEnabled":true,"italic":false,"hitTestPrior":false,"height":30,"fontSize":20,"font":"Microsoft YaHei","color":"#000000","bold":false,"align":"center"}}]},{"type":"Image","props":{"y":318,"x":64,"width":271,"skin":"gameOverDialog/img_again.png","name":"close","mouseEnabled":true,"height":60}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}