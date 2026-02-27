part of 'amount_cubit.dart';

class AmountState {
  const AmountState({this.divisions = 100});

  final int divisions;

  int get amount => 100 + divisions * 700;

  AmountState copyWith({int? divisions}) {
    return AmountState(divisions: divisions ?? this.divisions);
  }
}
