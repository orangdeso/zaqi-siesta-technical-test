import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';
import 'routes/routes.dart';
import 'core/service/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await DatabaseHelper().database;
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      designSize: const Size(334, 724),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: true,
          initialRoute: Routes.mainPage,
          getPages: AppRoutes.routes,
          initialBinding: BindingsBuilder(() {
            Get.put(DatabaseHelper());
          }),
        );
      },
    );
  }
}