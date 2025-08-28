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
  dynamic Function()? _arguments;

  void init({
    StateInterface? interceptor,
    Map<String, dynamic>? routeMaps,
    dynamic Function()? arguments,
  }) {
    print("MvcManager.init --> $arguments");
    _interceptor = interceptor;
    _routeMaps = routeMaps;
    _arguments = arguments;
  }
}

extension Public on MvcManager {
  StateInterface? get interceptor => _interceptor;

  Map<String, dynamic>? get routeMaps => _routeMaps;

  dynamic get arguments => _arguments?.call();
}
