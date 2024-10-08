import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project6/data/movies_layer.dart';
import 'package:project6/data/users_layer.dart';
import 'package:project6/models/user.dart';
import 'package:project6/widgets/fields/text_field_widget.dart';
import 'package:project6/colors/app_colors.dart';
import 'package:project6/extensions/nav.dart';
import 'package:project6/screens/log_in_screen.dart';
import 'package:project6/widgets/login_button_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController? nameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  final usersLayer = GetIt.I.get<UsersLayer>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.backgroundColor,
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Get Started",
                  style: GoogleFonts.mulish(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: 40),
                TextFieldWiedget(
                  text: "Name",
                  controllerof: nameController!,
                  prefixIcon: const Icon(Icons.person_outlined),
                  validator: (name) {
                    if (name!.trim().isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFieldWiedget(
                  controllerof: emailController!,
                  text: "Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: (email) {
                    if (!email!.contains("@")) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFieldWiedget(
                  controllerof: phoneController!,
                  text: "Phone",
                  prefixIcon: const Icon(Icons.phone),
                  validator: (phone) {
                    if (phone!.trim().isEmpty) {
                      return 'Phone is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFieldWiedget(
                  controllerof: passwordController!,
                  text: "Password",
                  prefixIcon: const Icon(Icons.key),
                  validator: (password) {
                    if (password!.trim().isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 150),
                LoginButtonWidget(
                  title: "Sign Up",
                  onLogin: () {
                    if (_formKey.currentState!.validate()) {
                      usersLayer.addUser(user:
                        User(
                          name: nameController!.text,
                          email: emailController!.text,
                          phone: phoneController!.text,
                          password: passwordController!.text,
                          userMovies: GetIt.I.get<MoviesLayer>().movies
                        )
                      );
                      context.pushReplacement(screen: const LogInScreen());
                    }
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 110),
                    const Text("Already have an account ? ",style: TextStyle(color: Colors.white)),
                    InkWell(
                      onTap: () => context.pushReplacement(screen: const LogInScreen()),
                      child: const Text("Login",style: TextStyle(color: ColorSelect.brandColor))
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}