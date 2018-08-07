/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 

	public class GameOverUI extends Dialog {
		public var myscore:Label;
		public var img_invite:Image;
		public var lab_lefttime:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"Dialog","props":{"width":1024,"height":576,"alpha":1},"child":[{"type":"Image","props":{"y":97,"x":272,"width":489,"skin":"gameOverDialog/img_bg.png","height":300},"child":[{"type":"Image","props":{"y":34,"x":154,"width":183,"skin":"gameOverDialog/img_score.png","height":40}},{"type":"Label","props":{"y":108,"x":144,"width":211,"var":"myscore","text":"0","name":"myscore","height":39,"fontSize":35,"font":"Microsoft YaHei","color":"#ffffff","bold":false,"align":"center"}},{"type":"Image","props":{"y":182,"x":93,"width":323,"var":"img_invite","skin":"gameOverDialog/img_invite.png","mouseEnabled":true,"height":88},"child":[{"type":"Label","props":{"y":24,"x":244,"var":"lab_lefttime","text":"20","fontSize":30,"font":"Microsoft YaHei","color":"#ffff00","bold":true,"align":"center"}}]}]},{"type":"Image","props":{"y":446,"x":425,"width":195,"skin":"gameOverDialog/img_pass.png","name":"close","mouseEnabled":true,"height":34}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}