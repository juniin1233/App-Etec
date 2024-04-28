import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/dummy_data.dart';
import 'package:flutter_application_1/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.tel != null &&
        user.tel.trim().isNotEmpty &&
        _items.containsKey(user.tel)) {
      _items.update(
        user.tel,
        (_) => User(
          nome: user.nome,
          tel: user.tel,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => User(
          nome: user.nome,
          tel: user.tel,
        ),
      );
    }

    notifyListeners();
  }
}
