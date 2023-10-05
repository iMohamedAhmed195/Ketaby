import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/features/cart_feature/data/cart_model/get_cart_data_model.dart';
import 'package:ketab/features/cart_feature/data/repo/cart_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());

  static CartCubit get(context)=> BlocProvider.of(context);

  final CartRepo cartRepo;

  /* get all cart*/

  GetAllCartModel? getAllCartModel;
  Future<void> getAllCart() async {
    emit(GetAllCartLoading());

    var result = await cartRepo.getAllCart();

    result.fold((failure) {
      emit(GetAllCartError());
    }, (getAllCartModel) {
      this.getAllCartModel =getAllCartModel ;
      getCartData();
      emit(GetAllCartSuccess(getAllCartModel));
    });
  }
  List<String> itemProductImage =[] ;
  List<String> itemProductName=[] ;

  List<String> itemProductPrice =[];
  List<num> itemProductPriceAfterDiscount=[] ;
  List<num> itemProductDiscount =[];
  int lengthCartBooks = 0 ;
  String totalPrice = '' ;
  getCartData(){
    for(int i = 0 ; i < getAllCartModel!.data!.cartItems!.length ; i++){
      itemProductImage.add(getAllCartModel!.data!.cartItems![i].itemProductImage!);
      itemProductName.add(getAllCartModel!.data!.cartItems![i].itemProductName!);
      itemProductPrice.add(getAllCartModel!.data!.cartItems![i].itemProductPrice!);
      itemProductPriceAfterDiscount.add(getAllCartModel!.data!.cartItems![i].itemProductPriceAfterDiscount!);
      itemProductDiscount.add(getAllCartModel!.data!.cartItems![i].itemProductDiscount!);
    }
    totalPrice =getAllCartModel!.data!.total!;
    lengthCartBooks = getAllCartModel!.data!.cartItems!.length;

  }
}
