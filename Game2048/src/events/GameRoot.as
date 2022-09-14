/**
 * Created by dimap on 10/22/2015.
 */
package events {
import flash.events.Event;
import flash.events.EventDispatcher;

public class GameRoot {
        private static var _body:EventDispatcher = new EventDispatcher(null);

        public function GameRoot() {

        }

        public static function addEventListener(type:String, handler:Function):void {
            _body.addEventListener(type, handler)
        }

        public static function dispatchEvent(event:Event):void {
            _body.dispatchEvent(event);
        }

    }
}
