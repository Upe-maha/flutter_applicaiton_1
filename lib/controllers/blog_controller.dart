import 'package:flutter/material.dart';
import '../data/models/blog_model.dart';
import '../data/repositories/blog_repository.dart';

class BlogController {
  final BlogRepository _repo = BlogRepository();

  final ValueNotifier<List<BlogModel>> blogs = ValueNotifier([]);
  final ValueNotifier<List<BlogModel>> filteredBlogs = ValueNotifier([]);

  String selectedCategory = "All";
  String searchQuery = "";

  void _applyFilters() {
    final normalizedQuery = searchQuery.toLowerCase();

    filteredBlogs.value = blogs.value.where((blog) {
      final matchesCategory =
          selectedCategory == "All" || blog.category == selectedCategory;
      final matchesQuery = blog.title.toLowerCase().contains(normalizedQuery);
      return matchesCategory && matchesQuery;
    }).toList();
  }

  Future<void> loadBlogs() async {
    final data = await _repo.fetchBlogs();
    blogs.value = data;
    _applyFilters();
  }

  void filterCategory(String category) {
    selectedCategory = category;
    _applyFilters();
  }

  void search(String query) {
    searchQuery = query;
    _applyFilters();
  }
}
