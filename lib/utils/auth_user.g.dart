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

  final _$checkedAtom = Atom(name: '_AuthUser.checked');

  @override
  bool get checked {
    _$checkedAtom.reportRead();
    return super.checked;
  }

  @override
  set checked(bool value) {
    _$checkedAtom.reportWrite(value, super.checked, () {
      super.checked = value;
    });
  }

  final _$stateAtom = Atom(name: '_AuthUser.state');

  @override
  int get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(int value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$_AuthUserActionController = ActionController(name: '_AuthUser');

  @override
  dynamic checkUser(String username, String password) {
    final _$actionInfo =
        _$_AuthUserActionController.startAction(name: '_AuthUser.checkUser');
    try {
      return super.checkUser(username, password);
    } finally {
      _$_AuthUserActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usr: ${usr},
checked: ${checked},
state: ${state}
    ''';
  }
}
