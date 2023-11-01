import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../cubit_imitator/cubit_imitator.dart';

part 'search_state.dart';

class SearchCubit extends CubitImitator<SearchState> {
  SearchCubit() : super(const SearchState());

  void init() {
    const list = Constants.collocations;
    emit(state.copyWith(
      list: list,
      listFiltered: list,
    ));
  }

  void select(String value) {
    emit(state.copyWith(current: value));
  }

  void search(String value) {
    final listFiltered = state.list.where((text) {
      return text.toLowerCase().startsWith(value.toLowerCase());
    });

    emit(state.copyWith(listFiltered: [...listFiltered]));
  }
}
