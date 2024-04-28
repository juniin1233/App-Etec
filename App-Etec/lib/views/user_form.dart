import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:provider/provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../provider/users.dart';
import '../routes/app_routes.dart';

class UserForm extends StatelessWidget {
  UserForm({super.key});

  final _form = GlobalKey<FormState>();
  final Map<String, String> formdata = {};
  var mask = MaskTextInputFormatter(mask: '(##)# ####-####');

  TextEditingController nome = TextEditingController();
  TextEditingController tel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Color(0xFFB20000),
        title: const Text(
          'Etec',
          style: TextStyle(fontSize: 40),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                );
              },
              icon: Icon(Icons.list, size: 35),
            ),
          ),
        ],
      ),
      body: Form(
        key: _form,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 128,
                  height: 80.63,
                  child: Image.asset('asset/logo.png'),
                ),
                Container(
                  width: 128,
                  height: 80.63,
                  child: Image.asset('asset/logocps.png'),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Divulgação do Vestibulinho',
              style: TextStyle(
                  color: Color(0xFFB20000),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Inscrições Até 08/11',
              style: TextStyle(
                color: Color(0xFFB20000),
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: nome,
                onSaved: (value) => formdata['nome'] = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nome não inserido";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFFB20000)),
                  ),
                  labelText: 'Nome',
                  labelStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                inputFormatters: [mask],
                keyboardType: TextInputType.number,
                controller: tel,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Número não inserido";
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Celular',
                  labelStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onSaved: (value) => formdata['tel'] = value!,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                  200,
                  50,
                ),
                backgroundColor: Color(0xFFB20000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                final isValid = _form.currentState!.validate();
                if (isValid) {
                  _form.currentState?.save();
                  Provider.of<Users>(context, listen: false).put(
                    User(
                      nome: formdata['nome']!,
                      tel: formdata['tel']!,
                    ),
                  );

                  //Limpar o campo
                  nome.clear();
                  tel.clear();
                }
              },
              child: const Text(
                'Anotar',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
