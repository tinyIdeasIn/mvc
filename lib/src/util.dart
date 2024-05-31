import 'mvc_manager.dart';

class Util {

  static String? getRouteName(String? page, String? name, dynamic arguments,){
    String? routeName;
    if(name != null){
      routeName = name;
    } else {
      if(MvcManager().routeMaps != null){
        if(MvcManager().routeMaps!.containsKey(page)){
          routeName = MvcManager().routeMaps![page];
        } else {
          routeName = page;
        }
      } else {
        routeName = page;
      }
    }
    if(routeName != null && routeName.contains("/")){
      List<String> paths = routeName.split("/");
      List<String> temp = [];
      if(paths.length > 2){
        for(int index = 0; index < paths.length; index ++){
          var path = paths[index];
          if(path.startsWith(":")){
            String args = path.replaceAll(":", "");
            temp.add(arguments[args]);
          } else {
            temp.add(path);
          }
        }
        routeName = temp.join("/");
      }
    }
    return routeName;
  }
}