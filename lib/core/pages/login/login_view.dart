import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

part 'package:doctor_appointment/core/widgets/custom_button.dart';
part 'package:doctor_appointment/core/widgets/custom_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isVisible = false;
  final Key _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: context.padding.low,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: 'Welcome',
                style: context.general.textTheme.displaySmall,
              ),
              SizedBox(height: context.sized.height * 0.01),
              CustomText(
                title: 'Sign in to your account',
                style: context.general.textTheme.titleMedium,
              ),
              SizedBox(height: context.sized.height * 0.01),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'E-Mail',
                    hintText: 'Enter your e-mail',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
              SizedBox(height: context.sized.height * 0.03),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: isVisible
                        ? const Icon(Icons.remove_red_eye_outlined)
                        : const Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
              SizedBox(height: context.sized.height * 0.05),
              CustomButton(
                title: 'Sign in',
                onPressed: () {},
              ),
              SizedBox(height: context.sized.height * 0.03),
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text('Forgot your password ?')),
              ),
              const Spacer(),
              Padding(
                padding: context.padding.medium,
                child: Center(
                  child: Column(
                    children: [
                      CustomText(
                          title: 'Continue social account  ',
                          style:
                              context.general.textTheme.titleMedium?.copyWith(
                            color: Colors.grey,
                          )),
                      SizedBox(height: context.sized.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(FontAwesomeIcons.google),
                              label: Text('Google')),
                          ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(FontAwesomeIcons.facebook),
                              label: Text('Facebook')),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              title: 'Don\'t have an account ?',
                              style: context.general.textTheme.titleMedium
                                  ?.copyWith(
                                color: Colors.grey,
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Sign up',
                                style: context.general.textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
