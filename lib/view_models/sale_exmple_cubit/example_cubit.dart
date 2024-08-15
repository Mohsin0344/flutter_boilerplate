import 'package:bloc/bloc.dart';

import '../../data/repositories/example_repository/example_repository.dart';
import 'example_cubit_state.dart';

class ExampleCubit extends Cubit<ExampleCubitState> {
  final ExampleRepositoryAbstract exampleRepository;

  ExampleCubit({required this.exampleRepository})
      : super(ExampleCubitInitialState());

  void getExampleValues(bool throwError) async {
    try {
      emit(ExampleCubitLoadingState());
      final List<String>? exampleValues =
          await exampleRepository.getExampleValues(throwError);
      if (exampleValues != null) {
        emit(ExampleCubitLoadedState(exampleValues: exampleValues));
      } else {
        emit(ExampleCubitErrorState());
      }
    } catch (e) {
      emit(ExampleCubitErrorState());
    }
  }
}
