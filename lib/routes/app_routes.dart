import 'package:get/get.dart';
import 'package:zaqi_siesta_technical_test/routes/routes.dart';

import '../features/first_task/presentation/pages/home_page.dart';
import '../features/main_screnn/presentation/pages/main_page.dart';
import '../features/second_task/presentation/pages/second_task_page.dart';
import '../features/second_task/presentation/binding/product_binding.dart';
import '../features/third_task/presentation/binding/todo_binding.dart';
import '../features/third_task/presentation/pages/third_task_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.mainPage,
      page: () => const MainPage(),
    ),
    GetPage(
      name: Routes.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.secondTask,
      page: () => const SecondTaskPage(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: Routes.thirdTask,
      page: () => const ThirdTaskPage(),
      binding: TodoBinding(),
    ),
  ];
}