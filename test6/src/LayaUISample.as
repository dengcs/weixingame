package {
	import com.hsharma.hungryHero.GameConstants;
	import com.hsharma.hungryHero.HungryHero1;
	import com.hsharma.hungryHero.StarlingTextField;
	import com.hsharma.hungryHero.gameElements.BgLayer;
	import com.hsharma.hungryHero.ui.HUD;
	import laya.display.Animation;
	import laya.display.Sprite;
	import laya.display.Stage;
	import laya.net.Loader;
	import laya.net.ResourceVersion;
	import laya.resource.Texture;
	import laya.ui.Label;
	import laya.utils.Handler;
	import laya.utils.Stat;
	import laya.utils.Browser;
	import laya.webgl.WebGL;
	import sdk.WXUtils;
	import laya.wx.mini.MiniAdpter;
	import wx;
	
	public class LayaUISample {		
		public function LayaUISample() {
			//初始化微信小游戏
			MiniAdpter.init(false);

			//初始化引擎
			Laya.init(GameConstants.stageWidth, GameConstants.stageHeight,WebGL);
			//Laya.stage.scaleMode = Stage.SCALE_FULL;
			Laya.stage.alignH = Stage.ALIGN_CENTER;
			Laya.stage.alignV = Stage.ALIGN_MIDDLE;
			Laya.stage.scaleMode = Stage.SCALE_EXACTFIT;
			Laya.stage.screenMode = Stage.SCREEN_HORIZONTAL;
			//Stat.show();
			
			new WXUtils();
			//激活资源版本控制
            ResourceVersion.enable("version.json", Handler.create(this, beginLoad), ResourceVersion.FILENAME_VERSION);
		}
		
		private function beginLoad():void {
			//加载引擎需要的资源
			Laya.loader.load(atlasUrls(), Handler.create(this, onLoaded));
		}
		
		private function onLoaded():void {
			//实例UI界面
			//var testView:TestView = new TestView();
			//Laya.stage.addChild(testView);
			
			var hb:HungryHero1 = new HungryHero1();
			Laya.stage.addChild(hb);
			
			//alert(111);
			var ani:Animation = new Animation();
			//Laya.stage.addChild(ani);
			//ani.loadAtlas("res/atlas/mySpritesheet.atlas");
			//ani.play(0, true, "fly_");
			Animation.createFrames(aniUrls("fly_000",1, 6), "fly");
			ani.play(0, true, "fly");
			
			//var ly:BgLayer = new BgLayer(2);
			//Laya.stage.addChild(ly);
			
			/*var hud:HUD = new HUD;
			Laya.stage.addChild(hud);
			
			var ll:StarlingTextField=new StarlingTextField(150,20,"L I V E S",null,20,"#ffffff");
			ll.x=150;
			ll.y = 5;
			Laya.stage.addChild(ll);
			var lb:Label = new Label;
			lb.text = "fdsaf";
			lb.color="#ffffff"
			Laya.stage.addChild(lb);*/			
		}
		
		private function aniUrls(aniName:String,start:int,end:int):Array
        {
            var urls:Array=[];
            for(var i:int=start;i<=end;i++)
            {
                //动画资源路径要和动画图集打包前的资源命名对应起来
                urls.push("mySpritesheet/" + aniName + i + ".png")
            }
            return urls;
        }

		private function atlasUrls():Array
		{
			var urls:Array=[];

			urls.push("res/atlas/mySpritesheet.atlas");
			urls.push("res/atlas/pauseDialog.atlas");
			urls.push("res/atlas/gameOverDialog.atlas");

			return urls;
		}
	}
}