/**Created by the LayaAirIDE,do not modify.*/
package ui.test {
	import laya.ui.*;
	import laya.display.*; 

	public class RBaseUI extends View {
		public var h_img:Image;
		public var name_txt:Label;
		public var v_txt:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":198,"height":69},"child":[{"type":"Rect","props":{"y":-3,"x":-6,"width":204,"lineWidth":1,"height":71,"fillColor":"#ff0000"}},{"type":"Image","props":{"y":8,"x":5,"width":60,"var":"h_img","height":60}},{"type":"Label","props":{"y":19,"x":77,"var":"name_txt","text":"label","fontSize":20,"color":"#ffffff"}},{"type":"Label","props":{"y":20,"x":135,"var":"v_txt","text":"label","fontSize":20,"color":"#ffffff"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}