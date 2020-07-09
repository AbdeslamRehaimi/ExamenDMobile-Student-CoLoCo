import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomNumberField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  Icon custumIcon;
  CustomNumberField({@required this.labelText, this.controller, this.custumIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
          border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
          labelText: labelText,
          //icon: Icon(Icons.phone_iphone)
      ),
    );
  }
}
