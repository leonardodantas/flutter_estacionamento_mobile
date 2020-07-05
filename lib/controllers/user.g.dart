// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on UserControllerBase, Store {
  Computed<ESTADOLOGIN> _$getEstadoLoginComputed;

  @override
  ESTADOLOGIN get getEstadoLogin => (_$getEstadoLoginComputed ??=
          Computed<ESTADOLOGIN>(() => super.getEstadoLogin,
              name: 'UserControllerBase.getEstadoLogin'))
      .value;
  Computed<ESTADOCRIARUSUARIO> _$getEstadoCriarUsuarioComputed;

  @override
  ESTADOCRIARUSUARIO get getEstadoCriarUsuario =>
      (_$getEstadoCriarUsuarioComputed ??= Computed<ESTADOCRIARUSUARIO>(
              () => super.getEstadoCriarUsuario,
              name: 'UserControllerBase.getEstadoCriarUsuario'))
          .value;
  Computed<bool> _$getUsuarioLogadoComputed;

  @override
  bool get getUsuarioLogado => (_$getUsuarioLogadoComputed ??= Computed<bool>(
          () => super.getUsuarioLogado,
          name: 'UserControllerBase.getUsuarioLogado'))
      .value;

  final _$estadologinAtom = Atom(name: 'UserControllerBase.estadologin');

  @override
  ESTADOLOGIN get estadologin {
    _$estadologinAtom.reportRead();
    return super.estadologin;
  }

  @override
  set estadologin(ESTADOLOGIN value) {
    _$estadologinAtom.reportWrite(value, super.estadologin, () {
      super.estadologin = value;
    });
  }

  final _$estadocriarusuarioAtom =
      Atom(name: 'UserControllerBase.estadocriarusuario');

  @override
  ESTADOCRIARUSUARIO get estadocriarusuario {
    _$estadocriarusuarioAtom.reportRead();
    return super.estadocriarusuario;
  }

  @override
  set estadocriarusuario(ESTADOCRIARUSUARIO value) {
    _$estadocriarusuarioAtom.reportWrite(value, super.estadocriarusuario, () {
      super.estadocriarusuario = value;
    });
  }

  final _$usuarioLogadoAtom = Atom(name: 'UserControllerBase.usuarioLogado');

  @override
  bool get usuarioLogado {
    _$usuarioLogadoAtom.reportRead();
    return super.usuarioLogado;
  }

  @override
  set usuarioLogado(bool value) {
    _$usuarioLogadoAtom.reportWrite(value, super.usuarioLogado, () {
      super.usuarioLogado = value;
    });
  }

  final _$criarNovoUsuarioAsyncAction =
      AsyncAction('UserControllerBase.criarNovoUsuario');

  @override
  Future criarNovoUsuario() {
    return _$criarNovoUsuarioAsyncAction.run(() => super.criarNovoUsuario());
  }

  final _$loginAsyncAction = AsyncAction('UserControllerBase.login');

  @override
  Future login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$verificarSeExisteUsuarioLogadoAsyncAction =
      AsyncAction('UserControllerBase.verificarSeExisteUsuarioLogado');

  @override
  Future verificarSeExisteUsuarioLogado() {
    return _$verificarSeExisteUsuarioLogadoAsyncAction
        .run(() => super.verificarSeExisteUsuarioLogado());
  }

  final _$logoutAsyncAction = AsyncAction('UserControllerBase.logout');

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$deletarUsuarioAsyncAction =
      AsyncAction('UserControllerBase.deletarUsuario');

  @override
  Future<dynamic> deletarUsuario(String pass) {
    return _$deletarUsuarioAsyncAction.run(() => super.deletarUsuario(pass));
  }

  final _$UserControllerBaseActionController =
      ActionController(name: 'UserControllerBase');

  @override
  dynamic setEstadoLogin(ESTADOLOGIN estado) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.setEstadoLogin');
    try {
      return super.setEstadoLogin(estado);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEstadoCriarUsuario(ESTADOCRIARUSUARIO estado) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.setEstadoCriarUsuario');
    try {
      return super.setEstadoCriarUsuario(estado);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUsuarioLogado(bool usuario) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.setUsuarioLogado');
    try {
      return super.setUsuarioLogado(usuario);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
estadologin: ${estadologin},
estadocriarusuario: ${estadocriarusuario},
usuarioLogado: ${usuarioLogado},
getEstadoLogin: ${getEstadoLogin},
getEstadoCriarUsuario: ${getEstadoCriarUsuario},
getUsuarioLogado: ${getUsuarioLogado}
    ''';
  }
}
