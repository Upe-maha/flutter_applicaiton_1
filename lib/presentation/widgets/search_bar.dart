import 'package:flutter/material.dart';
import '../../core/utils/debounce.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onSearch;
  final Debounce debounce = Debounce();

  SearchBarWidget({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search blogs...',
          filled: true,
          fillColor: colorScheme.surfaceContainerHighest.withOpacity(0.55),
          hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: colorScheme.outlineVariant),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: colorScheme.outlineVariant),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
          ),
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
