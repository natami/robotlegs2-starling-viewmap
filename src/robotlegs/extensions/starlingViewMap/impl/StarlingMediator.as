package robotlegs.extensions.starlingViewMap.impl {

import flash.events.Event;
import flash.events.IEventDispatcher;
import robotlegs.bender.extensions.localEventMap.api.IEventMap;
import robotlegs.bender.extensions.mediatorMap.api.IMediator;
import robotlegs.extensions.starlingViewMap.api.IStarlingEventMap;
import starling.events.EventDispatcher;

/**
	 * @author jamieowen
	 */
	public class StarlingMediator implements IMediator
	{
		[Inject]
		public var starlingEventMap			:IStarlingEventMap;

		[Inject]
		public var eventMap					:IEventMap;

		[Inject]
		public var eventDispatcher			:IEventDispatcher;

		private var _viewComponent:Object;

		public function set viewComponent(view:Object):void
		{
			_viewComponent = view;
		}
		
		public function get viewComponent():Object
		{
			return _viewComponent;
		}
		
		public function initialize() : void
		{
			
		}

		public function destroy() : void
		{
			eventMap.unmapListeners();
			starlingEventMap.unmapListeners();
		}

		protected function mapStarlingEvent(eventDispatcher:EventDispatcher, type:String, listener:Function):void
		{
			starlingEventMap.mapStarlingEvent(eventDispatcher, type, listener);
		}

		protected function unmapStarlingEvent(eventDispatcher:EventDispatcher, type:String, listener:Function):void
		{
			starlingEventMap.unmapStarlingEvent(eventDispatcher, type, listener);
		}

		protected function addContextListener(eventString:String, listener:Function, eventClass:Class = null):void
		{
			eventMap.mapListener(eventDispatcher, eventString, listener, eventClass);
		}

		protected function removeContextListener(eventString:String, listener:Function, eventClass:Class = null):void
		{
			eventMap.unmapListener(eventDispatcher, eventString, listener, eventClass);
		}

		protected function dispatch(event:Event):void
		{
			if (eventDispatcher.hasEventListener(event.type))
				eventDispatcher.dispatchEvent(event);
		}
	}
}
