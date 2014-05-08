/**
 * Created by sorenjepsen on 02/02/14.
 */
package robotlegs.extensions.starlingFeathers.impl {
import robotlegs.extensions.starlingViewMap.impl.*;

import starling.events.Event;
import starling.events.EventDispatcher;

public class FeathersMediator extends StarlingMediator {

	override public function set viewComponent(view:Object):void
	{
		super.viewComponent = view;

		if (view) {
			EventDispatcher(viewComponent).addEventListener("creationComplete", creationCompleteHandler);
		}
	}

	private function creationCompleteHandler(event:Event):void
	{
		EventDispatcher(viewComponent).removeEventListener("creationComplete", creationCompleteHandler);
		initializeComplete();
	}

	public function initializeComplete():void
	{
	}
}
}