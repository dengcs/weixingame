/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 

	public class GameOverUI extends Dialog {
		public var myscore:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"Dialog","props":{"width":400,"height":400,"alpha":1},"child":[{"type":"Image","props":{"y":0,"x":0,"width":400,"skin":"gameOverDialog/img_bg.png","height":300},"child":[{"type":"Image","props":{"y":11,"x":54,"width":269,"skin":"gameOverDialog/img_score.png","height":55}},{"type":"Label","props":{"y":79,"x":50,"width":300,"var":"myscore","text":"0","name":"myscore","height":68,"fontSize":40,"font":"Microsoft YaHei","color":"#ffffff","bold":false,"align":"center"}},{"type":"Image","props":{"y":180,"x":31,"width":337,"skin":"gameOverDialog/img_invite.png","height":92},"child":[{"type":"Label","props":{"y":28,"x":269,"text":"20","fontSize":30,"font":"Microsoft YaHei","color":"#ffff00","bold":true,"align":"center"}}]}]},{"type":"Image","props":{"y":319,"x":40,"width":319,"skin":"gameOverDialog/img_pass.png","name":"close","mouseEnabled":true,"height":71}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}