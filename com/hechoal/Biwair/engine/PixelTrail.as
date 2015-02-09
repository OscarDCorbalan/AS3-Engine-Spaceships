package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;

	public class PixelTrail extends Bitmap
	{
		/**
		 * This class is simple a strip of pixels used for when the aliens are shot
		 * It's used in Fx.as as the Class given to the FlxEmitters
		 * 
		 * It could easily be a PNG instead, but I like keeping it here so it's really easy to change the colours/size
		 * and see the results immediately. Once I'm 100% happy with it, I would then usually bake it into a PNG
		 */
		public function PixelTrail()
		{
			super(new BitmapData(16, 2, false, 0x000000));
			
			bitmapData.fillRect(new Rectangle(0, 0, 2, 2), 0xFFFF00);
			bitmapData.fillRect(new Rectangle(2, 0, 2, 2), 0x80FF00);
			bitmapData.fillRect(new Rectangle(4, 0, 2, 2), 0xFFFF00);
			bitmapData.fillRect(new Rectangle(6, 0, 2, 2), 0xFF8000);
			bitmapData.fillRect(new Rectangle(8, 0, 2, 2), 0x808000);
			bitmapData.fillRect(new Rectangle(10, 0, 2, 2), 0x408000);
			bitmapData.fillRect(new Rectangle(12, 0, 2, 2), 0x808000);
			bitmapData.fillRect(new Rectangle(14, 0, 2, 2), 0x804000);
		}
		
	}

}