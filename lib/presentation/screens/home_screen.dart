import 'package:flutter/material.dart';
import '../../controllers/blog_controller.dart';
import '../widgets/blog_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_navbar.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const HomeScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BlogController controller = BlogController();

  @override
  void initState() {
    super.initState();
    controller.loadBlogs();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        title: const Text(
          'My Blog App',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: widget.onToggleTheme,
            tooltip: widget.isDarkMode
                ? 'Switch to light mode'
                : 'Switch to dark mode',
            icon: Icon(
              widget.isDarkMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SearchBarWidget(onSearch: controller.search),
            CategoryNavbar(
              selected: controller.selectedCategory,
              onChanged: controller.filterCategory,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: controller.filteredBlogs,
                builder: (context, value, child) {
                  if (value.isEmpty) {
                    return const Center(child: Text('No blogs found'));
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: value.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.75,
                        ),
                    itemBuilder: (context, index) {
                      return BlogCard(blog: value[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
