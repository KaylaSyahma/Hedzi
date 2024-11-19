import 'package:e_commers/ui/auth/register_screen.dart';
import 'package:e_commers/ui/home/catalogue_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});

// sebuah key untuk menandakan bahwa action ini adalah action yang krusial dalam aplikasi
// GlobalKey jadi penanda klo errornya ad di file ini
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("WELCOME BACK!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20.0,),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                // wajib diisi loh
                validator: (value)  {
                  if(value == null || value.isEmpty) {
                    return "Email is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                // biar jadi secret number
                obscureText: true,
                // wajib diisi loh
                validator: (value)  {
                  if(value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0,),
              ElevatedButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    // if the validation successed, it will navigate to Home screen
                    // gapake push replacement dia ngeganti sekaligus membawa data
                    Fluttertoast.showToast(
                      msg: "Register Success",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: const Color.fromARGB(255, 209, 209, 209),
                      textColor: Colors.black
                      );
                    Navigator.pushNamed(context, '/catalogue');
                  } 
                }, 
                child: const Text("Login")
              ),
              SizedBox(height: 10,),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  RegisterScreen()));

                }, 
                child: Text("Belum punya akun? Daftar disini")
              )
            ],
          )
          ),
        ),
    );
  }
}