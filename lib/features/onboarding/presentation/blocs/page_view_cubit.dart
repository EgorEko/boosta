import 'package:flutter_bloc/flutter_bloc.dart';

class PageViewCubit extends Cubit<int> {
  PageViewCubit() : super(0);

  void setCurrentPageIndex(int num) {
    emit(num);
  }
}
