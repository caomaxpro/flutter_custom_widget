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
  final Color? titleBackgroundColor;
  final Color? contentBackgroundColor;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    this.onConfirm,
    this.onCancel,
    this.confirmText = 'Delete',
    this.cancelText = 'Cancel',
    this.titleBackgroundColor,
    this.contentBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(color: Colors.black.withOpacity(0.2)),
        ),
        Center(
          child: Container(
            constraints: const BoxConstraints(minWidth: 280, maxWidth: 340),
            decoration: BoxDecoration(
              color: Theme.of(context).dialogBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title with background color
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    decoration: BoxDecoration(
                      color: titleBackgroundColor ?? Colors.blueGrey[50],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Content with background color
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    color: contentBackgroundColor ?? Colors.white,
                    child: Text(
                      content,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Buttons
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: onCancel ?? () => Navigator.of(context).pop(false),
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(cancelText),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: onConfirm ?? () => Navigator.of(context).pop(true),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(confirmText),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
