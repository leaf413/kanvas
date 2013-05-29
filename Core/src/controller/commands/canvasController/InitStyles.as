package controller.commands.canvasController
{
	import model.CanvasProxy;
	import model.ProxyNames;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import util.XMLConfigKit.XMLVOLib;
	import util.XMLConfigKit.XMLVOMapper;
	
	import view.CanvasMediator;
	import view.MediatorNames;
	
	public class InitStyles extends SimpleCommand
	{
		private var canvasMediator:CanvasMediator;
		
		private var canvasProxy:CanvasProxy;
		
		public function InitStyles()
		{
			super();
		}
		
		/**
		 * getBody 是XML类型
		 * @param notification
		 * 
		 */
		override public function execute(notification:INotification):void
		{
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			
			var config:XML = XML(notification.getBody()).copy();
			canvasProxy.style.currentStyleType = config.name().toString();
//			trace(XML(XMLVOLib.getXML('shapes','default')));
			
			canvasProxy.style.currentShapeStyle = XMLVOMapper.extendFrom(config.child("shapes")[0], XML(XMLVOLib.getXML('shapes','default')));
			canvasProxy.style.currentimageStyle = XMLVOMapper.extendFrom(config.child("images")[0],XML(XMLVOLib.getXML('images','default')));
			canvasProxy.style.currentlineStyle = XMLVOMapper.extendFrom(config.child("lines")[0],XML(XMLVOLib.getXML('lines','default')));
			canvasProxy.style.currentTextStyle = XMLVOMapper.extendFrom(config.child("texts")[0],XML(XMLVOLib.getXML('texts','default')));
//			trace(config);
//			canvasProxy.style.currentStyleTemplet.appendChild(canvasProxy.style.currentShapeStyle);
//			canvasProxy.style.currentStyleTemplet.appendChild(canvasProxy.style.currentimageStyle);
//			canvasProxy.style.currentStyleTemplet.appendChild(canvasProxy.style.currentlineStyle);
//			canvasProxy.style.currentStyleTemplet.appendChild(canvasProxy.style.currentTextStyle);
//			trace();
//			canvasProxy.style.defaultElementStyle.child('shape').appendChild(
//				canvasProxy.style.templeChangeElement('shapes', canvasProxy.style.currentStyleTemplet, elementStyle.children()[0]));
//			canvasProxy.style.defaultElementStyle.child('image').appendChild(
//				canvasProxy.style.templeChangeElement('iamges', canvasProxy.style.currentStyleTemplet, elementStyle.children()[0]));
//			canvasProxy.style.defaultElementStyle.child('text').appendChild(
//				canvasProxy.style.templeChangeElement('texts', canvasProxy.style.currentStyleTemplet, elementStyle.children()[0]));
//			canvasProxy.style.defaultElementStyle.child('line').appendChild(
//				canvasProxy.style.templeChangeElement('lines', canvasProxy.style.currentStyleTemplet, elementStyle.children()[0]));
//			trace(canvasProxy.style.defaultElementStyle);
//			XMLVOMapper.fuck(xml,canvasProxy.currentElementVO);
//			XMLVOMapper.extendFrom(canvasProxy.style.currentStyleTemplet, elementStyle);
		}
		
		override public function returnHandler():void
		{
		}
		
		override public function nextHandler():void
		{
		}
	}
}