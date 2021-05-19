import 'package:event_bus/event_bus.dart';

class EventBusUtil{
  static EventBus _eventBus;
  static void init(){
    if(_eventBus==null){
      _eventBus = EventBus();
    }

  }

  static void listenEvent<T>(void onData(T event)){
    _eventBus.on<T>().listen(onData);
  }

  static void send(dynamic event){
    _eventBus.fire(event);
  }
}



class UserEvent{
  final isLogin;
  UserEvent(this.isLogin);
}