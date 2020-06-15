// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapController on MapControllerBase, Store {
  Computed<CARREGAMENTOINICIAL> _$estadoCarregamentoComputed;

  @override
  CARREGAMENTOINICIAL get estadoCarregamento =>
      (_$estadoCarregamentoComputed ??= Computed<CARREGAMENTOINICIAL>(
              () => super.estadoCarregamento,
              name: 'MapControllerBase.estadoCarregamento'))
          .value;
  Computed<Completer<GoogleMapController>> _$getGoogleMapControllerComputed;

  @override
  Completer<GoogleMapController> get getGoogleMapController =>
      (_$getGoogleMapControllerComputed ??=
              Computed<Completer<GoogleMapController>>(
                  () => super.getGoogleMapController,
                  name: 'MapControllerBase.getGoogleMapController'))
          .value;
  Computed<List<CartaoDto>> _$getCartoesUsuarioComputed;

  @override
  List<CartaoDto> get getCartoesUsuario => (_$getCartoesUsuarioComputed ??=
          Computed<List<CartaoDto>>(() => super.getCartoesUsuario,
              name: 'MapControllerBase.getCartoesUsuario'))
      .value;
  Computed<bool> _$getMarcacoesUsuarioCarregadaComputed;

  @override
  bool get getMarcacoesUsuarioCarregada =>
      (_$getMarcacoesUsuarioCarregadaComputed ??= Computed<bool>(
              () => super.getMarcacoesUsuarioCarregada,
              name: 'MapControllerBase.getMarcacoesUsuarioCarregada'))
          .value;

  final _$_carregamentoinicialAtom =
      Atom(name: 'MapControllerBase._carregamentoinicial');

  @override
  CARREGAMENTOINICIAL get _carregamentoinicial {
    _$_carregamentoinicialAtom.reportRead();
    return super._carregamentoinicial;
  }

  @override
  set _carregamentoinicial(CARREGAMENTOINICIAL value) {
    _$_carregamentoinicialAtom.reportWrite(value, super._carregamentoinicial,
        () {
      super._carregamentoinicial = value;
    });
  }

  final _$googleMapControllerAtom =
      Atom(name: 'MapControllerBase.googleMapController');

  @override
  Completer<GoogleMapController> get googleMapController {
    _$googleMapControllerAtom.reportRead();
    return super.googleMapController;
  }

  @override
  set googleMapController(Completer<GoogleMapController> value) {
    _$googleMapControllerAtom.reportWrite(value, super.googleMapController, () {
      super.googleMapController = value;
    });
  }

  final _$cartoesUsuarioAtom = Atom(name: 'MapControllerBase.cartoesUsuario');

  @override
  List<CartaoDto> get cartoesUsuario {
    _$cartoesUsuarioAtom.reportRead();
    return super.cartoesUsuario;
  }

  @override
  set cartoesUsuario(List<CartaoDto> value) {
    _$cartoesUsuarioAtom.reportWrite(value, super.cartoesUsuario, () {
      super.cartoesUsuario = value;
    });
  }

  final _$marcacoesUsuarioCarregadaAtom =
      Atom(name: 'MapControllerBase.marcacoesUsuarioCarregada');

  @override
  bool get marcacoesUsuarioCarregada {
    _$marcacoesUsuarioCarregadaAtom.reportRead();
    return super.marcacoesUsuarioCarregada;
  }

  @override
  set marcacoesUsuarioCarregada(bool value) {
    _$marcacoesUsuarioCarregadaAtom
        .reportWrite(value, super.marcacoesUsuarioCarregada, () {
      super.marcacoesUsuarioCarregada = value;
    });
  }

  final _$MapControllerBaseActionController =
      ActionController(name: 'MapControllerBase');

  @override
  dynamic setCarregamentoInicial(CARREGAMENTOINICIAL state) {
    final _$actionInfo = _$MapControllerBaseActionController.startAction(
        name: 'MapControllerBase.setCarregamentoInicial');
    try {
      return super.setCarregamentoInicial(state);
    } finally {
      _$MapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGoogleMapController(Completer<GoogleMapController> gM) {
    final _$actionInfo = _$MapControllerBaseActionController.startAction(
        name: 'MapControllerBase.setGoogleMapController');
    try {
      return super.setGoogleMapController(gM);
    } finally {
      _$MapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCartoesUsuario(List<CartaoDto> cartoes) {
    final _$actionInfo = _$MapControllerBaseActionController.startAction(
        name: 'MapControllerBase.setCartoesUsuario');
    try {
      return super.setCartoesUsuario(cartoes);
    } finally {
      _$MapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMarcacoesUsuarioCarregada(bool m) {
    final _$actionInfo = _$MapControllerBaseActionController.startAction(
        name: 'MapControllerBase.setMarcacoesUsuarioCarregada');
    try {
      return super.setMarcacoesUsuarioCarregada(m);
    } finally {
      _$MapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
googleMapController: ${googleMapController},
cartoesUsuario: ${cartoesUsuario},
marcacoesUsuarioCarregada: ${marcacoesUsuarioCarregada},
estadoCarregamento: ${estadoCarregamento},
getGoogleMapController: ${getGoogleMapController},
getCartoesUsuario: ${getCartoesUsuario},
getMarcacoesUsuarioCarregada: ${getMarcacoesUsuarioCarregada}
    ''';
  }
}
