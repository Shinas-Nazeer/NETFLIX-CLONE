part of 'serach_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.initialize() = Initialize;
  const factory SearchEvent.searchMovie({required String moieQuery}) =
      SearchMovie;
}