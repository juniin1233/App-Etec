import 'package:flutter/material.dart';

import '../models/user.dart';

class UserTile extends StatelessWidget {

  final User user;

  const UserTile(this.user,{super.key});



  @override
  Widget build(BuildContext context) {

    final icone = CircleAvatar(child: Icon(Icons.person),);

    return ListTile(
      leading: icone,
      title: Text(user.nome),
      subtitle: Text(user.tel),
    );
  }
}