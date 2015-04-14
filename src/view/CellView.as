/**
 * Created by SergeyMalenko on 12.04.2015.
 */
package view
{
	import flash.geom.Point;

	import model.ICellModel;

	import starling.animation.Juggler;

	import starling.core.Starling;

	import starling.display.Image;
	import starling.textures.Texture;

	public class CellView extends Image
	{
		private static var DURATION:Number = 0.1;
		private var _model:ICellModel;

		public function CellView(model:ICellModel, texture:Texture):void
		{
			super(texture);
			_model = model;
			alpha = 0;
		}

		public function updateTexture(newTexture:Texture):void
		{
			if(texture != newTexture)
			{
				var jug:Juggler = new Juggler();
				Starling.juggler.add(jug);
				jug.tween(this, DURATION, {
					alpha: 0.5, onComplete: function ():void
					{
						texture = newTexture
					}
				});
				jug.tween(this, DURATION, {
					alpha: 1, delay: DURATION, onComplete: function ():void
					{
						Starling.juggler.remove(jug);
					}
				});
			}
		}

		public function reset(newTexture:Texture):void
		{
			texture = newTexture;
			alpha = 0;
		}

		public function updateState(status:Boolean):void
		{
			alpha = status ? 1 : 0;
		}

		public function get position():Point
		{
			return _model.position;
		}
	}
}
