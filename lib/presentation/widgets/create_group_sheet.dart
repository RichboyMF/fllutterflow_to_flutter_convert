// lib/presentation/widgets/create_group_dialog.dart
import 'package:flutter/material.dart';

class CreateGroupDialog extends StatefulWidget {
  final void Function(String groupName)? onCreateGroup;

  const CreateGroupDialog({
    super.key,
    this.onCreateGroup,
  });

  @override
  State<CreateGroupDialog> createState() => _CreateGroupDialogState();
}

class _CreateGroupDialogState extends State<CreateGroupDialog> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onCreateGroup?.call(_textController.text.trim());
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Create a group',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      letterSpacing: 0,
                    ),
              ),
              const SizedBox(height: 24),

              // Text Input
              TextFormField(
                controller: _textController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  labelText: 'Name this group',
                  hintText: 'Enter group name',
                  isDense: true,
                  border: const UnderlineInputBorder(),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      letterSpacing: 0,
                    ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a group name';
                  }
                  return null;
                },
                onFieldSubmitted: (_) => _handleSubmit(),
              ),
              const SizedBox(height: 24),

              // Action Buttons
              Row(
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
                    onPressed: _handleSubmit,
                    child: Text(
                      'CREATE GROUP',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper function to show the dialog
Future<void> showCreateGroupDialog(
  BuildContext context, {
  void Function(String groupName)? onCreateGroup,
}) {
  return showDialog(
    context: context,
    builder: (context) => CreateGroupDialog(
      onCreateGroup: onCreateGroup,
    ),
  );
}

// Extension method for easier access
extension CreateGroupExtension on BuildContext {
  Future<void> showCreateGroup({
    void Function(String groupName)? onCreateGroup,
  }) {
    return showCreateGroupDialog(
      this,
      onCreateGroup: onCreateGroup,
    );
  }
}
