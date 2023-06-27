import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

import '../../constants/sizes.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final _regExp = RegExp(
      r"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&^])[A-Za-z0-9@$!%*#?&^]{8,20}$");

  String _password = "";
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();

    // 마지막에 super.dispose()를 해라
    super.dispose();
  }

  bool _isValidLength() {
    return _password.isNotEmpty &&
        _password.length >= 8 &&
        _password.length <= 20;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isValidLength() || !_regExp.hasMatch(_password)) return;

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const BirthdayScreen()));
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
            const Text("Password",
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w700)),
            Gaps.v16,
            TextField(
              obscureText: _obscureText,
              onEditingComplete: _onSubmit,
              // autocorrect: false,
              controller: _passwordController,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h16,
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      )
                    ],
                  ),
                  hintText: "Make it strong!",
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400))),
            ),
            Gaps.v10,
            const Text("Your password must have:",
                style: TextStyle(fontWeight: FontWeight.w600)),
            Gaps.v10,
            Row(
              children: [
                FaIcon(FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color:
                        _isValidLength() ? Colors.green : Colors.grey.shade400),
                Gaps.h10,
                const Text("8 to 20 characters")
              ],
            ),
            Gaps.v10,
            Row(
              children: [
                FaIcon(FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: _regExp.hasMatch(_password)
                        ? Colors.green
                        : Colors.grey.shade400),
                Gaps.h10,
                const Text("Letters, numbers, and special character")
              ],
            ),
            Gaps.v28,
            GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                    disabled:
                        !_isValidLength() || !_regExp.hasMatch(_password)))
          ]),
        ),
      ),
    );
  }
}
