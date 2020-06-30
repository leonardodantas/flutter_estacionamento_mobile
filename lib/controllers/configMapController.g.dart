// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configMapController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfigMapController on ConfigMapControllerBase, Store {
  Computed<MapType> _$getMapTypeComputed;

  @override
  MapType get getMapType =>
      (_$getMapTypeComputed ??= Computed<MapType>(() => super.getMapType,
              name: 'ConfigMapControllerBase.getMapType'))
          .value;
  Computed<int> _$getValueTypeComputed;

  @override
  int get getValueType =>
      (_$getValueTypeComputed ??= Computed<int>(() => super.getValueType,
              name: 'ConfigMapControllerBase.getValueType'))
          .value;

  final _$mapTypeAtom = Atom(name: 'ConfigMapControllerBase.mapType');

  @override
  MapType get mapType {
    _$mapTypeAtom.reportRead();
    return super.mapType;
  }

  @override
  set mapType(MapType value) {
    _$mapTypeAtom.reportWrite(value, super.mapType, () {
      super.mapType = value;
    });
  }

  final _$valueTypeAtom = Atom(name: 'ConfigMapControllerBase.valueType');

  @override
  int get valueType {
    _$valueTypeAtom.reportRead();
    return super.valueType;
  }

  @override
  set valueType(int value) {
    _$valueTypeAtom.reportWrite(value, super.valueType, () {
      super.valueType = value;
    });
  }

  final _$ConfigMapControllerBaseActionController =
      ActionController(name: 'ConfigMapControllerBase');

  @override
  dynamic setMapType(MapType m) {
    final _$actionInfo = _$ConfigMapControllerBaseActionController.startAction(
        name: 'ConfigMapControllerBase.setMapType');
    try {
      return super.setMapType(m);
    } finally {
      _$ConfigMapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValueType(int newV) {
    final _$actionInfo = _$ConfigMapControllerBaseActionController.startAction(
        name: 'ConfigMapControllerBase.setValueType');
    try {
      return super.setValueType(newV);
    } finally {
      _$ConfigMapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mapType: ${mapType},
valueType: ${valueType},
getMapType: ${getMapType},
getValueType: ${getValueType}
    ''';
  }
}
