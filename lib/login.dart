import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                            onPressed: () {},
                            child: Text(
                              'login'.toUpperCase(),
                              style: tabTextStyle,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'sign up'.toUpperCase(),
                              style: tabTextStyle,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                localizations!.loginWelcom,
                                style: themeData.textTheme.headlineMedium,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 32),
                                child: Text(
                                  localizations.loginSignInDescription,
                                  style: themeData.textTheme.bodyMedium!
                                      .apply(fontSizeFactor: 1.2),
                                ),
                              ),
                              TextField(
                                  decoration: InputDecoration(
                                      labelText:
                                          localizations.loginTextFieldUser)),
                              const SizedBox(height: 8),
                              TextField(
                                obscureText: true,
                                autocorrect: false,
                                enableSuggestions: false,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText:
                                        localizations.loginTextFieldPassword),
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12)))),
                                    onPressed: () {},
                                    child: Text(localizations.loginButton)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 32),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Forgot your password?',
                                            style:
                                                themeData.textTheme.bodyMedium),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Reset here',
                                              style:
                                                  themeData.textTheme.bodySmall,
                                            )),
                                      ],
                                    ),
                                    const Text("Or sign in with",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Assets.img.icons.google
                                            .image(width: 32, height: 32),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              32, 16, 32, 16),
                                          child: Assets.img.icons.facebook
                                              .image(width: 32, height: 32),
                                        ),
                                        Assets.img.icons.twitter
                                            .image(width: 32, height: 32),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
