import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

import '../../constants/sizes.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = "";

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();

    // 마지막에 super.dispose()를 해라
    super.dispose();
  }

  void _onNextTap() {
    if (_username.isEmpty) return;

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const EmailScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Gaps.v40,
          const Text("Create username",
              style: TextStyle(
                  fontSize: Sizes.size24, fontWeight: FontWeight.w700)),
          Gaps.v8,
          const Text("You can always change this later.",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600)),
          Gaps.v16,
          TextField(
            controller: _usernameController,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
                hintText: "Username",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400))),
          ),
          Gaps.v28,
          GestureDetector(
              onTap: _onNextTap, child: FormButton(disabled: _username.isEmpty))
        ]),
      ),
    );
  }
}