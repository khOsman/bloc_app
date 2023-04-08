part of 'counter_cubit.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterInitial extends CounterState {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class CounterValueUpdated extends CounterState {
  int counter;

  CounterValueUpdated({required this.counter});
  @override
  List<Object?> get props => [counter];
}
