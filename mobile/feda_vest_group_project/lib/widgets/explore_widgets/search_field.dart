import 'package:feda_vest_group_project/utils/utils.dart';
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
        contentPadding: EdgeInsets.symmetric(vertical: Utils.h(14)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Utils.r(12)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}