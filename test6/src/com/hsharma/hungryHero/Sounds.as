/**
 *
 * Hungry Hero Game
 * http://www.hungryherogame.com
 * 
 * Copyright (c) 2012 Hemanth Sharma (www.hsharma.com). All rights reserved.
 * 
 * This ActionScript source code is free.
 * You can redistribute and/or modify it in accordance with the
 * terms of the accompanying Simplified BSD License Agreement.
 *  
 */

package com.hsharma.hungryHero 
{
	import laya.media.SoundChannel;
	import laya.media.SoundManager;
	import laya.utils.Browser;

	/**
	 * This class holds all the sound embeds and objects that are used in the game. 
	 * 
	 * @author hsharma
	 * 
	 */
	public class Sounds
	{
		/**
		 * Embedded sound files. 
		 */		
		/*[Embed(source="../../../../media/sounds/bgGame.mp3")]
		public static const SND_BG_GAME:Class;
		
		[Embed(source="../../../../media/sounds/bgWelcome.mp3")]
		public static const SND_BG_MAIN:Class;
		
		[Embed(source="../../../../media/sounds/eat.mp3")]
		public static const SND_EAT:Class;
		
		[Embed(source="../../../../media/sounds/coffee.mp3")]
		public static const SND_COFFEE:Class;
		
		[Embed(source="../../../../media/sounds/mushroom.mp3")]
		public static const SND_MUSHROOM:Class;
		
		[Embed(source="../../../../media/sounds/hit.mp3")]
		public static const SND_HIT:Class;
		
		[Embed(source="../../../../media/sounds/hurt.mp3")]
		public static const SND_HURT:Class;
		
		[Embed(source="../../../../media/sounds/lose.mp3")]
		public static const SND_LOSE:Class;*/
		
		/**
		 * Initialized Sound objects. 
		 */		
		public static var sndBgMain:String = "bgGame"; //= Assets.getSound("bgGame");//new Sounds.SND_BG_MAIN() as Sound;
		public static var sndBgGame:String="bgWelcome"//);//new Sounds.SND_BG_GAME() as Sound;
		public static var sndEat:String ="eat"//);//new Sounds.SND_EAT() as Sound;
		public static var sndCoffee:String= "coffee"//);//new Sounds.SND_COFFEE() as Sound;
		public static var sndMushroom:String= "mushroom"//);//new Sounds.SND_MUSHROOM() as Sound;
		public static var sndHit:String ="hit"//);//new Sounds.SND_HIT() as Sound;
		public static var sndHurt:String= "hurt"//);//new Sounds.SND_HURT() as Sound;
		public static var sndLose:String = "lose"//);//new Sounds.SND_LOSE() as Sound;
		public static var sounds:Object = {};
		
		/**
		 * Sound mute status. 
		 */
		public static var muted:Boolean = false;
		
		public static  function playMusic(path:String):void
        {
            SoundManager.playMusic("res/sounds/"+path+".mp3",0);
        }

        public static  function playSound(path:String):void
        {
			if(Browser.onMiniGame){
				var sa:Object=sounds[path];
				if(sa==null){
					sa=sounds[path]={};
					sa.arr=[];
				}
				
				if(sa.arr.length<5){
					var a:Audio=new Audio();
					a.src="res/sounds/" + path + ".mp3";
					sa.arr.push(a);
					sa.i=sa.arr.length-1;
				}else{
					sa.i++;
					if(sa.i>=sa.arr.length){
						sa.i=0;
					}
					a=sa.arr[sa.i];
				}
				
					a.currentTime = 0
					a.play()
			}else{
			var sc:SoundChannel = sounds[path];
			if (sc==null){
				sc = laya.media.SoundManager.playSound("res/sounds/" + path + ".mp3", 1);
				sounds[path] = sc;
			}else{
				sc.play();
			}
			}
        }
        //export  function playGameSound(name:string,sex:number):void
        //{
         //   var yuyanindex:number = appCenter.dataCenter.settingData.yuyan;//wm設置語言索引
          //  playSound("res/sound/lang/"+yuyanindex+"/"+(sex==0?"Woman":"man")+"/"+name+".ogg");
        //}
	}
}