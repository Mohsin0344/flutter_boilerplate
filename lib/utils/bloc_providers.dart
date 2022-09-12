import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth_example_cubit/auth_cubit.dart';
import '../cubits/sale_exmple_cubit/example_cubit.dart';
import '../data/repositories/auth_repository/auth_repository.dart';
import '../data/repositories/example_repository/example_repository.dart';

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(
        authRepository: AuthRepository(),
      ),
    ),
    BlocProvider<ExampleCubit>(
      create: (context) => ExampleCubit(
        exampleRepository: ExampleRepository(),
      ),
    ),
  ];
}