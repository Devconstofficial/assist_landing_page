import 'package:assist_landing_page/utils/app_strings.dart';
import 'package:assist_landing_page/utils/app_theme.dart';
import 'package:assist_landing_page/utils/route_generator.dart';
import 'package:assist_landing_page/utils/screen_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


void main() async{
  runApp(const MyApp(),);
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: buildTheme(Brightness.light),
          title: kAppName,
          defaultTransition: Transition.noTransition,
          debugShowCheckedModeBanner: false,
          initialBinding: ScreenBindings(),
          initialRoute: kLaunchingPageRoute,
          getPages: RouteGenerator.getPages(),
          builder: (context, child) {
            return  MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(
                  MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.0),
                ),
              ),
              child: child!,
            );
          },
        );
      },
    );
  }
}
