import 'package:app_filmes/application/ui/loader/loader_mixin.dart';
import 'package:app_filmes/application/ui/messages/mensages_mixin.dart';
import 'package:app_filmes/services/login/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMIxin, MessagesMixin {
  final LoginService _loginService;

  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({
    required LoginService loginService,
  }) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  void login() async {
    try {
      loading(true);
      await _loginService.login();
      //await Future.delayed(const Duration(seconds: 2));
      // await 2.seconds.delay();
      loading(false);

      message(MessageModel.info(
          title: 'Login Sucesso!!', message: 'Login Realizado com Sucesso!'));
    } on Exception catch (e, s) {
      print(e);
      print(s);
      message(MessageModel.error(
          title: 'Erro Login', message: 'Erro ao tentar realizar Login'));
    }
  }
}
