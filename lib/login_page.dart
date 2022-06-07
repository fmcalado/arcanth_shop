import 'package:arcanth_shop/components/auth_state.dart';
import 'package:arcanth_shop/const.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends AuthState<LoginPage> {
  bool _loginIsLoading = false;
  bool _registerIsLoading = false;
  bool _passwordVisible = false;

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  Future<void> _signIn() async {
    setState(() {
      _loginIsLoading = true;
    });
    final response = await supabase.auth.signIn(
      email: _emailController.text,
      password: _passwordController.text,
    );
    final error = response.error;
    if (error != null) {
      context.showErrorSnackBar(message: error.message);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/home', (route) => false);
      context.showSnackBar(message: 'Bem vindo de volta!');
      _emailController.clear();
      _passwordController.clear();
    }

    setState(() {
      _loginIsLoading = false;
    });
  }

  Future<void> _signUp() async {
    setState(() {
      _registerIsLoading = true;
    });
    final response = await supabase.auth.signUp(
      _emailController.text,
      _passwordController.text,
    );
    final error = response.error;
    if (error != null) {
      context.showErrorSnackBar(message: error.message);
    } else {
      context.showSnackBar(message: 'Verifique seu e-mail');
      _emailController.clear();
      _passwordController.clear();
    }

    setState(() {
      _registerIsLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Acesso'))),
      body: ListView(
        padding:
            const EdgeInsets.symmetric(vertical: defaultHeight, horizontal: 12),
        children: [
          const Center(
            child: Text(
              'Faça login ou registre-se',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(height: defaultHeight),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              labelText: 'Senha',
              suffixIcon: IconButton(
                onPressed: () => {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  })
                },
                icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off),
              ),
            ),
          ),
          const SizedBox(height: defaultHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _loginIsLoading ? null : _signIn,
                child: Text(
                  _loginIsLoading ? 'Carregando...' : 'Login',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              ElevatedButton(
                onPressed: _registerIsLoading ? null : _signUp,
                child: Text(
                  _registerIsLoading ? 'Carregando...' : 'Registrar',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}