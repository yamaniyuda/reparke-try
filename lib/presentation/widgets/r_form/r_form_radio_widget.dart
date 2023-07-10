import 'package:flutter/material.dart';

class RFormRadioWidget extends StatefulWidget {
  final List<Map<String, String>> values;
  final String title;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const RFormRadioWidget({
    Key? key,
    required this.onSaved,
    required this.title,
    required this.values,
    this.validator
  }) : super(key: key);

  @override
  State<RFormRadioWidget> createState() => _RFormRadioWidgetState();
}

class _RFormRadioWidgetState extends State<RFormRadioWidget> {
  late String? _value = '';

  @override
  Widget build(BuildContext context) {
    final FormState form = Form.of(context);


    return FormField<String>(
      validator: widget.validator,
      onSaved: widget.onSaved,
      builder: (FormFieldState<String> field) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          Row(
            children: widget.values.map<Widget>(
              (e) => InkWell(
                onTap: () => setState(() => _value = e.keys.toList()[0]),
                child: Row(
                  children: [
                    Radio(
                      value: e.keys.toList()[0],
                      groupValue: field.value,
                      onChanged: (value) {
                        field.didChange(value);
                      },
                    ),
                    Text(
                        e.values.toList()[0]
                    ),
                  ],
                ),
              ),
            ).toList()
          ),
          if (field.errorText != null) ...[
            const SizedBox(height: 5),
            Text(
              field.errorText!,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ]
      ),
    );
  }
}
