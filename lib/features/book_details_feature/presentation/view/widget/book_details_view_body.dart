import 'package:flutter/material.dart';
import 'package:ketab/features/book_details_feature/presentation/view/widget/description_section.dart';
import 'package:ketab/features/book_details_feature/presentation/view/widget/details_image_section.dart';
import 'package:ketab/features/book_details_feature/presentation/view/widget/name_price_text.dart';



class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.description, required this.image, required this.nameBook, required this.category, required this.priceBefore, required this.priceAfter, required this.bookId});
  final String description;
  final String image ;
  final int bookId ;
  final String nameBook;
  final String category;
  final String priceBefore;
  final String priceAfter;
  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child: Column(
        children: [
          DetailsImageSection(image: image, bookId: bookId,),
          NameAndPriceBook(nameBook:nameBook, category: category, priceBefore: priceBefore, priceAfter: priceAfter,),
          DescriptionSection(description: description,),

        ],
      ),
    );
  }
}
