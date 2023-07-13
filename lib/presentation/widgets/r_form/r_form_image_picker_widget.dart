import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RFormImagePickerWidget extends StatefulWidget {
  late TextInputType? keyboardType;
  late String? Function(XFile?)? validator = (_) => null;
  late String? hintText;
  late Widget? suffixIcon;
  late void Function(XFile?)? onSaved;

  RFormImagePickerWidget({
    Key? key,
    this.hintText,
    this.keyboardType,
    this.onSaved,
    this.validator,
    this.suffixIcon
  }) : super(key: key);

  @override
  State<RFormImagePickerWidget> createState() => _RFormImagePickerWidgetState();
}

class _RFormImagePickerWidgetState extends State<RFormImagePickerWidget> {
  final ImagePicker picker = ImagePicker();
  final TextEditingController _controller = TextEditingController();
  late XFile? _picture = null;

  void _showOptionSelectPicture() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 100,
          width: double.infinity,
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 100,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => setState(() async {
                    _picture = await picker.pickImage(source: ImageSource.camera);
                    _controller.text = _picture!.name;
                    Navigator.pop(context);
                  }),
                  child: const Column(
                    children: [
                      Icon(Icons.camera_alt),
                      Text("Camera")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() async {
                    _picture = await picker.pickImage(source: ImageSource.gallery);
                    _controller.text = _picture!.name;
                    Navigator.pop(context);
                  }),
                  child: const Column(
                    children: [
                      Icon(Icons.image),
                      Text("Gallery")
                    ],
                  ),
                )
              ],
            ),
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormField<XFile?>(
      onSaved: (_) => widget.onSaved!(_picture),
      validator: (_) {
        if (_picture != null) {
          return null;
        }
        return widget.validator!(_picture);
      },
      builder: (field) => TextFormField(
        onTap: () {
          _showOptionSelectPicture();
        },
        readOnly: true,
        controller: _controller,
        cursorColor: Colors.black54,
        decoration: InputDecoration(
            suffixIcon: widget.suffixIcon ?? Icon(Icons.camera_alt),
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black54,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black54,
              ),
              borderRadius: BorderRadius.circular(14),
            )
        ),
      ),
    );
  }
}
