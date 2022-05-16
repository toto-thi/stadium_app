import 'package:flutter/material.dart';

class EmailInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;

  const EmailInputField(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);

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
          suffixIcon: widget.controller!.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => widget.controller?.clear(),
                ),
          hintText: widget.hintText,
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
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );
  }
}
