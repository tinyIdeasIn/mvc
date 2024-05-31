
import 'state_interceptor.dart';

class MvcManager {

  factory MvcManager() {
    _instance ??= MvcManager._internal();
    return _instance!;
  }
  static MvcManager? _instance;
  MvcManager._internal();

  StateInterface? _interceptor;
  Map<String, dynamic>? _routeMaps;

  void init({StateInterface? interceptor, Map<String, dynamic>? routeMaps}){
   _interceptor = interceptor;
   _routeMaps = routeMaps;
  }
}

extension Public on MvcManager {

  StateInterface? get interceptor => _interceptor;
  Map<String, dynamic>? get routeMaps => _routeMaps;

}
