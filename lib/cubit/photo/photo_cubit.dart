import 'package:bloc/bloc.dart';
import 'package:zaliczenie/cubit/photo/photo_state.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit() : super(PhotoInitial(false));
  bool get hasPhotoValue {
    return (state as PhotoInitial).hasPhoto;
  }

  void changeBool() async {
    if (hasPhotoValue) {
      emit(PhotoInitial(false));
    } else {
      emit(PhotoInitial(true));
    }
  }

  void newBool() async {
    emit(PhotoInitial(false));
  }
}
