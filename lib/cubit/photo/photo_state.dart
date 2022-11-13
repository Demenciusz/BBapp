import 'package:equatable/equatable.dart';

abstract class PhotoState extends Equatable {}

class PhotoInitial extends PhotoState {
  PhotoInitial(this.hasPhoto);
  final bool hasPhoto;

  @override
  List<Object?> get props => [hasPhoto];
}
