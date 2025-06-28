import 'dart:ui';
import 'package:flutter/material.dart';

/// ---
/// # CustomDialog Usage Instructions
///
/// 1. **Import the Widget:**
///    ```dart
///    import 'package:flutter_custom_widget/src/views/custom_dialog.dart';
///    ```
///
/// 2. **Show the Dialog:**
///    ```dart
///    showDialog(
///      context: context,
///      barrierDismissible: false,
///      builder: (context) => CustomDialog(
///        title: 'Delete Item',
///        content: 'Are you sure you want to delete this item?',
///        onConfirm: () {
///          // Handle confirm action
///          Navigator.of(context).pop(true);
///        },
///        onCancel: () {
///          // Handle cancel action
///          Navigator.of(context).pop(false);
///        },
///        confirmText: 'Delete',
///        cancelText: 'Cancel',
///      ),
///    );
///    ```
///
/// 3. **Parameters:**
///    - `title`: The dialog title (required).
///    - `content`: The dialog message (required).
///    - `onConfirm`: Callback for the confirm button (optional).
///    - `onCancel`: Callback for the cancel button (optional).
///    - `confirmText`: Text for the confirm button (default: 'Delete').
///    - `cancelText`: Text for the cancel button (default: 'Cancel').
///
/// ---

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final String confirmText;
  final String cancelText;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    this.onConfirm,
    this.onCancel,
    this.confirmText = 'Delete',
    this.cancelText = 'Cancel',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(color: Colors.black.withOpacity(0.7)),
        ),
        Center(
          child: AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: onCancel ?? () => Navigator.of(context).pop(false),
                child: Text(cancelText),
              ),
              TextButton(
                onPressed: onConfirm ?? () => Navigator.of(context).pop(true),
                child: Text(
                  confirmText,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
