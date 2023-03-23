import 'package:chat_app/component/custom_botton.dart';
import 'package:chat_app/component/custom_text_field.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/layout/chat/chat_screen.dart';
import 'package:chat_app/layout/welcome_home/welcome_home_screen.dart';
import 'package:chat_app/modules/signup/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class LoginScreen extends StatefulWidget {
  static String id='loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // var passController = TextEditingController();
  // bool password = true;
  String? email;
  String? password;
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeHomeScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
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
                    'Chat App',
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.white,
                      fontFamily: 'pacifico',
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Center(
                  child: Text(
                    'Please login to continue using our app',
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
                              email=value;
                            },
                            message: 'enter your email please',
                            labelText: 'Email',
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          CustomTextFormField(
                            pass: true,
                            onChanged: (value)
                            {
                                password=value;
                            },
                            message: 'enter your password please',
                            labelText: 'Password',
                          ),
                          SizedBox(
                            height: 30.0,
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
                              await loginUser();
                              Navigator.pushNamed(
                                  context,
                                  ChatScreen.id ,
                                  arguments: email);
                            }
                            on FirebaseAuthException catch(error)
                            {
                              if(error.code=='user-not-found')
                              {
                                showSnackBar(context,'No user found for that email');
                              }
                              else if(error.code=='wrong-password')
                              {
                                showSnackBar(context, 'Wrong password');
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
                        text: 'Login',
                      ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have ana account ? ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: ()
                                {
                                  Navigator.pushNamed(context, SignUpScreen.id);
                                },
                                child: Text(
                                  ' Register Now',
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
  Future<void> loginUser() async {
    var auth =  FirebaseAuth.instance;
    UserCredential user =await auth.signInWithEmailAndPassword(
      email: email!,
      password: password!,);
  }
}

