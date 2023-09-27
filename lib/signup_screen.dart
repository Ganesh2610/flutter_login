import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myproject/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth =FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  TextEditingController _emailController =TextEditingController();
  TextEditingController _passController =TextEditingController();

  String _email= "";
  String _password= "";

 void _HandleSignUp() async{
   try{
    UserCredential userCredential =
    await _auth.createUserWithEmailAndPassword(
      email: _email, password: _password,
     );
    print("User Registered as :$_email");
   }
 catch(e){
     print("Error During Registration: $e}");
 }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  decoration: InputDecoration(
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
                    _HandleSignUp();
                    Navigator.push
                    (context,
              MaterialPageRoute(builder:(context)=>const LoginScreen(),
              ));

                  }
                },
                    child: Text("Sign Up"))
              ],

            ),
          ),
        ),
      ),
    );
  }
}
