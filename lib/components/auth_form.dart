import 'package:flutter/material.dart';

enum AuthMode {
  Signup,
  Login,
}

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final AuthMode _authMode = AuthMode.Login;
  final _passwordController = TextEditingController();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _submit() {}
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 320,
        width: deviceSize.width * 0.75,
        child: Form(
            child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'e-mail',
              ),
              onSaved: (email) => _authData['email'] = email ?? '',
              validator: (_email) {
                final email = _email ?? '';
                if (email.trim().isEmpty || !email.contains('@')) {
                  return "informe um email válido";
                }

                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'senha',
              ),
              controller: _passwordController,
              onSaved: (password) => _authData['password'] = password ?? '',
              obscureText: true,
              validator: (_password) {
                final password = _password ?? '';
                if (password.isEmpty || password.length < 5) {
                  return 'informe uma senha válida com pelo menos 5 caracteres';
                }
                return null;
              },
            ),
            if (_authMode == AuthMode.Signup)
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Confirmar Senha',
                ),
                obscureText: true,
                validator: (_password) {
                  final password = _password ?? '';
                  if (password != _passwordController.text) {
                    return "Senhas informadas não conferem";
                  }
                  return null;
                },
              ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 8,
                ),
              ),
              onPressed: _submit,
              child: Text(
                _authMode == AuthMode.Login ? 'Entrar' : 'Registrar',
              ),
            ),
          ],
        )),
      ),
    );
  }
}
