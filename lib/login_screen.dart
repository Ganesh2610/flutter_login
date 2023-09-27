import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myproject/signup_screen.dart';
import 'package:myproject/welcome.dart';
import 'package:fluttertoast/fluttertoast.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth =FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  TextEditingController _emailController =TextEditingController();
  TextEditingController _passController =TextEditingController();
  String _email= "";
  String _password= "";

  void _HandleLogin() async{
    try{
      print("User Logged In :$_email");

      Navigator.push
        (context,
          MaterialPageRoute(builder:(context)=>Welcome(),
          ));
    }
    catch(e){
      print("Error During Log in: $e}");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

            const SizedBox(height: 20.0), // Adjust spacing as needed

            TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "Please Enter your email";
                    }
                    return null;
                  },
                  onChanged: (value){
                    setState(() {
                      _email=value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passController,
                  obscureText: true,
                  // keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "Please Enter your Password";
                    }
                    return null;
                  },
                  onChanged: (value){
                    setState(() {
                      _password=value;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: (){
                  if(_formkey.currentState!.validate()){
                    _HandleLogin();
                  }
                },
                    child: Text("Login")),
                SizedBox(height: 20),
                TextButton(
                    onPressed: (){
                      _auth.signOut();
                      Navigator.push
                        (context,
                          MaterialPageRoute(builder:(context)=>const SignupScreen(),
                          ));
                    },
                    child: const Text("New User Register here"))

              ],

            ),
          ),
        ),
      ),
    );
  }
}
