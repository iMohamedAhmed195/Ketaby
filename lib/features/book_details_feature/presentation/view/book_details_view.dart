import 'package:flutter/material.dart';
import 'package:ketab/features/book_details_feature/presentation/view/widget/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView(
      {super.key,
      required this.description,
      required this.image,
      required this.nameBook,
      required this.category,
      required this.priceBefore,
      required this.priceAfter, required this.bookId});
  final String description;
  final int bookId;
  final String image;
  final String nameBook;
  final String category;
  final String priceBefore;
  final String priceAfter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BookDetailsViewBody(
      description: description,
      image: image,
      nameBook: nameBook,
      category: category,
      priceBefore: priceBefore,
      priceAfter: priceAfter,
          bookId: bookId,
    ));
  }
}
