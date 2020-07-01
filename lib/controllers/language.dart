
import 'package:estacionamentodigital/services/LogService.dart';
import 'package:estacionamentodigital/services/languageService.dart';
import 'package:estacionamentodigital/services/userService.dart';
import 'package:mobx/mobx.dart';

part 'language.g.dart';

class LanguageController = LanguageControllerBase with _$LanguageController;

abstract class LanguageControllerBase with Store {

  UserService _userService = UserService();
  LogService _logService = LogService();
  LanguageService _languageService = LanguageService();

  @observable 
  Map<String, dynamic> idioma = {};
  @action 
  setIdioma(Map<String, dynamic> novoIdioma) => idioma = novoIdioma;
  @computed 
  Map<String, dynamic> get getidioma {
    return idioma;
  }

  Future recuperarIdiomaUsuario() async {
    String uid;
    Map<String, dynamic> idiomaUsuario = {};
    try {
      uid = await _userService.retornarUsuarioAtualUID();
      idiomaUsuario =  await _languageService.carregarIdioma(uid);
      setIdioma(idiomaUsuario);
    } catch (e) {
      _logService.criarLogErro(e, uid, "erro_recuperar_idioma_usuario");
    }
  }

  alterarIdiomaUsuario(int indexIdioma) async {
    String uid;
    try {
      uid = await _userService.retornarUsuarioAtualUID();
      await _languageService.alterarIdiomaUsuario(uid, indexIdioma);
    } catch (e) {
      _logService.criarLogErro(e, uid, "erro_alterar_idioma_usuario");
    }
  }
}