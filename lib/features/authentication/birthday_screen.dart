import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

import '../../constants/sizes.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  late DateTime initialDate;

  _BirthdayScreenState() {
    DateTime now = DateTime.now();
    initialDate = DateTime(now.year - 12, now.month, now.day);
  }

  @override
  void initState() {
    super.initState();

    _setTextFieldDate(initialDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();

    // 마지막에 super.dispose()를 해라
    super.dispose();
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  void _onNextTap() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const InterestsScreen()),
        (route) => false);
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
          const Text("When's your birthday?",
              style: TextStyle(
                  fontSize: Sizes.size24, fontWeight: FontWeight.w700)),
          Gaps.v8,
          const Text("Your birthday won't be shown publicly.",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600)),
          Gaps.v16,
          TextField(
            enabled: false,
            controller: _birthdayController,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400))),
          ),
          Gaps.v28,
          GestureDetector(onTap: _onNextTap, child: FormButton(disabled: false))
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 300,
        child: CupertinoDatePicker(
          maximumDate: initialDate,
          initialDateTime: initialDate,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: _setTextFieldDate,
        ),
      ),
    );
  }
}
