/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 

	public class PauseDialogUI extends Dialog {
		public var img_main:Image;
		public var img_restart:Image;
		public var img_continue:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"Dialog","props":{"width":1024,"height":576},"child":[{"type":"Image","props":{"y":141,"x":275,"width":474,"skin":"pauseDialog/img_bj.png","height":282},"child":[{"type":"Image","props":{"y":105,"x":47,"width":97,"var":"img_main","skin":"pauseDialog/img_home.png","mouseEnabled":true,"height":123}},{"type":"Image","props":{"y":105,"x":197,"width":98,"var":"img_restart","skin":"pauseDialog/img_restart.png","mouseEnabled":true,"height":123}},{"type":"Image","props":{"y":108,"x":343,"width":90,"var":"img_continue","skin":"pauseDialog/img_run.png","height":122}},{"type":"Button","props":{"y":-14,"x":440,"width":43,"stateNum":1,"skin":"pauseDialog/btn_close.png","name":"close","height":44}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}