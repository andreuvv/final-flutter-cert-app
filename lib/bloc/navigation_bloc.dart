import 'package:flutter_bloc/flutter_bloc.dart';

/// Events
abstract class NavigationEvent {}

class NavigateToExplore extends NavigationEvent {}

class NavigateToReading extends NavigationEvent {}

class NavigateToBookmark extends NavigationEvent {}

/// States
abstract class NavigationState {}

class ExploreState extends NavigationState {}

class ReadingState extends NavigationState {}

class BookmarkState extends NavigationState {}

/// BLoC
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(ExploreState()) {
    on<NavigateToExplore>((event, emit) => emit(ExploreState()));
    on<NavigateToReading>((event, emit) => emit(ReadingState()));
    on<NavigateToBookmark>((event, emit) => emit(BookmarkState()));
  }
}
