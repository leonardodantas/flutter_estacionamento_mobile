// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validacao.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Validacao on ValidacaoBase, Store {
  Computed<String> _$getMensagemValidacaoComputed;

  @override
  String get getMensagemValidacao => (_$getMensagemValidacaoComputed ??=
          Computed<String>(() => super.getMensagemValidacao,
              name: 'ValidacaoBase.getMensagemValidacao'))
      .value;
  Computed<bool> _$getObjetoValidadoComputed;

  @override
  bool get getObjetoValidado => (_$getObjetoValidadoComputed ??= Computed<bool>(
          () => super.getObjetoValidado,
          name: 'ValidacaoBase.getObjetoValidado'))
      .value;

  final _$mensagemValidacaoAtom = Atom(name: 'ValidacaoBase.mensagemValidacao');

  @override
  String get mensagemValidacao {
    _$mensagemValidacaoAtom.reportRead();
    return super.mensagemValidacao;
  }

  @override
  set mensagemValidacao(String value) {
    _$mensagemValidacaoAtom.reportWrite(value, super.mensagemValidacao, () {
      super.mensagemValidacao = value;
    });
  }

  final _$objetoValidadoAtom = Atom(name: 'ValidacaoBase.objetoValidado');

  @override
  bool get objetoValidado {
    _$objetoValidadoAtom.reportRead();
    return super.objetoValidado;
  }

  @override
  set objetoValidado(bool value) {
    _$objetoValidadoAtom.reportWrite(value, super.objetoValidado, () {
      super.objetoValidado = value;
    });
  }

  final _$ValidacaoBaseActionController =
      ActionController(name: 'ValidacaoBase');

  @override
  dynamic setMensagemValidacao(String mensagem) {
    final _$actionInfo = _$ValidacaoBaseActionController.startAction(
        name: 'ValidacaoBase.setMensagemValidacao');
    try {
      return super.setMensagemValidacao(mensagem);
    } finally {
      _$ValidacaoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setObjetoValidado(bool objeto) {
    final _$actionInfo = _$ValidacaoBaseActionController.startAction(
        name: 'ValidacaoBase.setObjetoValidado');
    try {
      return super.setObjetoValidado(objeto);
    } finally {
      _$ValidacaoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validarUsuario(UserModel model) {
    final _$actionInfo = _$ValidacaoBaseActionController.startAction(
        name: 'ValidacaoBase.validarUsuario');
    try {
      return super.validarUsuario(model);
    } finally {
      _$ValidacaoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mensagemValidacao: ${mensagemValidacao},
objetoValidado: ${objetoValidado},
getMensagemValidacao: ${getMensagemValidacao},
getObjetoValidado: ${getObjetoValidado}
    ''';
  }
}
