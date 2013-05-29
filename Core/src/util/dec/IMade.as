/**
 * IHash
 * 
 * An interface for each hash function to implement
 */
package util.dec
{
	import flash.utils.ByteArray;

	/**
	 * IHash
	 */	
	public interface IMade
	{
		function getInputSize():uint;
		function getSize():uint;
		function fuck(src:ByteArray):ByteArray;
		function toString():String;
	}
}