// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthUser on _AuthUser, Store {
  final _$usrAtom = Atom(name: '_AuthUser.usr');

  @override
  Users get usr {
    _$usrAtom.reportRead();
    return super.usr;
  }

  @override
  set usr(Users value) {
    _$usrAtom.reportWrite(value, super.usr, () {
      super.usr = value;
    });
  }

  final _$_AuthUserActionController = ActionController(name: '_AuthUser');

  @override
  dynamic chekcUser(String username, String password) {
    final _$actionInfo =
        _$_AuthUserActionController.startAction(name: '_AuthUser.chekcUser');
    try {
      return super.chekcUser(username, password);
    } finally {
      _$_AuthUserActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usr: ${usr}
    ''';
  }
}
