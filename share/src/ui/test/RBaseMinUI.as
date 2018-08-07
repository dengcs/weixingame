/**Created by the LayaAirIDE,do not modify.*/
package ui.test {
	import laya.ui.*;
	import laya.display.*; 

	public class RBaseMinUI extends View {
		public var h_img:Image;
		public var name_txt:Label;
		public var v_txt:Label;
		public var index_txt:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":71,"height":109},"child":[{"type":"Image","props":{"y":27,"x":5,"width":60,"var":"h_img","height":60}},{"type":"Label","props":{"y":30,"x":19,"var":"name_txt","text":"label","fontSize":20,"color":"#ffffff","align":"left"}},{"type":"Label","props":{"y":86,"x":15,"var":"v_txt","text":"label","fontSize":20,"color":"#ffffff","align":"left"}},{"type":"Label","props":{"y":6,"x":16,"var":"index_txt","text":"label","fontSize":20,"color":"#ffffff","align":"left"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}