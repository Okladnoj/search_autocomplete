import 'package:flutter/material.dart';

/// A `DefaultDropDown` widget to display a list of options in a dropdown fashion.
///
/// This widget is the default implementation of a dropdown menu for the
/// `SearchAutocomplete` widget. It displays a list of options and informs
/// when an option is selected.
///
/// **Constructor Parameters:**
/// - `options`: A list of generic type options that will populate the dropdown.
/// - `onSelected`: A function that fires when an item is selected from the dropdown.
/// - `getString`: A function that takes an item of generic type `T` and returns its `String` representation.
///
class DefaultDropDown<T> extends StatelessWidget {
  /// A list of options to be displayed in the dropdown.
  ///
  /// This is usually a list of strings but can be a list of any type
  /// as long as it can be mapped to a string representation.
  final List<T> options;

  /// Callback function that fires when an item is selected from the dropdown.
  ///
  /// This function is invoked with the selected option as its argument.
  final ValueChanged<T> onSelected;

  /// Function to transform an option object to its string representation.
  ///
  /// This function is used to convert the generic type options to string
  /// to be displayed in the dropdown.
  final String Function(T) getString;

  /// Creates a `DefaultDropDown` widget.
  const DefaultDropDown({
    super.key,
    required this.options,
    required this.onSelected,
    required this.getString,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Styling attributes for the dropdown
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        border: Border.all(color: Colors.grey),
      ),
      child: ListView.separated(
        itemCount: options.length,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        // Building each dropdown item
        itemBuilder: (context, index) {
          final option = options[index];
          return GestureDetector(
            onTap: () => onSelected(option),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(bottom: 8, top: 8),
              child: Text(getString(option)),
            ),
          );
        },
        // Divider for separating dropdown items
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 16,
            color: Colors.grey[400],
          );
        },
      ),
    );
  }
}
