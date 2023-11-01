import 'package:flutter/material.dart';

/// A `DefaultTextField` widget for use in the `SearchAutocomplete` widget.
///
/// This widget is the default implementation of a text field for search and autocomplete.
/// It has built-in features like a dynamic suffix icon based on whether the dropdown is shown or not.
///
/// **Constructor Parameters:**
/// - `controller`: The `TextEditingController` that controls the text field.
/// - `onFieldTap`: A function that fires when the text field is tapped.
/// - `showDropdown`: A boolean flag to control the appearance of the suffix icon.
///
class DefaultTextField extends StatelessWidget {
  /// The `TextEditingController` that controls the text field.
  ///
  /// It holds the current value of the text field and notifies the listeners
  /// when there is a change.
  final TextEditingController controller;

  /// Callback function that fires when the text field is tapped.
  ///
  /// This function is usually used to control the state of the dropdown menu.
  final VoidCallback onFieldTap;

  /// A boolean flag to control the appearance of the suffix icon.
  ///
  /// The suffix icon changes based on whether the dropdown is shown or not.
  final bool showDropdown;

  /// A boolean flag to control the appearance of the suffix icon.
  ///
  /// The suffix icon changes based on whether the dropdown is shown or not.
  final String? hintText;

  /// Creates a `DefaultTextField` widget.
  const DefaultTextField({
    super.key,
    required this.controller,
    required this.onFieldTap,
    required this.showDropdown,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    // Configure text field borders.
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[350]!),
      borderRadius: BorderRadius.circular(40),
      gapPadding: 1,
    );
    final focusedBorder = border.copyWith(
      borderSide: BorderSide(color: Colors.cyan[900]!),
    );

    return TextFormField(
      controller: controller,
      onTap: onFieldTap,
      cursorColor: Colors.cyan,
      style: TextStyle(color: Colors.cyan[900]),
      // Setting up various decoration options for the text field.
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        suffixIcon: _buildSuffixIcon(),
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 20,
          maxWidth: 28,
        ),
        hintText: hintText,
        border: InputBorder.none,
        fillColor: Colors.white,
        filled: true,
        focusedBorder: focusedBorder,
        disabledBorder: border,
        errorBorder: border,
        enabledBorder: border,
        errorMaxLines: 3,
        hintStyle: TextStyle(color: Colors.grey[350]),
      ),
    );
  }

  /// Builds the suffix icon for the text field based on `showDropdown`.
  ///
  /// This function dynamically changes the suffix icon based on the `showDropdown` flag.
  Widget _buildSuffixIcon() {
    final icon = showDropdown
        ? Icons.arrow_drop_down_outlined
        : Icons.arrow_drop_up_outlined;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
      child: Icon(icon),
    );
  }
}
