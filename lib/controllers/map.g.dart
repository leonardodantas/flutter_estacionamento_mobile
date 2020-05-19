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

  final _$longitudeAtom = Atom(name: 'MapControllerBase.longitude');

  @override
  double get longitude {
    _$longitudeAtom.reportRead();
    return super.longitude;
  }

  @override
  set longitude(double value) {
    _$longitudeAtom.reportWrite(value, super.longitude, () {
      super.longitude = value;
    });
  }

  final _$latitudeAtom = Atom(name: 'MapControllerBase.latitude');

  @override
  double get latitude {
    _$latitudeAtom.reportRead();
    return super.latitude;
  }

  @override
  set latitude(double value) {
    _$latitudeAtom.reportWrite(value, super.latitude, () {
      super.latitude = value;
    });
  }

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

  final _$MapControllerBaseActionController =
      ActionController(name: 'MapControllerBase');

  @override
  dynamic setLongitude(double novaLongitude) {
    final _$actionInfo = _$MapControllerBaseActionController.startAction(
        name: 'MapControllerBase.setLongitude');
    try {
      return super.setLongitude(novaLongitude);
    } finally {
      _$MapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLatitude(double novaLatitude) {
    final _$actionInfo = _$MapControllerBaseActionController.startAction(
        name: 'MapControllerBase.setLatitude');
    try {
      return super.setLatitude(novaLatitude);
    } finally {
      _$MapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  String toString() {
    return '''
longitude: ${longitude},
latitude: ${latitude},
estadoCarregamento: ${estadoCarregamento}
    ''';
  }
}
