import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/features/search_feature/presentation/view/widget/book_search_list_view.dart';
import 'package:ketab/features/search_feature/presentation/view/widget/text_field_search_section.dart';
import 'package:ketab/features/search_feature/presentation/view_model/search_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            const SearchSection(),
            SearchListView(
              imageBook:sl<SearchCubit>().searchModel == null ? sl<SearchCubit>().imageBook :sl<SearchCubit>().imageSearchBook ,
              nameBook:sl<SearchCubit>().searchModel == null ? sl<SearchCubit>().nameBook:sl<SearchCubit>().nameSearchBook,
              categoryBook:sl<SearchCubit>().searchModel == null ? sl<SearchCubit>().categoryBook:sl<SearchCubit>().categorySearchBook,
              priceBeforeBook:sl<SearchCubit>().searchModel == null ? sl<SearchCubit>().priceBeforeBook:sl<SearchCubit>().priceBeforeSearchBook,
              priceAfterBook:sl<SearchCubit>().searchModel == null ? sl<SearchCubit>().priceAfterBook:sl<SearchCubit>().priceAfterSearchBook,
              discountBook:sl<SearchCubit>().searchModel == null ? sl<SearchCubit>().discountBook:sl<SearchCubit>().discountSearchBook,
              length:sl<SearchCubit>().searchModel == null ? sl<SearchCubit>().lengthBooks:sl<SearchCubit>().lengthSearchSeller,
              description: sl<SearchCubit>().searchModel == null ? sl<SearchCubit>().description:sl<SearchCubit>().descriptionSearchBook,
              bookId: sl<SearchCubit>().searchModel == null ? sl<SearchCubit>().bookId:sl<SearchCubit>().bookIdSearchBook,
            ),
          ],
        );
      },
    );
  }
}
