import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final String text;

  const SettingsCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          reusableText(text: text),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
