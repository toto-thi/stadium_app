import 'package:flutter/material.dart';

class EmailInputField extends StatefulWidget {
  final TextEditingController? controller;

  const EmailInputField({Key? key, required this.controller}) : super(key: key);

  @override
  State<EmailInputField> createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        suffixIcon: widget.controller!.text.isEmpty
            ? Container(
                width: 0,
            )
            : IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => widget.controller?.clear(),
              ),
        labelText: 'Email',
        hintText: 'name@example.com',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(width: 0, color: Colors.transparent)),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );
  }
}
