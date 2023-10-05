import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/features/search_feature/data/repos/search_repo.dart';
import 'package:ketab/features/search_feature/data/search_model/get_all_books.dart';
import 'package:ketab/features/search_feature/data/search_model/search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  final SearchRepo searchRepo;

  /*get all  books*/
  GetAllBooksModel? getAllBooksModel;
  Future<void> getAllBooks() async {
    emit(GetAllBooksLoading());

    var result = await searchRepo.getAllBooks();


    result.fold((failure) {
      emit(GetAllBooksError());
    }, (getAllBooksModel) {
      this.getAllBooksModel =getAllBooksModel ;
      getAllBook();
      emit(GetAllBooksSuccess(getAllBooksModel));
    });
  }
  List<String> imageBook =[] ;
  List<String> nameBook=[] ;
  List<String> categoryBook =[];
  List<String> priceBeforeBook =[];
  List<num> priceAfterBook=[] ;
  List<num> discountBook =[];
  int lengthBooks = 0 ;
  getAllBook(){
    for(int i = 0 ; i < getAllBooksModel!.data!.products!.length ; i++){
      imageBook.add(getAllBooksModel!.data!.products![i].image!);
      nameBook.add(getAllBooksModel!.data!.products![i].name!);
      categoryBook.add(getAllBooksModel!.data!.products![i].category!);
      priceBeforeBook.add(getAllBooksModel!.data!.products![i].price!);
      priceAfterBook.add(getAllBooksModel!.data!.products![i].priceAfterDiscount!);
      discountBook.add(getAllBooksModel!.data!.products![i].discount!);
    }
    lengthBooks = getAllBooksModel!.data!.products!.length;

  }


  /*Search for book*/

  var searchController = TextEditingController();
  var searchKey = GlobalKey<FormState>();

  SearchModel? searchModel ;
  Future<void> getSearchInBooks() async {
    emit(SearchBooksLoading());

    var result = await searchRepo.getSearchInBooks(searchController.text);

    result.fold((failure) {
      emit(SearchBooksError());
    }, (searchModel) {
      this.searchModel=searchModel;
      getSearchBook();
      emit(SearchBooksSuccess(searchModel));
    });
  }

  List<String> imageSearchBook =[] ;
  List<String> nameSearchBook=[] ;
  List<String> categorySearchBook =[];
  List<String> priceBeforeSearchBook =[];
  List<num> priceAfterSearchBook=[] ;
  List<num> discountSearchBook =[];
  int lengthSearchSeller = 0 ;
  getSearchBook(){
    for(int i = 0 ; i < searchModel!.data!.products!.length ; i++){
      imageSearchBook.add(searchModel!.data!.products![i].image!);
      nameSearchBook.add(searchModel!.data!.products![i].name!);
      categorySearchBook.add(searchModel!.data!.products![i].category!);
      priceBeforeSearchBook.add(searchModel!.data!.products![i].price!);
      priceAfterSearchBook.add(searchModel!.data!.products![i].priceAfterDiscount!);
      discountSearchBook.add(searchModel!.data!.products![i].discount!);
    }
    lengthSearchSeller = searchModel!.data!.products!.length;
  }
}
