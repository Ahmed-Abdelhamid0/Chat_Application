import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/modules/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_buttons/social_media_button.dart';

class WelcomeHomeScreen extends StatelessWidget {
  static String id='welcomeScreen';

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
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
        child: Column(
          children:
          [
            Image(
              image: AssetImage(imageLogo2),
              height: 150.0,

            ),
            SizedBox(
              height: 15.0,),
            Center(
              child: Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ),
                  ),
            ),
            Center(
              child: Text(
                    'create an account to start chat now',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
            ),
            SizedBox(
              height: 140.0,),
            Column(
              children:
              [
              TextButton(
                    onPressed: ()
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>LoginScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.red,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      width: 270.0,
                      height: 60.0,
                      child: Center(
                        child: Text(
                          'Getting Started',
                          style: TextStyle(
                            fontSize: 27.0,
                            color: Colors.white,
                          ),
                        ),
                      ),

                    ),

                ),

                SizedBox(
                  height: 20.0,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    CircleAvatar(
                      radius: 15.0,
                      child: SocialMediaButton.facebook(
                        onTap: ()
                        {
                          print('hello');
                        },
                        url: 'https://www.facebook.com/ahmed.abdelhamid.5209',
                        size: 15.0,
                        color: Colors.white,
                      ),

                    ),
                    SizedBox(width: 20.0,),
                    CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.red,
                      child: SocialMediaButton.instagram(
                        onTap: ()
                        {

                        },
                        url: 'https://www.instagram.com/7am0odx99/',
                        size: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.blue,
                      child: SocialMediaButton.twitter(
                        onTap: ()
                        {

                        },
                        url: 'https://twitter.com/7am0odx99',
                        size: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
  }
