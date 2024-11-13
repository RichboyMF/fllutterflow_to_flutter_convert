// lib/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../widgets/new_list_bottom_sheet.dart';
import '../widgets/add_section_item.dart';
import '../widgets/create_group_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void _showAddSection() {
    showModalBottomSheet(
      context: context,
      builder: (context) => AddSectionItem(
        onAddPressed: () {
          Navigator.pop(context);
          context.showNewListSheet();
        },
        onTaskPressed: () {
          Navigator.pop(context);
          context.showCreateGroup(
            onCreateGroup: (name) {
              context.showSnackBar('Created group: $name');
            },
          );
        },
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Testing Ground'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: _toggleTheme,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Bottom Sheets Section
          _buildTestSection(
            context,
            'Bottom Sheets',
            [
              _buildTestButton(
                context,
                'New List Bottom Sheet',
                () => context.showNewListSheet().then((result) {
                  if (result != null) {
                    context.showSnackBar('Created list with data: $result');
                  }
                }),
              ),
              _buildTestButton(
                context,
                'Add Section Item',
                _showAddSection,
              ),
              _buildTestButton(
                context,
                'Create Group',
                () => context.showCreateGroup(
                  onCreateGroup: (name) {
                    context.showSnackBar('Created group: $name');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddSection(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTestSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children
                  .map((child) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: child,
                      ))
                  .toList(),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTestButton(
    BuildContext context,
    String label,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
