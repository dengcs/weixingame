/**Created by the LayaAirIDE,do not modify.*/
package ui.test {
	import laya.ui.*;
	import laya.display.*; 
	import ui.test.RBaseMinUI;

	public class RankMinUI extends View {
		public var list:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":427,"height":114},"child":[{"type":"List","props":{"y":3,"x":2,"width":399,"var":"list","height":94},"child":[{"type":"RBaseMin","props":{"renderType":"render","runtime":"ui.test.RBaseMinUI"}}]}]};
		override protected function createChildren():void {
			View.regComponent("ui.test.RBaseMinUI",RBaseMinUI);
			super.createChildren();
			createView(uiView);

		}

	}
}