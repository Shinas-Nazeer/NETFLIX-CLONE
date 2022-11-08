import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/failures/main_failures.dart';
import '../../domain/downloads/download_services.dart';
import '../../domain/downloads/models/downloads.dart';
import '../../domain/search/models/search_response.dart';
import '../../domain/search/search_services.dart';

part 'serach_event.dart';
part 'serach_state.dart';
part 'serach_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final DownloadServices _downloadServices;
  final SearchService _searchService;
  SearchBloc(this._downloadServices, this._searchService)
      : super(SearchState.initial()) {
    // Idle State----------------------------------------------------------
    on<Initialize>((event, emit) async {
      if (state.idealList.isNotEmpty) {
        emit(
          SearchState(
            searchResultList: [],
            idealList: state.idealList,
            isLoading: false,
            isError: false,
          ),
        );
        return;
      }
      emit(
        const SearchState(
          searchResultList: [],
          idealList: [],
          isLoading: true,
          isError: false,
        ),
      );
      // get Trending
      final _result = await _downloadServices.getDownloadImages();
      final _state = _result.fold(
        (MainFailures failure) {
          return const SearchState(
            searchResultList: [],
            idealList: [],
            isLoading: false,
            isError: true,
          );
        },
        (List<Downloads> success) {
          return SearchState(
            searchResultList: [],
            idealList: success,
            isLoading: false,
            isError: false,
          );
        },
      );

      // Show to UI
      emit(_state);
    });

    // Search Result State----------------------------------------------------------
    on<SearchMovie>((event, emit) async {
      // Call Search movie Api

      emit(
        const SearchState(
          searchResultList: [],
          idealList: [],
          isLoading: true,
          isError: false,
        ),
      );

      final _result =
          await _searchService.searchMovie(movieQuery: event.moieQuery);

      final _state = _result.fold(
        (MainFailures failures) => const SearchState(
          searchResultList: [],
          idealList: [],
          isLoading: false,
          isError: true,
        ),
        (SearchResponse success) => SearchState(
          searchResultList: success.results,
          idealList: [],
          isLoading: false,
          isError: false,
        ),
      );
      // show to UI
      emit(_state);
    });
  }
}