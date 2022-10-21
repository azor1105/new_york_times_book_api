import 'package:book_shop/models/ny_times_book_repository.dart';
import 'package:book_shop/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:book_shop/models/ny_times_book_repository.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BookCatalogScreen extends StatelessWidget {
  const BookCatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getNyTimesBookRepository(),
        builder: (context, AsyncSnapshot<NyTimesBookRepository> snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        "assets/images/NY_times_logo.png",
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),
                      GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        itemCount: snapshot.data!.results.books.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 2 / 3,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InfoScreen(
                                    item: snapshot.data!.results.books[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 5,
                                    blurRadius: 5,
                                    offset: const Offset(1, 3),
                                    color: Colors.grey.shade300,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        snapshot.data!.results.books[index]
                                            .bookImage,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      snapshot.data!.results.books[index].title,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      snapshot
                                          .data!.results.books[index].author,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("Bug"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Future<NyTimesBookRepository> getNyTimesBookRepository() async {
  try {
    Response response = await http.get(Uri.parse(
        'https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=W3mdJXmGRAKiVlMUMXQsm3EPAZq7oBco'));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      NyTimesBookRepository repository =
          NyTimesBookRepository.fromJson(jsonDecode(response.body));
      print(repository.results.books[0].author);
      return repository;
    } else {
      throw Exception("Bug");
    }
  } catch (e) {
    throw Exception(e);
  }
}
