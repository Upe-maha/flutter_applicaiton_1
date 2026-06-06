import 'package:flutter/material.dart';
import '../../controllers/blog_controller.dart';
import '../widgets/blog_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_navbar.dart';
import '../widgets/title_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TitleHeader(),

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
                    return const Center(child: Text("No blogs found"));
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: value.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 3 cards per row
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
