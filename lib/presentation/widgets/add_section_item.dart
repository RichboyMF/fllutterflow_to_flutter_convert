// lib/presentation/widgets/add_section_item.dart
import 'package:flutter/material.dart';

class AddSectionItem extends StatelessWidget {
  final VoidCallback? onAddPressed;
  final VoidCallback? onTaskPressed;

  const AddSectionItem({
    super.key,
    this.onAddPressed,
    this.onTaskPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onAddPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  // Left section with add icon
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Middle section with text
                  Expanded(
                    child: Text(
                      'New List',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 18,
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                  // Right section with task icon
                  InkWell(
                    onTap: onTaskPressed,
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add_task,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom padding to account for system navigation bar
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}

// Helper method to show the add section item
void showAddSectionItem({
  required BuildContext context,
  VoidCallback? onAddPressed,
  VoidCallback? onTaskPressed,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => AddSectionItem(
      onAddPressed: onAddPressed ?? () => Navigator.pop(context),
      onTaskPressed: onTaskPressed ?? () => Navigator.pop(context),
    ),
  );
}

// Extension method for easier access
extension AddSectionItemExtension on BuildContext {
  void showAddSection({
    VoidCallback? onAddPressed,
    VoidCallback? onTaskPressed,
  }) {
    showAddSectionItem(
      context: this,
      onAddPressed: onAddPressed,
      onTaskPressed: onTaskPressed,
    );
  }
}
