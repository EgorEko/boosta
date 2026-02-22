import 'package:flutter_bloc/flutter_bloc.dart';

class FormCubit extends Cubit<bool> {
  FormCubit() : super(false);

  bool _openedOnce = false;

  void tryOpenForm() {
    if (_openedOnce) return;
    _openedOnce = true;
    emit(true);
  }

  void formClosed() {
    emit(false);
  }
}
