import 'package:flutter/material.dart';

/// A function type definition for creating a dropdown widget.
///
/// This function type expects a list of options, and a callback function to
/// notify when an option is selected. The generic type `T` is used to denote
/// the type of the options in the dropdown.
///
/// **Parameters:**
/// - `options`: A list of type `T` which contains the dropdown options.
/// - `onSelected`: A callback function of type `ValueChanged<T>` which gets
///     triggered when an option is selected.
/// - `controller`: The `TextEditingController` for the text **search field**.
///
/// **Returns:**
/// - `Widget`: The dropdown widget created using the provided parameters.
///
typedef DropDownWithArgs<T> = Widget Function(
  List<T> options,
  ValueChanged<T> onSelected,
  TextEditingController controller,
);

/// A function type definition for creating a text field widget.
///
/// This function type expects a `TextEditingController`, a callback function
/// for tap events on the text field, and a boolean flag to show or hide the
/// dropdown.
///
/// **Parameters:**
/// - `controller`: The `TextEditingController` for the text field.
/// - `onFieldTap`: A callback function of type `VoidCallback` which gets
///     triggered when the text field is tapped.
/// - `showDropdown`: A boolean flag to indicate whether to show the dropdown.
///
/// **Returns:**
/// - `Widget`: The text field widget created using the provided parameters.
///
typedef TextFieldWithArgs = Widget Function(
  TextEditingController controller,
  VoidCallback onFieldTap,
  bool showDropdown,
  ValueSetter<bool> close,
);
