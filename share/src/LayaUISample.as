package {
	import laya.net.Loader;
	import laya.net.ResourceVersion;
	import laya.ui.Label;
	import laya.utils.Handler;
	import sdk.WXShareUtils;
	import view.TestView;
	import laya.wx.mini.MiniAdpter;
	import laya.webgl.WebGL;
	
	public class LayaUISample {
		//private var label:Label;
		
		public function LayaUISample() {
			//初始化微信小游戏
			MiniAdpter.init(false,true);

			//初始化引擎
			Laya.init(600, 400);
			
			//激活资源版本控制
            //ResourceVersion.enable("version.json", Handler.create(this, beginLoad), ResourceVersion.FILENAME_VERSION);
			beginLoad();
			
			new WXShareUtils();
			
			//label = new Label("share");
			//Laya.stage.addChild(label);
			
			//Laya.timer.frameLoop(1, this, function():void{
			//	label.text = Math.random() + "";
			//});
		}
		
		private function beginLoad():void {
			//加载引擎需要的资源
			//Laya.loader.load("res/atlas/comp.atlas", Handler.create(this, onLoaded));
		}
		
		private function onLoaded():void {
			//实例UI界面
			//var testView:TestView = new TestView();
			//Laya.stage.addChild(testView);
		}
	}
}