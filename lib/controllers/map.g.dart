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
      (_$estadoCarregamentoComputed ??=
              Computed<CARREGAMENTOINICIAL>(() => super.estadoCarregamento))
          .value;

  final _$longitudeAtom = Atom(name: 'MapControllerBase.longitude');

  @override
  double get longitude {
    _$longitudeAtom.context.enforceReadPolicy(_$longitudeAtom);
    _$longitudeAtom.reportObserved();
    return super.longitude;
  }

  @override
  set longitude(double value) {
    _$longitudeAtom.context.conditionallyRunInAction(() {
      super.longitude = value;
      _$longitudeAtom.reportChanged();
    }, _$longitudeAtom, name: '${_$longitudeAtom.name}_set');
  }

  final _$latitudeAtom = Atom(name: 'MapControllerBase.latitude');

  @override
  double get latitude {
    _$latitudeAtom.context.enforceReadPolicy(_$latitudeAtom);
    _$latitudeAtom.reportObserved();
    return super.latitude;
  }

  @override
  set latitude(double value) {
    _$latitudeAtom.context.conditionallyRunInAction(() {
      super.latitude = value;
      _$latitudeAtom.reportChanged();
    }, _$latitudeAtom, name: '${_$latitudeAtom.name}_set');
  }

  final _$_carregamentoinicialAtom =
      Atom(name: 'MapControllerBase._carregamentoinicial');

  @override
  CARREGAMENTOINICIAL get _carregamentoinicial {
    _$_carregamentoinicialAtom.context
        .enforceReadPolicy(_$_carregamentoinicialAtom);
    _$_carregamentoinicialAtom.reportObserved();
    return super._carregamentoinicial;
  }

  @override
  set _carregamentoinicial(CARREGAMENTOINICIAL value) {
    _$_carregamentoinicialAtom.context.conditionallyRunInAction(() {
      super._carregamentoinicial = value;
      _$_carregamentoinicialAtom.reportChanged();
    }, _$_carregamentoinicialAtom,
        name: '${_$_carregamentoinicialAtom.name}_set');
  }

  final _$MapControllerBaseActionController =
      ActionController(name: 'MapControllerBase');

  @override
  dynamic setLongitude(double novaLongitude) {
    final _$actionInfo = _$MapControllerBaseActionController.startAction();
    try {
      return super.setLongitude(novaLongitude);
    } finally {
      _$MapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLatitude(double novaLatitude) {
    final _$actionInfo = _$MapControllerBaseActionController.startAction();
    try {
      return super.setLatitude(novaLatitude);
    } finally {
      _$MapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCarregamentoInicial(CARREGAMENTOINICIAL state) {
    final _$actionInfo = _$MapControllerBaseActionController.startAction();
    try {
      return super.setCarregamentoInicial(state);
    } finally {
      _$MapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'longitude: ${longitude.toString()},latitude: ${latitude.toString()},estadoCarregamento: ${estadoCarregamento.toString()}';
    return '{$string}';
  }
}
