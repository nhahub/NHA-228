import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';


class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.isPassword = false,
    this.readOnly = false,
  });

  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isPassword;
  final bool readOnly;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.hintText != null)
            Text(widget.hintText!, style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: 6),
          TextFormField(
            readOnly: widget.readOnly,
            controller: widget.controller,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword ? _obscure : false,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.r8),
                borderSide: BorderSide(color: AppColors.boarderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.r8),
                borderSide: BorderSide(color: AppColors.boarderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.r8),
                borderSide: BorderSide(color: AppColors.focusedBorderColor),
              ),

              fillColor: AppColors.textFieldFillColor,
              filled: true,
              suffixIcon:
                  widget.isPassword
                      ? IconButton(
                        icon: Icon(
                          _obscure ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscure = !_obscure;
                          });
                        },
                      )
                      : null,
            ),
          ),
        ],
      ),
    );
  }
}
