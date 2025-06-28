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
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(color: Colors.black.withOpacity(0.5)),
        ),
        Center(
          child: Container(
            constraints: const BoxConstraints(minWidth: 320, maxWidth: 400),
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Theme.of(context).dialogBackgroundColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 32,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.warning_rounded, color: Colors.redAccent, size: 48),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      content,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: onCancel ?? () => Navigator.of(context).pop(false),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.grey[800],
                              side: BorderSide(color: Colors.grey[400]!),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: Text(cancelText, style: const TextStyle(fontWeight: FontWeight.w500)),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: onConfirm ?? () => Navigator.of(context).pop(true),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: Text(confirmText, style: const TextStyle(fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
