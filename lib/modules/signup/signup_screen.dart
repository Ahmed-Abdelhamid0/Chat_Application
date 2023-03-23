import 'package:chat_app/component/custom_botton.dart';
import 'package:chat_app/component/custom_text_field.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/layout/chat/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class SignUpScreen extends StatefulWidget {
  static String id='signupScreen';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // var emailController=TextEditingController();
  // var passController=TextEditingController();
  // var fullNameController=TextEditingController();
  // bool password=true;

  bool isLoading = false;
   var formKey=GlobalKey<FormState>();
  String? email;
  String? password;
  String? name;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: primaryColor,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                  height: 150.0,
                  image: AssetImage(imageLogo2),
                ),
                Center(
                  child: Text(
                    'Scholar Chat',
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.white,
                      fontFamily: 'pacifico',
                    ),
                  ),
                ),

                Center(
                  child: Text(
                    'Make Your First Account Now ',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Container(
                      width: 270.0,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            onChanged: (value)
                            {
                              name=value;
                            },
                            message: 'this field is required',
                            labelText: 'Name',
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          CustomTextFormField(
                            onChanged: (value)
                            {
                              email=value;
                            },
                            message: 'this field is required',
                            labelText: 'Email',
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          CustomTextFormField(
                            onChanged: (value)
                            {
                              password=value;
                            },
                            message: 'this field is required',
                            labelText: 'Password',
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          CustomButton(
                            onTap: () async
                            {
                            if (formKey.currentState!.validate()) {
                              isLoading=true;
                              setState(() {

                              });
                              try
                              {
                                await registerUser();
                                Navigator.pushNamed(context, ChatScreen.id);
                              }
                              on FirebaseAuthException catch(error)
                                {
                                  if(error.code=='weak-password')
                                  {
                                        showSnackBar(context,'Weak Password');
                                  }
                                  else if(error.code=='email-already-in-use')
                                  {
                                   showSnackBar(context, 'Email Alredy Exists');
                                  }
                                }catch(error)
                                {
                                  showSnackBar(context, 'there was an error');
                                }
                              isLoading=false;
                              setState(() {

                              });
                            }else{}
                            },
                            text: 'Register',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account ?  ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: ()
                                {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  ' Login Now',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Future<void> registerUser() async {
    var auth =  FirebaseAuth.instance;
    UserCredential user =await auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,);
  }
}
