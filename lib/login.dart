import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthStatus _authStatus = AuthStatus.signup;

  void updateAuthState(AuthStatus authStatus) {
    setState(() {
      if (authStatus == AuthStatus.login) {
        _authStatus = AuthStatus.login;
      } else if (authStatus == AuthStatus.signup) {
        _authStatus = AuthStatus.signup;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? localizations = AppLocalizations.of(context);
    final ThemeData themeData = Theme.of(context);
    final TextStyle tabTextStyle = TextStyle(
        color: themeData.colorScheme.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.bold);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 32, 0, 41),
              child: Assets.img.icons.logo.svg(width: 110),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28)),
                color: themeData.colorScheme.primary,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              updateAuthState(AuthStatus.login);
                            },
                            child: Text(
                              'login'.toUpperCase(),
                              style: tabTextStyle.apply(
                                  color: _authStatus == AuthStatus.login
                                      ? Colors.white
                                      : Colors.white60),
                            )),
                        TextButton(
                            onPressed: () {
                              updateAuthState(AuthStatus.signup);
                            },
                            child: Text(
                              'sign up'.toUpperCase(),
                              style: tabTextStyle.apply(
                                  color: _authStatus == AuthStatus.signup
                                      ? Colors.white
                                      : Colors.white60),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: themeData.colorScheme.onPrimary,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(28),
                              topRight: Radius.circular(28))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                        child: SingleChildScrollView(
                            child: _authStatus == AuthStatus.login
                                ? _Login(
                                    localizations: localizations,
                                    themeData: themeData)
                                : _SignUp(
                                    localizations: localizations,
                                    themeData: themeData,
                                  )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

enum AuthStatus { login, signup }

class _Login extends StatelessWidget {
  const _Login({
    super.key,
    required this.localizations,
    required this.themeData,
  });

  final AppLocalizations? localizations;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations!.loginWelcom,
          style: themeData.textTheme.headlineMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 32),
          child: Text(
            localizations!.loginSignInDescription,
            style: themeData.textTheme.bodyMedium!.apply(fontSizeFactor: 1.2),
          ),
        ),
        TextField(
            decoration:
                InputDecoration(labelText: localizations!.loginTextFieldUser)),
        const SizedBox(height: 8),
        _PasswordTextField(localizations: localizations),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)))),
              onPressed: () {},
              child: Text(localizations!.loginButton)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 32),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Forgot your password?',
                      style: themeData.textTheme.bodyMedium),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Reset here',
                      style: themeData.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              const Text(
                "Or sign in with",
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.img.icons.google.image(width: 32, height: 32),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child:
                        Assets.img.icons.facebook.image(width: 32, height: 32),
                  ),
                  Assets.img.icons.twitter.image(width: 32, height: 32),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    super.key,
    required this.localizations,
    required this.themeData,
  });

  final AppLocalizations? localizations;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations!.signUpWelcom,
          style: themeData.textTheme.headlineMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 32),
          child: Text(
            localizations!.loginSignUpDescription,
            style: themeData.textTheme.bodyMedium!.apply(fontSizeFactor: 1.2),
          ),
        ),
        TextField(
            decoration:
                InputDecoration(labelText: localizations!.loginTextFieldUser)),
        const SizedBox(height: 8),
        _PasswordTextField(localizations: localizations),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)))),
              onPressed: () {},
              child: Text(localizations!.signUpButton)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 32),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 32),
                  Text(
                    "Or sign in with",
                    style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.img.icons.google.image(width: 32, height: 32),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child:
                        Assets.img.icons.facebook.image(width: 32, height: 32),
                  ),
                  Assets.img.icons.twitter.image(width: 32, height: 32),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    super.key,
    required this.localizations,
  });

  final AppLocalizations? localizations;

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: widget.localizations!.loginTextFieldPassword,
        suffix: TextButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Text(
            _obscureText ? 'Show' : 'Hide',
          ),
        ),
      ),
    );
  }
}
