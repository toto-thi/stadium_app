import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController? controller;

  const PasswordInputField({Key? key, required this.controller})
      : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  String password = '';
  bool ispasswordVisible = false;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //look into it later
      onChanged: ((value) => setState(() {
            this.password = value;
          })),

      //
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: 'ກະລຸນາໃສ່ລະຫັດ',
        labelText: 'Password',
        //errorText: 'ລະຫັດຜ່ານບໍ່ຖືກ',
        suffixIcon: IconButton(
          icon: ispasswordVisible
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onPressed: () => setState(() {
            ispasswordVisible = !ispasswordVisible;
          }),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(width: 0, color: Colors.transparent)),
      ),
      obscureText: !ispasswordVisible,
    );
  }
}
