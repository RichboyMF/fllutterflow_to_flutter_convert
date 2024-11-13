// lib/presentation/widgets/new_list_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'dart:io';

class NewListBottomSheet extends StatefulWidget {
  const NewListBottomSheet({super.key});

  @override
  State<NewListBottomSheet> createState() => _NewListBottomSheetState();
}

class _NewListBottomSheetState extends State<NewListBottomSheet> {
  final _textController = TextEditingController();
  String? _selectedStyle;
  String? _selectedItem;

  final List<String> _styleOptions = ['Color', 'Photo', 'Custom'];
  List<String> _customImages = []; // This will store image paths later
  final List<Color> _colorOptions = [
    const Color(0xFF4b39ef), // primary
    const Color(0xFF39d2c0), // secondary
    const Color(0xFFee8b60), // tertiary
    const Color(0xFF249689), // success
    const Color(0xFFff5963), // error
    const Color(0xFFf9cf58), // warning
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
  ];

  // Placeholder icons for photo selection
  final List<IconData> _photoOptions = [
    Icons.landscape,
    Icons.beach_access,
    Icons.park,
    Icons.nature,
    Icons.motorcycle,
    Icons.sports_basketball,
    Icons.pets,
    Icons.music_note,
    Icons.restaurant,
    Icons.local_cafe,
    Icons.flight,
    Icons.shopping_bag,
    Icons.weekend,
    Icons.school,
    Icons.sports_esports,
    Icons.outdoor_grill,
  ];

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Widget _buildSelectionArea() {
    switch (_selectedStyle) {
      case 'Color':
        return _buildColorSelection();
      case 'Photo':
        return _buildPhotoSelection();
      case 'Custom':
        return _buildCustomSelection();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildColorSelection() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        itemCount: _colorOptions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedItem = 'color_$index';
                });
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _colorOptions[index],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _selectedItem == 'color_$index'
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: _selectedItem == 'color_$index'
                    ? Icon(
                        Icons.check,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 20,
                      )
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPhotoSelection() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        itemCount: _photoOptions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedItem = 'photo_$index';
                });
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _selectedItem == 'photo_$index'
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Icon(
                  _photoOptions[index],
                  color: _selectedItem == 'photo_$index'
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                  size: 20,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

// Add this new method
  Widget _buildCustomSelection() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        // Add 1 to include the "Add" button
        itemCount: _customImages.length + 1,
        itemBuilder: (context, index) {
          // If it's the last item, show the add button
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: InkWell(
                onTap: () {
                  // TODO: Implement image picker
                  print('Add custom image');
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.primary,
                    size: 24,
                  ),
                ),
              ),
            );
          }

          // Adjust index to account for the add button
          final imageIndex = index - 1;

          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedItem = 'custom_$imageIndex';
                });
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _selectedItem == 'custom_$imageIndex'
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Container(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    child: Icon(
                      Icons.image,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'New list',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            // Title Input with Icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    color: Theme.of(context).colorScheme.primary,
                    size: 34,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Enter list title',
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        border: const UnderlineInputBorder(),
                      ),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),

            // Style Selection Tabs
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: _styleOptions
                    .map((style) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ChoiceChip(
                            label: Text(
                              style,
                              style: TextStyle(
                                color: _selectedStyle == style
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            selected: _selectedStyle == style,
                            onSelected: (selected) {
                              setState(() {
                                _selectedStyle = selected ? style : null;
                                _selectedItem = null;
                              });
                            },
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                            selectedColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                        ))
                    .toList(),
              ),
            ),

            // Selection Area
            _buildSelectionArea(),

            // Action Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'CANCEL',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      // TODO: Handle list creation
                      Navigator.pop(context);
                    },
                    child: Text(
                      'CREATE LIST',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Show bottom sheet function
void showNewListBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const NewListBottomSheet(),
  );
}
