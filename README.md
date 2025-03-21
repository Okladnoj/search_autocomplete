# Search Autocomplete Flutter Package
![Video](assets/record.gif)

<a href="https://www.buymeacoffee.com/okji" target="_blank">
  <img src="https://cdn.buymeacoffee.com/buttons/v2/default-violet.png" alt="Buy Me A Pizza" style="max-width: 160px;"/>
</a>

## Overview

This Flutter package provides a `SearchAutocomplete` widget for implementing autocomplete functionality with a dropdown menu. The package offers extensive customization options for the search field, dropdown items, and includes hooks for search logic.

## Installation

To use this package, add `search_autocomplete` as a dependency in your `pubspec.yaml` file:

```dart
dependencies:
  search_autocomplete: ^1.0.0
```

## Features

- Customizable search field
- Customizable dropdown items
- Hooks for search logic
- Initial value support
- Placeholder text support
- Widget to display when the dropdown is empty

### State Management Compatibility
- Designed to work seamlessly with Cubit/Bloc and other orthodox state managers. Since the list updating logic resides higher up in the widget tree, it allows for a clean separation between UI and logic.


## Usage

Here's a quick example to show how to use `SearchAutocomplete` widget:

```dart
SearchAutocomplete<String>(
  options: ['Apple', 'Banana', 'Orange'],
  initValue: 'Apple',
  onSearch: (query) {
    // Implement your search logic here
  },
  onSelected: (item) {
    // Handle selection
  },
  getString: (item) => item,
)
```

### Customization

Both the search field and the dropdown items can be customized using `fieldBuilder` and `dropDownBuilder` respectively.

```dart
SearchAutocomplete<String>(
  // ...
  fieldBuilder: (controller, onFieldTap, showDropdown) {
    return TextFormField(
      // Customizations here
    );
  },
  dropDownBuilder: (options, onSelected) {
    return ListView.builder(
      // Customizations here
    );
  },
)
```

## License

This package is licensed under the MIT License. See the [LICENSE.md](LICENSE.md) file for details.
