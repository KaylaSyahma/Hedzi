import 'package:e_commers/consts.dart';
import 'package:e_commers/ui/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});

// sebuah key untuk menandakan bahwa action ini adalah action yang krusial dalam aplikasi
// GlobalKey jadi penanda klo errornya ad di file ini
  final _formKey = GlobalKey<FormState>();
  
  // pakai controller untuk input (akses) textfield
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              primaryColor
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("WELCOME BACK!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                  ),
                ),
                const SizedBox(height: 20.0,),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Color(0xFFD6D6D6))
                  ),
                  // wajib diisi loh
                  validator: (value)  {
                    if(value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!value.endsWith("@gmail.com")) {
                      return "Please fill with valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Color(0xFFD6D6D6))
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
                ElevatedButton (
                  onPressed: (){
                    // dia akan melakukan validasi pada setiap formfield, ngecek ada error atau ngga
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
                  child: const Text("Login", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w800, fontSize: 16),)
                ),
                SizedBox(height: 10,),
                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  RegisterScreen()));
        
                  }, 
                  child: Text("Belum punya akun? Daftar disini", style: TextStyle(color: const Color.fromARGB(255, 240, 240, 240)),)
                )
              ],
            )
            ),
          ),
      ),
    );
  }
}