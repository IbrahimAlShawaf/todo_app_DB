import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hintext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController mycontroller;
  final Function validator;
  //final Function onSaved;
  final bool obscureText;
  final TextInputType keyboardType;
  // final String value;
  const CustomTextForm({
    super.key,
    required this.hintext,
    required this.labeltext,
    required this.iconData,
    required this.mycontroller,
    required this.validator,
    //required this.onSaved,
    required this.obscureText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: mycontroller,
        keyboardType: keyboardType,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          suffixIcon: Icon(iconData),
          hintText: hintext,
          
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(labeltext),
          ),
          labelStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
