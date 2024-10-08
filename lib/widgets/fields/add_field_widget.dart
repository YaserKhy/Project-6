import 'package:flutter/material.dart';
import 'package:project6/extensions/screen_size.dart';

class AddFieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const AddFieldWidget({super.key,required this.label,required this.hint,required this.controller, required this.validator});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white)),
        const SizedBox(height: 15),
        SizedBox(
          width: context.getWidth() / 0.5,
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            controller: controller,
            decoration: InputDecoration(
                hintStyle:
                    const TextStyle(color: Color.fromARGB(152, 255, 255, 255)),
                hintText: hint,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                filled: true,
                fillColor: const Color(0xff383740)),
                validator: validator,
          ),
        )
      ],
    );
  }
}
