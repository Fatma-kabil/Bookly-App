import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'searchview_state.dart';

class SearchviewCubit extends Cubit<SearchviewState> {
  SearchviewCubit() : super(SearchviewInitial());
}
