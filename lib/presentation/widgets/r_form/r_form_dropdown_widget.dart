import 'package:flutter/material.dart';

class RFormDropDownWidget extends StatefulWidget {
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? hintText;
  final List<String> items;
  final int? maxLines;
  final void Function(String?)? onChange;
  final void Function(String?)? onSaved;

  const RFormDropDownWidget({
    Key? key,
    required this.items,
    this.validator,
    this.onChange,
    this.keyboardType,
    this.hintText,
    this.onSaved,
    this.maxLines
  }) : super(key: key);

  @override
  State<RFormDropDownWidget> createState() => _RFormDropDownWidgetState();
}

class _RFormDropDownWidgetState extends State<RFormDropDownWidget> {
  String dropdownValue = '';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.items.contains(dropdownValue) ? dropdownValue : null,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onChanged: (String? data) {
        setState(() => dropdownValue = data!);

        if (widget.onChange != null) {
          widget.onChange!(data);
        }
      },
      items: [
        ...widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value
            )
          );
        }).toList(),

      ],
      decoration: InputDecoration(
        hintText: widget.hintText,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black54,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        contentPadding: const EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black54,
          ),
          borderRadius: BorderRadius.circular(14),
        )
      ),
    );
  }
}
