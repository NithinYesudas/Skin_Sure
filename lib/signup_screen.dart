import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';


import '../helpers/auth_validators.dart';
import 'custom_colors.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const routeName = "/signup_screen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            height: mediaQuery.height * .1,
          ),
          Center(
            child: SizedBox(
              height: mediaQuery.height *.075,
              width: mediaQuery.width*.7,
              child: Image.asset(
                "assets/images/img.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: mediaQuery.height * .05,
          ),
          Text(
            "Welcome to Skin Sure.!",
            style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.bold, fontSize: mediaQuery.width * .06),
          ),
          Text(
            "Create an account and let's get started.",
            style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.w600,
                fontSize: mediaQuery.width * .045,
                color: CustomColors.lightAccent),
          ),
          SizedBox(
            height: mediaQuery.height * .03,
          ),
          Form(
              key: _formKey,
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * .05),
                height: mediaQuery.height * .4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        return AuthValidators.emailValidator(value!);
                      },
                      style: GoogleFonts.nunitoSans(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                          prefixIcon: const Icon(
                            Ionicons.mail_outline,
                            color: CustomColors.primaryColor,
                          ),
                          hintText: "Email",
                          hintStyle: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w600,
                              color: Colors.black38),
                          fillColor: Colors.black12,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none)),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      style: GoogleFonts.nunitoSans(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        return AuthValidators.confirmPasswordValidator(
                            value!.trim(),
                            _confirmPasswordController.text.trim());
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 5),
                          prefixIcon: const Icon(
                            Ionicons.lock_closed_outline,
                            color: CustomColors.primaryColor,
                          ),
                          hintText: "Password",
                          hintStyle: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w600,
                              color: Colors.black38),
                          fillColor: Colors.black12,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none)),
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,
                      style: GoogleFonts.nunitoSans(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        return AuthValidators.confirmPasswordValidator(
                            _passwordController.text.trim(), value!.trim());
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 5),
                          prefixIcon: const Icon(
                            Ionicons.lock_closed_outline,
                            color: CustomColors.primaryColor,
                          ),
                          hintText: "Confirm Password",
                          hintStyle: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w600,
                              color: Colors.black38),
                          fillColor: Colors.black12,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none)),
                    ),
                    ElevatedButton(
                        onPressed: () async {

                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: mediaQuery.width * .11,
                                    vertical: mediaQuery.height * .015)),
                            backgroundColor: MaterialStateProperty.all(
                                CustomColors.lightAccent)),
                        child: isLoading?const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                        :Text(
                          "Create Account",
                          style: GoogleFonts.nunitoSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: mediaQuery.width * .04),
                        ))
                  ],
                ),
              )),
        ])));
  }

  void showMessage(String message, Color color) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: color,
      ));


}
