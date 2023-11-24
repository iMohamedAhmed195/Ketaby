import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/features/cart_feature/data/cart_model/delete_item_from_cart.dart';
import 'package:ketab/features/cart_feature/data/cart_model/get_cart_data_model.dart';
import 'package:ketab/features/cart_feature/data/repo/cart_repo.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());

  static CartCubit get(context)=> BlocProvider.of(context);

  final CartRepo cartRepo;

  /* get all cart*/

  GetAllCartModel? getAllCartModel;

  List<String> itemProductImage =[] ;
  List<String> itemProductName=[] ;
  List<String> itemProductPrice =[];
  List<int> itemId=[] ;
  List<num> itemProductPriceAfterDiscount=[] ;
  List<num> itemProductDiscount =[];
  List<num> itemQuantity =[];
  List<num> itemTotal =[];
  int lengthCartBooks = 0 ;
  num totalPrice = 0;
  getCartData(){
    for(int i = 0 ; i < getAllCartModel!.data!.cartItems!.length ; i++){
      itemProductImage.add(getAllCartModel!.data!.cartItems![i].itemProductImage!);
      itemId.add(getAllCartModel!.data!.cartItems![i].itemId!);
      itemProductName.add(getAllCartModel!.data!.cartItems![i].itemProductName!);
      itemProductPrice.add(getAllCartModel!.data!.cartItems![i].itemProductPrice!);
      itemProductPriceAfterDiscount.add(getAllCartModel!.data!.cartItems![i].itemProductPriceAfterDiscount!.ceilToDouble());
      itemProductDiscount.add(getAllCartModel!.data!.cartItems![i].itemProductDiscount!);
      itemQuantity.add(getAllCartModel!.data!.cartItems![i].itemQuantity!);
      itemTotal.add(getAllCartModel!.data!.cartItems![i].itemTotal!.ceilToDouble());
      totalPrice+=getAllCartModel!.data!.cartItems![i].itemProductPriceAfterDiscount!.ceilToDouble();
    }
    print(itemId);
    lengthCartBooks = getAllCartModel!.data!.cartItems!.length;

  }
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



  DeleteItemCartModel? deleteItemCartModel;

  List<String> itemProductImageAfterDelete =[] ;
  List<String> itemProductNameAfterDelete=[] ;
  List<String> itemProductPriceAfterDelete =[];
  List<int> itemIdAfterDelete=[] ;
  List<num> itemProductPriceAfterDiscountAfterDelete=[] ;
  List<num> itemProductDiscountAfterDelete =[];
  List<num> itemQuantityAfterDelete =[];
  List<num> itemTotalAfterDelete =[];
  int lengthCartBooksAfterDelete = 0 ;
  num totalPriceAfterDelete = 0;

  getCartDataAfterDelete(){
    itemIdAfterDelete= [];
    itemProductImageAfterDelete= [];
    itemProductNameAfterDelete= [];
    itemProductPriceAfterDelete= [];
    itemProductPriceAfterDiscountAfterDelete= [];
    itemProductDiscountAfterDelete= [];
    itemQuantityAfterDelete= [];
    itemTotalAfterDelete= [];
    lengthCartBooksAfterDelete =0 ;
    totalPriceAfterDelete = 0;
    for(int i = 0 ; i < deleteItemCartModel!.data!.cartItems!.length ; i++){
      itemProductImageAfterDelete.add(deleteItemCartModel!.data!.cartItems![i].itemProductImage!);
      itemIdAfterDelete.add(deleteItemCartModel!.data!.cartItems![i].itemId!);
      itemProductNameAfterDelete.add(deleteItemCartModel!.data!.cartItems![i].itemProductName!);
      itemProductPriceAfterDelete.add(deleteItemCartModel!.data!.cartItems![i].itemProductPrice!);
      itemProductPriceAfterDiscountAfterDelete.add(deleteItemCartModel!.data!.cartItems![i].itemProductPriceAfterDiscount!.ceilToDouble());
      itemProductDiscountAfterDelete.add(deleteItemCartModel!.data!.cartItems![i].itemProductDiscount!);
      itemQuantityAfterDelete.add(deleteItemCartModel!.data!.cartItems![i].itemQuantity!);
      itemTotalAfterDelete.add(deleteItemCartModel!.data!.cartItems![i].itemTotal!.ceilToDouble());
      totalPriceAfterDelete+=deleteItemCartModel!.data!.cartItems![i].itemProductPriceAfterDiscount!.ceilToDouble();
    }
    lengthCartBooksAfterDelete = deleteItemCartModel!.data!.cartItems!.length;

  }


  deleteItemFromCart(int index)async{
    var result;
    if(getAllCartModel?.data !=null){
       result = await cartRepo.deleteItemFromCart(itemId[index]);
    }else if(getAllCartModel?.data ==null){
       result = await cartRepo.deleteItemFromCart(itemIdAfterDelete[index]);
    }

    result.fold((failure) {
      emit(DeleteFromCartError());
    }, (deleteItemCartModel) {
      getAllCartModel?.data = null;
      this.deleteItemCartModel =deleteItemCartModel ;
      getCartDataAfterDelete();
      emit(DeleteFromCartSuccess(deleteItemCartModel));
    });
  }

  changeNumberOfBooks(bool isIncrease , int index){
    if(isIncrease == true){
      itemQuantity[index] += 1 ;
      itemTotal[index] +=itemProductPriceAfterDiscount[index].ceilToDouble();

      totalPrice +=itemProductPriceAfterDiscount[index].ceilToDouble() ;
        emit(ChangeNumberOfBooksInCart());
    }
    else if(isIncrease == false){
      if(itemQuantity[index] > 1 ){
        itemQuantity[index] -= 1 ;
        itemTotal[index] -=itemProductPriceAfterDiscount[index].ceilToDouble();
         totalPrice -=itemProductPriceAfterDiscount[index].ceilToDouble() ;
        emit(ChangeNumberOfBooksInCart());
      }
        }

  }


}
