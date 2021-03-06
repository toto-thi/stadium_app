import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  const PasswordInputField({Key? key, required this.controller, required this.hintText})
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
          hintText: widget.hintText,
          //errorText: 'ລະຫັດຜ່ານບໍ່ຖືກ',
          suffixIcon: IconButton(
            icon: ispasswordVisible
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: () => setState(() {
              ispasswordVisible = !ispasswordVisible;
            }),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.grey[100],
          filled: true),
      obscureText: !ispasswordVisible,
    );
  }
}
