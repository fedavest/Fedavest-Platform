import 'package:flutter/material.dart';
class ReusableSearchField extends StatelessWidget {
  const ReusableSearchField({super.key, this.image});
final Image? image;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search by name, location, sector...",
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: image?? Icon(Icons.filter),
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}