import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:motus_flutter_cda/ui/screens/login/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4460FF),
      body: Consumer<LoginViewModel>(
        builder: ((context, viewModel, child) {
          viewModel.addListener(() {
            if (viewModel.player != null) {
              // Rediriger vers la Home Page
              context.beamToNamed("/home");
            }
          });
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  children: [
                    TextField(
                      obscureText: false,
                      controller: loginController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Login',
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Password'
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (){
                          viewModel.signIn(
                              email: loginController.value.text,
                              password: passwordController.value.text
                          );
                        },
                        child: const Text("Se Connecter")
                    )
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
