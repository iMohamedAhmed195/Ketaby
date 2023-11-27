import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/features/search_feature/presentation/view_model/search_cubit.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key, required this.searchCubit});

  final SearchCubit searchCubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit , SearchState>(
      listener: (BuildContext context,  state) {},
      builder: (BuildContext context, state) {
        return Form(
          key: searchCubit.searchKey,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(14)),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter name of book';
                        }
                        return null;
                      },
                      controller: searchCubit.searchController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                        enabledBorder:
                            const OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            const OutlineInputBorder(borderSide: BorderSide.none),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 24.w,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            onPressed: () {
                              if(sl<SearchCubit>().searchKey.currentState!.validate()){
                                sl<SearchCubit>().getSearchInBooks();
                              }
                            },

                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                            ))),
                  ))
            ],
          ),
        );
      },
    );
  }
}
