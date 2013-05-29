package util.XMLConfigKit.shape
{
	import util.XMLConfigKit.style.States;
	import util.XMLConfigKit.style.Style;
	
	import flash.display.Sprite;

	public interface IShape
	{
		function render(canvas:Sprite, metadata:Object):void;
		
		/**
		 */		
		function get style():Style;
		
		/**
		 */		
		function set style(value:Style):void;
		
		/**
		 */		
		function get states():States;
		
		/**
		 */		
		function set states(value:States):void;
		
		/**
		 */		
		function set size(value:uint):void;
		
		/**
		 */		
		function get size():uint;
		
		/**
		 */		
		function set angle(value:int):void;
		
		/**
		 */		
		function get angle():int
		
	}
}