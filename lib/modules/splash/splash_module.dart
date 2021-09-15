import 'package:app_filmes/application/modules/module.dart';
import 'package:app_filmes/modules/splash/splash_bindings.dart';
import 'package:app_filmes/modules/splash/splash_page.dart';
import 'package:get/get.dart';

class SplashModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBindings(),
    )
  ];
}
