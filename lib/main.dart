import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mini_e_learning/app/data/utils/color_pallete.dart';
// import 'package:responsive_framework/responsive_framework.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E Learning',
      // builder: (context, child) => ResponsiveWrapper.builder(
      //   BouncingScrollWrapper.builder(context, child!),
      //   maxWidth: 1200,
      //   minWidth: 400,
      //   defaultScale: true,
      //   breakpoints: [
      //     const ResponsiveBreakpoint.autoScale(500, name: 'MOBILE'),
      //     const ResponsiveBreakpoint.autoScale(800, name: 'TABLET'),
      //     const ResponsiveBreakpoint.autoScale(1000, name: 'DESKTOP'),
      //     const ResponsiveBreakpoint.resize(1440, name: '1440x3120'),
      //     const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
      //   ],
      // ),
      theme: ThemeData(primaryColor: ColorPallete.bgColor, fontFamily: ''),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: AppPages.routes,
    );
  }
}
