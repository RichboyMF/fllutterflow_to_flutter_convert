// lib/presentation/widgets/new_list_bottom_sheet.dart
import 'package:flutter/material.dart';

class NewListBottomSheet extends StatefulWidget {
  const NewListBottomSheet({super.key});

  @override
  State<NewListBottomSheet> createState() => _NewListBottomSheetState();
}

class _NewListBottomSheetState extends State<NewListBottomSheet> {
  final _textController = TextEditingController();
  String? _selectedStyle;
  String? _selectedItem;

  // Keep tab options minimal
  final List<String> _styleOptions = ['Color', 'Photo', 'Custom'];

  // Extended color options to demonstrate scrolling
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
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
  ];

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
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

            // Static Style Tabs
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
                                _selectedItem =
                                    null; // Reset selection when changing styles
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

            // Scrollable Selection Area
            // Scrollable Selection Area
            if (_selectedStyle == 'Color')
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: 50, // Height for a single row
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
                              _selectedItem = index.toString();
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: _colorOptions[index],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _selectedItem == index.toString()
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: _selectedItem == index.toString()
                                ? Icon(
                                    Icons.check,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    size: 20,
                                  )
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

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
