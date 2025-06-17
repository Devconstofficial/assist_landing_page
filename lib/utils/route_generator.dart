import 'package:assist_landing_page/screens/landing_page/landing_page.dart';
import 'package:assist_landing_page/utils/screen_bindings.dart';
import 'package:get/get.dart';
import 'app_strings.dart';


class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(name: kLandingPageRoute, page: () => LandingPage(), binding: ScreenBindings(),),

    ];
  }
}

