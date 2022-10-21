import 'package:book_shop/models/ny_times_book_repository.dart';
import 'package:book_shop/widgets/link_text.dart';
import 'package:book_shop/widgets/rich_text.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    item.bookImage,
                    height: MediaQuery.of(context).size.width * 0.8,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                item.description,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichTextWidget(
                keyText: "Author",
                valueText: item.author,
              ),
              const SizedBox(
                height: 3,
              ),
              RichTextWidget(
                keyText: "ISBN",
                valueText: item.publisher,
              ),
              const SizedBox(
                height: 3,
              ),
              RichTextWidget(
                keyText: "Publisher",
                valueText: item.primaryIsbn10,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Buy Now",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              ...List.generate(item.buyLinks.length, (index) => LinkText(uri: item.buyLinks[index].url, title: item.buyLinks[index].name)),
            ],
          ),
        ),
      ),
    );
  }

  final Book item;
}
