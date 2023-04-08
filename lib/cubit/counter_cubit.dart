import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int counter = 0;

  CounterCubit() : super(CounterInitial());

  void counterIncrease() {
    counter++;
    emit(CounterValueUpdated(counter: counter));
  }

  void counterDecrease() {
    counter--;
    if (counter < 0) counter = 0;
    emit(CounterValueUpdated(counter: counter));
  }

  void counterReset() {
    counter = 0;
    emit(CounterValueUpdated(counter: counter));
  }
}
