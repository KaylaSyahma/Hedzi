import 'package:e_commers/consts.dart';
import 'package:e_commers/ui/auth/login_screen.dart';
import 'package:e_commers/ui/home/catalogue_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatelessWidget {
  // const LoginPage({super.key});

// sebuah key untuk menandakan bahwa action ini adalah action yang krusial dalam aplikasi
// GlobalKey jadi penanda klo errornya ad di file ini
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final FToast fToast = FToast();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Create an Account!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Nama*",
                    border: OutlineInputBorder(),
                  ),
                  // wajib diisi loh
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  // wajib diisi loh
                  validator: (value) {
                    if (value == null || value.isEmpty) {
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()) {
                        // if the validation successed, it will navigate to Home screen
                        // gapake push replacement dia ngeganti sekaligus membawa data
                        fToast.showToast(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 45.0, vertical: 20.0),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Text(
                              "Successfully created an account!",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          gravity: ToastGravity.BOTTOM,
                          toastDuration: const Duration(seconds: 3),
                        );

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CatalogueScreen()));
                      }
                    },
                    child: const Text("Daftar")),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text("Sudah punya akun? Masuk"))
              ],
            )),
      ),
    );
  }
}

