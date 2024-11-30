import 'package:ecommerceaudio/product/bloc/auth_manager_bloc/auth_manager_bloc.dart';
import 'package:ecommerceaudio/product/bloc/categories_cubit/categories_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

/// This class is to provide out blocs to mateapp
/// this class is only used in our main.dart file once
final class ProductBlocsInitialization extends MultiBlocProvider {
  ProductBlocsInitialization({required Widget child})
      : super(
          providers: [
            BlocProvider(create: (_) => GetIt.I<AuthManagerBloc>()),
            BlocProvider(create: (_) => GetIt.I<CategoriesCubit>()),
          ],
          child: child,
        );
}
