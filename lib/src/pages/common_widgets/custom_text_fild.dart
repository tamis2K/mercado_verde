import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFild extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool readOnly;
  

  const CustomTextFild(
      {super.key,
      required this.icon,
      required this.label,
      this.inputFormatters,
      this.isSecret = false, 
      this.initialValue, 
      this.readOnly = false,
      });

  @override
  State<CustomTextFild> createState() => _CustomTextFildState();
}

class _CustomTextFildState extends State<CustomTextFild> {

  bool isObscure = false;

  @override
  void initState() {
    super.initState();

    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isSecret ? IconButton(
            onPressed: () {
              setState(() {
                 isObscure = !isObscure;
              });
            },
            icon:  Icon(isObscure ? Icons.visibility : Icons.visibility_off),
          ) : null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
