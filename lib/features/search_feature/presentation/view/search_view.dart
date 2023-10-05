import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/features/search_feature/presentation/view/widget/search_view_body.dart';
import 'package:ketab/features/search_feature/presentation/view_model/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context)=>sl<SearchCubit>()..getAllBooks(),
    child: const SearchViewBody());
  }
}
