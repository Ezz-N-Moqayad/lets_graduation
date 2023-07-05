import 'package:flutter/material.dart';

// ignore: camel_case_types
class widget_container_page_view extends StatelessWidget {
  const widget_container_page_view({
    Key? key,
    required this.selected,
    required this.title,
  }) : super(key: key);

  final bool selected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: selected ? const Color(0xFF57CA85) : Colors.grey.shade400,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }
}
