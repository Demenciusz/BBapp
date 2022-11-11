import 'package:bloc/bloc.dart';
import 'package:zaliczenie/cubit/edit/edit_mode_state.dart';

class EditModeCubit extends Cubit<EditModeState> {
  EditModeCubit() : super(EditModeInitial(false));
  bool get editingValue {
    return (state as EditModeInitial).editing;
  }

  Future<void> isEditing() async {
    try {
      if (editingValue) {
        emit(EditModeInitial(false));
      } else {
        emit(EditModeInitial(true));
      }
    } catch (e) {}
  }
}
