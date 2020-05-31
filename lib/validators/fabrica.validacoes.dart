import 'package:estacionamentodigital/validators/validacao.interface.dart';

class FabricaValidacoes {

  validar(Validacao validacao, String campo, int length){
    validacao.validar(campo, length);   
  }

}