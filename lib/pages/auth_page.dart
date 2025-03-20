import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/components/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(215, 117, 255, 0.5),
                Color.fromRGBO(255, 188, 177, 0.9),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //.. é operador cascade que possibilita  chamar varias vezes o metodo sobre uma lista.
                transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 70,
                ),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.black26,
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepOrange.shade900,
                ),
                child: Text(
                  'Minha Loja',
                  style: TextStyle(
                    fontSize: 45,
                    fontFamily: 'Anton',
                    color: Theme.of(context).colorScheme.copyWith().primary,
                  ),
                ),
              ),
              AuthForm(),
            ],
          ),
        )
      ],
    ));
  }
}
