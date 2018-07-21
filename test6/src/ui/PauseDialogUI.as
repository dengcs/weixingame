/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 

	public class PauseDialogUI extends Dialog {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"Dialog","props":{"width":759,"height":452},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"pauseDialog/img_bj.png"},"child":[{"type":"Image","props":{"y":137,"x":39,"skin":"pauseDialog/img_home.png"}},{"type":"Image","props":{"y":133,"x":291,"skin":"pauseDialog/img_restart.png"}},{"type":"Image","props":{"y":136,"x":538,"skin":"pauseDialog/img_run.png"}},{"type":"Button","props":{"y":-22,"x":700,"stateNum":1,"skin":"pauseDialog/btn_close.png","name":"close"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}