import 'package:flutter/material.dart';
import '../../core/utils/debounce.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onSearch;
  final Debounce debounce = Debounce();

  SearchBarWidget({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        decoration: const InputDecoration(
          hintText: "Search blogs...",
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          debounce.run(() {
            onSearch(value);
          }, 1000); // 1 sec delay
        },
      ),
    );
  }
}
