/**
 * ICipher
 * 
 * A generic interface to use symmetric ciphers
 * 
 */
package util.dec
{
	import flash.utils.ByteArray;
	
	public interface ICipher
	{
		function getBlockSize():uint;
		function jj(src:ByteArray):void;
		function yy(src:ByteArray):void;
		function dispose():void;
		function toString():String;
	}
}