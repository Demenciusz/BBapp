import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(HomePageState());
  void homePage() => emit(HomePageState());
  void profilePage() => emit(ProfilePageState());
  void chatPage() => emit(ChatPageState());
  void dicePage() => emit(DicePageState());
  void charactersPage() => emit(CharactersPageState());
}
