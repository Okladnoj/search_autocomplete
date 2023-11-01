import 'package:example/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:search_autocomplete/search_autocomplete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _cubit = SearchCubit();

  @override
  void initState() {
    super.initState();
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Example')),
      body: StreamBuilder<SearchState>(
          stream: _cubit.stream,
          builder: (context, snapshot) {
            final state = snapshot.data ?? _cubit.state;

            return _buildContent(state);
          }),
    );
  }

  Widget _buildContent(SearchState state) {
    return ListView(
      children: [
        const SizedBox(height: 120),
        _buildDefaultField(state),
        const SizedBox(height: 120),
        _buildCustomizeField(state),
        const SizedBox(height: 800),
      ],
    );
  }

  Widget _buildDefaultField(SearchState state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAutocomplete<String>(
        options: state.listFiltered,
        initValue: state.current,
        onSearch: _cubit.search,
        onSelected: _cubit.select,
        getString: (value) => value,
        hintText: 'Default search...',
      ),
    );
  }

  Widget _buildCustomizeField(SearchState state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAutocomplete<String>(
        options: state.listFiltered,
        initValue: state.current,
        onSearch: _cubit.search,
        onSelected: _cubit.select,
        getString: (value) => value,
        fieldBuilder: (controller, onFieldTap, showDropdown) {
          return TextFormField(
            controller: controller,
            onTap: onFieldTap,
            decoration: const InputDecoration(
              hintText: 'Custom search...',
            ),
          );
        },
        dropDownBuilder: (options, onSelected) {
          return ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options[index];
              return ListTile(
                leading: const Icon(Icons.star),
                title: Text(option),
                onTap: () => onSelected(option),
              );
            },
          );
        },
      ),
    );
  }
}
