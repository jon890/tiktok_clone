import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/authentication/password_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

import '../../constants/sizes.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  String _email = "";

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();

    // 마지막에 super.dispose()를 해라
    super.dispose();
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;

    if (!_regExp.hasMatch(_email)) {
      return "Email Not valid";
    }

    return null;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_email.isEmpty || _isEmailValid() != null) return;

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PasswordScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign up"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Gaps.v40,
            const Text("What is your email?",
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w700)),
            Gaps.v16,
            TextField(
              onEditingComplete: _onSubmit,
              keyboardType: TextInputType.emailAddress,
              // autocorrect: false,
              controller: _emailController,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                  hintText: "Email",
                  errorText: _isEmailValid(),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400))),
            ),
            Gaps.v28,
            GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                    disabled: _email.isEmpty || _isEmailValid() != null))
          ]),
        ),
      ),
    );
  }
}
