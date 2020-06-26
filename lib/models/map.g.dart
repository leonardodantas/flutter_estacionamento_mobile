// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapModel on MapModelBase, Store {
  Computed<Set<Marker>> _$getLocationsComputed;

  @override
  Set<Marker> get getLocations => (_$getLocationsComputed ??=
          Computed<Set<Marker>>(() => super.getLocations,
              name: 'MapModelBase.getLocations'))
      .value;
  Computed<Set<Marker>> _$getMarcacaoUsuarioComputed;

  @override
  Set<Marker> get getMarcacaoUsuario => (_$getMarcacaoUsuarioComputed ??=
          Computed<Set<Marker>>(() => super.getMarcacaoUsuario,
              name: 'MapModelBase.getMarcacaoUsuario'))
      .value;

  final _$longitudeAtom = Atom(name: 'MapModelBase.longitude');

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

  final _$latitudeAtom = Atom(name: 'MapModelBase.latitude');

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

  final _$_markersAtom = Atom(name: 'MapModelBase._markers');

  @override
  Set<Marker> get _markers {
    _$_markersAtom.reportRead();
    return super._markers;
  }

  @override
  set _markers(Set<Marker> value) {
    _$_markersAtom.reportWrite(value, super._markers, () {
      super._markers = value;
    });
  }

  final _$marcacaoUsuarioAtom = Atom(name: 'MapModelBase.marcacaoUsuario');

  @override
  Set<Marker> get marcacaoUsuario {
    _$marcacaoUsuarioAtom.reportRead();
    return super.marcacaoUsuario;
  }

  @override
  set marcacaoUsuario(Set<Marker> value) {
    _$marcacaoUsuarioAtom.reportWrite(value, super.marcacaoUsuario, () {
      super.marcacaoUsuario = value;
    });
  }

  final _$MapModelBaseActionController = ActionController(name: 'MapModelBase');

  @override
  dynamic setLongitude(double novaLongitude) {
    final _$actionInfo = _$MapModelBaseActionController.startAction(
        name: 'MapModelBase.setLongitude');
    try {
      return super.setLongitude(novaLongitude);
    } finally {
      _$MapModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLatitude(double novaLatitude) {
    final _$actionInfo = _$MapModelBaseActionController.startAction(
        name: 'MapModelBase.setLatitude');
    try {
      return super.setLatitude(novaLatitude);
    } finally {
      _$MapModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMarket(Set<Marker> marker) {
    final _$actionInfo = _$MapModelBaseActionController.startAction(
        name: 'MapModelBase.setMarket');
    try {
      return super.setMarket(marker);
    } finally {
      _$MapModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMarcacaoUsuarioAtual(Set<Marker> m) {
    final _$actionInfo = _$MapModelBaseActionController.startAction(
        name: 'MapModelBase.setMarcacaoUsuarioAtual');
    try {
      return super.setMarcacaoUsuarioAtual(m);
    } finally {
      _$MapModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
longitude: ${longitude},
latitude: ${latitude},
marcacaoUsuario: ${marcacaoUsuario},
getLocations: ${getLocations},
getMarcacaoUsuario: ${getMarcacaoUsuario}
    ''';
  }
}
