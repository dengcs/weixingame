/**Created by the LayaAirIDE,do not modify.*/
package ui.test {
	import laya.ui.*;
	import laya.display.*; 

	public class ChaoyueUI extends View {
		public var h_img:Image;
		public var name_txt:Label;
		public var v_txt:Label;
		public var info_txt:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":67,"height":99},"child":[{"type":"Image","props":{"y":3,"x":5,"width":60,"var":"h_img","height":60}},{"type":"Label","props":{"y":59,"x":16,"var":"name_txt","text":"label","fontSize":20,"color":"#ffffff","align":"left"}},{"type":"Label","props":{"y":77,"x":16,"var":"v_txt","text":"label","fontSize":20,"color":"#ffffff","align":"left"}},{"type":"Label","props":{"y":2,"x":12,"var":"info_txt","text":"label","fontSize":20,"color":"#ffffff","align":"left"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}