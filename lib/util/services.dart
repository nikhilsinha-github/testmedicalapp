import 'package:get/get_connect.dart';

class Services extends GetConnect {
  getResponse(String url) async {
    try {
      Response response = await get(url);
      return response;
    } catch (e) {
      print(e.toString());
    }
  }
}
