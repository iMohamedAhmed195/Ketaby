import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/features/search_feature/presentation/view/widget/book_search_list_view.dart';
import 'package:ketab/features/search_feature/presentation/view/widget/text_field_search_section.dart';
import 'package:ketab/features/search_feature/presentation/view_model/search_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, required this.searchCubit});
 final SearchCubit searchCubit;
  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
             SearchSection(searchCubit: searchCubit,),
            SearchListView(
              imageBook:searchCubit.searchModel == null ? searchCubit.imageBook :searchCubit.imageSearchBook ,
              nameBook:searchCubit.searchModel == null ? searchCubit.nameBook:searchCubit.nameSearchBook,
              categoryBook:searchCubit.searchModel == null ? searchCubit.categoryBook:searchCubit.categorySearchBook,
              priceBeforeBook:searchCubit.searchModel == null ? searchCubit.priceBeforeBook:searchCubit.priceBeforeSearchBook,
              priceAfterBook:searchCubit.searchModel == null ? searchCubit.priceAfterBook:searchCubit.priceAfterSearchBook,
              discountBook:searchCubit.searchModel == null ? searchCubit.discountBook:searchCubit.discountSearchBook,
              length:searchCubit.searchModel == null ? searchCubit.lengthBooks:searchCubit.lengthSearchSeller,
              description: searchCubit.searchModel == null ? searchCubit.description:searchCubit.descriptionSearchBook,
              bookId: searchCubit.searchModel == null ? searchCubit.bookId:searchCubit.bookIdSearchBook,
            ),
          ],
        );
      },
    );
  }
}
