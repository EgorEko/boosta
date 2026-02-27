import 'package:flutter_bloc/flutter_bloc.dart';

part 'amount_state.dart';

class AmountCubit extends Cubit<AmountState> {
  AmountCubit() : super(const AmountState());

  void increase() {
    if (state.divisions < 7) {
      emit(state.copyWith(divisions: state.divisions + 1));
    }
  }

  void decrease() {
    if (state.divisions > 0) {
      emit(state.copyWith(divisions: state.divisions - 1));
    }
  }
}
