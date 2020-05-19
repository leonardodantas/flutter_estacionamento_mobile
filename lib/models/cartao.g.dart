// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartao.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartaoDAO on CartaoDAOBase, Store {
  final _$uidAtom = Atom(name: 'CartaoDAOBase.uid');

  @override
  String get uid {
    _$uidAtom.reportRead();
    return super.uid;
  }

  @override
  set uid(String value) {
    _$uidAtom.reportWrite(value, super.uid, () {
      super.uid = value;
    });
  }

  final _$placaVeiculoAtom = Atom(name: 'CartaoDAOBase.placaVeiculo');

  @override
  String get placaVeiculo {
    _$placaVeiculoAtom.reportRead();
    return super.placaVeiculo;
  }

  @override
  set placaVeiculo(String value) {
    _$placaVeiculoAtom.reportWrite(value, super.placaVeiculo, () {
      super.placaVeiculo = value;
    });
  }

  final _$nomeProprietarioAtom = Atom(name: 'CartaoDAOBase.nomeProprietario');

  @override
  String get nomeProprietario {
    _$nomeProprietarioAtom.reportRead();
    return super.nomeProprietario;
  }

  @override
  set nomeProprietario(String value) {
    _$nomeProprietarioAtom.reportWrite(value, super.nomeProprietario, () {
      super.nomeProprietario = value;
    });
  }

  final _$cpfAtom = Atom(name: 'CartaoDAOBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$nomeCartaoAtom = Atom(name: 'CartaoDAOBase.nomeCartao');

  @override
  String get nomeCartao {
    _$nomeCartaoAtom.reportRead();
    return super.nomeCartao;
  }

  @override
  set nomeCartao(String value) {
    _$nomeCartaoAtom.reportWrite(value, super.nomeCartao, () {
      super.nomeCartao = value;
    });
  }

  final _$numeroCartaoAtom = Atom(name: 'CartaoDAOBase.numeroCartao');

  @override
  String get numeroCartao {
    _$numeroCartaoAtom.reportRead();
    return super.numeroCartao;
  }

  @override
  set numeroCartao(String value) {
    _$numeroCartaoAtom.reportWrite(value, super.numeroCartao, () {
      super.numeroCartao = value;
    });
  }

  final _$cvAtom = Atom(name: 'CartaoDAOBase.cv');

  @override
  String get cv {
    _$cvAtom.reportRead();
    return super.cv;
  }

  @override
  set cv(String value) {
    _$cvAtom.reportWrite(value, super.cv, () {
      super.cv = value;
    });
  }

  final _$quantidadeAtom = Atom(name: 'CartaoDAOBase.quantidade');

  @override
  double get quantidade {
    _$quantidadeAtom.reportRead();
    return super.quantidade;
  }

  @override
  set quantidade(double value) {
    _$quantidadeAtom.reportWrite(value, super.quantidade, () {
      super.quantidade = value;
    });
  }

  final _$CartaoDAOBaseActionController =
      ActionController(name: 'CartaoDAOBase');

  @override
  dynamic setPlacaVeiculo(String placa) {
    final _$actionInfo = _$CartaoDAOBaseActionController.startAction(
        name: 'CartaoDAOBase.setPlacaVeiculo');
    try {
      return super.setPlacaVeiculo(placa);
    } finally {
      _$CartaoDAOBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProprietario(String proprietario) {
    final _$actionInfo = _$CartaoDAOBaseActionController.startAction(
        name: 'CartaoDAOBase.setProprietario');
    try {
      return super.setProprietario(proprietario);
    } finally {
      _$CartaoDAOBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCPF(String novoCpf) {
    final _$actionInfo = _$CartaoDAOBaseActionController.startAction(
        name: 'CartaoDAOBase.setCPF');
    try {
      return super.setCPF(novoCpf);
    } finally {
      _$CartaoDAOBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNomeCartao(String nome) {
    final _$actionInfo = _$CartaoDAOBaseActionController.startAction(
        name: 'CartaoDAOBase.setNomeCartao');
    try {
      return super.setNomeCartao(nome);
    } finally {
      _$CartaoDAOBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNumeroCartao(String numero) {
    final _$actionInfo = _$CartaoDAOBaseActionController.startAction(
        name: 'CartaoDAOBase.setNumeroCartao');
    try {
      return super.setNumeroCartao(numero);
    } finally {
      _$CartaoDAOBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCV(String c) {
    final _$actionInfo = _$CartaoDAOBaseActionController.startAction(
        name: 'CartaoDAOBase.setCV');
    try {
      return super.setCV(c);
    } finally {
      _$CartaoDAOBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuantidade(double qtd) {
    final _$actionInfo = _$CartaoDAOBaseActionController.startAction(
        name: 'CartaoDAOBase.setQuantidade');
    try {
      return super.setQuantidade(qtd);
    } finally {
      _$CartaoDAOBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
uid: ${uid},
placaVeiculo: ${placaVeiculo},
nomeProprietario: ${nomeProprietario},
cpf: ${cpf},
nomeCartao: ${nomeCartao},
numeroCartao: ${numeroCartao},
cv: ${cv},
quantidade: ${quantidade}
    ''';
  }
}
