// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wallpaperapp/wallpaper.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/736x/97/02/da/9702dae827bb04f340ca2cd6984e253a.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 120, 60, 20),
                  child: Text(
                    "LOGIN HERE",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Enter your username or Email ",
                      fillColor: Colors.white,
                      labelText: "User Name",
                      labelStyle: const TextStyle(color: Colors.white),
                      hintStyle: const TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w400,
                          wordSpacing: 2),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 17, horizontal: 12),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      fillColor: Colors.white,
                      labelText: "Password",
                      labelStyle: const TextStyle(color: Colors.white),
                      hintStyle: const TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w400,
                          wordSpacing: 2),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 17, horizontal: 12),
                    ),
                  ),
                ),
                AnimatedButton(
                  onPress: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Wallpaper())));
                  },
                  height: 47,
                  width: 180,
                  text: 'Login',
                  isReverse: true,
                  selectedTextColor: Colors.green,
                  transitionType: TransitionType.LEFT_TO_RIGHT,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  backgroundColor: Vx.green900,
                  borderColor: Colors.white,
                  borderRadius: 50,
                  borderWidth: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//