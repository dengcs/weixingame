/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 

	public class SkillVideoUI extends View {
		public var img_coffee:Image;
		public var lab_coffee:Label;
		public var img_mushroom:Image;
		public var lab_mushroom:Label;
		public var img_live:Image;
		public var lab_lives:Label;
		public var img_score:Image;
		public var lab_score:Label;
		public var img_pause:Image;
		public var img_mushroom_tips:Image;
		public var img_coffee_tips:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1024,"height":768},"child":[{"type":"Image","props":{"y":649,"x":69,"width":100,"var":"img_coffee","skin":"mySpritesheet/item6.png","height":100},"child":[{"type":"Image","props":{"y":-6,"x":53,"skin":"mySpritesheet/img_circle.png"},"child":[{"type":"Label","props":{"x":10,"var":"lab_coffee","top":3,"text":"1","rotation":0,"fontSize":25,"font":"Helvetica","color":"#ffffff","bold":false,"align":"center"}}]}]},{"type":"Image","props":{"y":649,"x":202,"width":100,"var":"img_mushroom","skin":"mySpritesheet/item7.png","height":100},"child":[{"type":"Image","props":{"y":-6,"x":51,"skin":"mySpritesheet/img_circle.png"},"child":[{"type":"Label","props":{"x":10,"var":"lab_mushroom","top":3,"text":"1","rotation":0,"fontSize":25,"font":"Helvetica","color":"#ffffff","bold":false,"align":"center"}}]}]},{"type":"Image","props":{"y":22,"x":219,"var":"img_live","skin":"mySpritesheet/img_life.png"},"child":[{"type":"Label","props":{"y":1,"x":80,"width":34,"var":"lab_lives","text":"666","height":30,"fontSize":25,"font":"Microsoft YaHei","color":"#eaeaea","bold":true,"align":"left"}}]},{"type":"Image","props":{"y":21,"x":627,"var":"img_score","skin":"mySpritesheet/img_score.png"},"child":[{"type":"Label","props":{"y":1,"x":78,"width":96,"var":"lab_score","text":"85","height":30,"fontSize":23,"font":"Microsoft YaHei","color":"#eaeaea","bold":true,"align":"left"}}]},{"type":"Image","props":{"y":16,"x":41,"width":47,"visible":false,"skin":"mySpritesheet/soundOff.png","height":47}},{"type":"Image","props":{"y":16,"x":41,"width":47,"visible":false,"skin":"mySpritesheet/soundOn0000.png","height":47}},{"type":"Image","props":{"y":16,"x":41,"width":47,"visible":false,"skin":"mySpritesheet/soundOn0001.png","height":47}},{"type":"Image","props":{"y":16,"x":41,"width":47,"visible":false,"skin":"mySpritesheet/soundOn0002.png","height":47}},{"type":"Image","props":{"y":16,"x":113,"width":47,"var":"img_pause","skin":"mySpritesheet/pauseButton.png","height":47}},{"type":"Image","props":{"y":359,"x":522,"var":"img_mushroom_tips","skin":"mySpritesheet/daojumogu_text.png","anchorY":0.5,"anchorX":0.5}},{"type":"Image","props":{"y":359,"x":522,"var":"img_coffee_tips","skin":"mySpritesheet/daojukafei_text.png","anchorY":0.5,"anchorX":0.5}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}