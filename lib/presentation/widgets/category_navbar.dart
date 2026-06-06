import 'package:flutter/material.dart';

class CategoryNavbar extends StatefulWidget {
  final String selected;
  final Function(String) onChanged;

  const CategoryNavbar({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  State<CategoryNavbar> createState() => _CategoryNavbarState();
}

class _CategoryNavbarState extends State<CategoryNavbar> {
  int _hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    final categories = ["All", "Travel", "News", "Vlog"];

    return SizedBox(
      height: 64,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected = widget.selected == cat;
          final isHovered = _hoveredIndex == index;

          final backgroundColor = isSelected
              ? Colors.black
              : isHovered
              ? Colors.grey.shade300
              : Colors.grey.shade200;

          final textColor = isSelected ? Colors.white : Colors.black87;

          return MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setState(() => _hoveredIndex = index),
            onExit: (_) => setState(() => _hoveredIndex = -1),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () => widget.onChanged(cat),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 160),
                  curve: Curves.easeInOut,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: isSelected ? Colors.black : Colors.grey.shade300,
                    ),
                    boxShadow: [
                      if (isSelected)
                        BoxShadow(
                          color: const Color.fromRGBO(0, 0, 0, 0.18),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      if (isHovered && !isSelected)
                        BoxShadow(
                          color: const Color.fromRGBO(0, 0, 0, 0.06),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                    ],
                  ),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 160),
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    child: Text(cat, textAlign: TextAlign.center),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
