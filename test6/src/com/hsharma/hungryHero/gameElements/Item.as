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

package com.hsharma.hungryHero.gameElements
{
	import com.hsharma.hungryHero.Assets;
	import laya.display.Sprite;
	import laya.ui.Image;
	
	/**
	 * This class represents the food items. 
	 * 
	 * @author hsharma
	 * 
	 */
	public class Item extends Sprite
	{
		/** Food item type. */
		private var _foodItemType:int;
		
		/** Food item visuals. */
		private var itemImage:Image = new Image();
		
		public function Item(_foodItemType:int)
		{
			super();
			mouseEnabled  = false;
			this.foodItemType = _foodItemType;
			addChild(itemImage);
		}

		/**
		 * Set the type of food item (visuals) to show. 
		 * @param value
		 * 
		 */
		public function set foodItemType(value:int):void
		{
			_foodItemType = value;

			itemImage.skin= Assets.getTexture("item" + _foodItemType);
			//if (itemImage == null)
			//{
				
				// If the item is created for the first time.
				//itemImage = new Bitmap(com.hsharma.hungryHero.Assets.getAtlas().getTexture("item" + _foodItemType));
				//itemImage.width = com.hsharma.hungryHero.Assets.getAtlas().getTexture("item" + _foodItemType).width;
				//itemImage.height = com.hsharma.hungryHero.Assets.getAtlas().getTexture("item" + _foodItemType).height;
			//}
			//	itemImage.x = -itemImage.width/2;
			//	itemImage.y = -itemImage.height/2;
			//	this.addChild(itemImage);
			//}
			//else
			//{
				// If the item is reused.
				//itemImage.texture = com.hsharma.hungryHero.Assets.getAtlas().getTexture("item" + _foodItemType);
				//itemImage.width = com.hsharma.hungryHero.Assets.getAtlas().getTexture("item" + _foodItemType).width;
				//itemImage.height = com.hsharma.hungryHero.Assets.getAtlas().getTexture("item" + _foodItemType).height;
				itemImage.x = -itemImage.width/2;
				itemImage.y = -itemImage.height/2;
			//}
		}

		/**
		 * Return the type of food item this object is visually representing. 
		 * @return 
		 * 
		 */
		public function get foodItemType():int
		{
			return _foodItemType;
		}
	}
}