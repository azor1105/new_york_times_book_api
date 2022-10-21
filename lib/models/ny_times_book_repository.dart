class NyTimesBookRepository {
    NyTimesBookRepository({
        required this.status,
        required this.copyright,
        required this.numResults,
        required this.lastModified,
        required this.results,
    });

    String status;
    String copyright;
    int numResults;
    String lastModified;
    Results results;

    factory NyTimesBookRepository.fromJson(Map<String, dynamic> json) => NyTimesBookRepository(
        status: json["status"] as String? ?? '',
        copyright: json["copyright"] as String? ?? '',
        numResults: json["num_results"] as int? ?? 0,
        lastModified: json["last_modified"] as String? ?? '',
        results: Results.fromJson(json["results"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "copyright": copyright,
        "num_results": numResults,
        "last_modified": lastModified,
        "results": results.toJson(),
    };
}

class Results {
    Results({
        required this.listName,
        required this.listNameEncoded,
        required this.bestsellersDate,
        required this.publishedDate,
        required this.publishedDateDescription,
        required this.nextPublishedDate,
        required this.previousPublishedDate,
        required this.displayName,
        required this.normalListEndsAt,
        required this.updated,
        required this.books,
        required this.corrections,
    });

    String listName;
    String listNameEncoded;
    String bestsellersDate;
    String publishedDate;
    String publishedDateDescription;
    String nextPublishedDate;
    String previousPublishedDate;
    String displayName;
    int normalListEndsAt;
    String updated;
    List<Book> books;
    List<dynamic> corrections;

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        listName: json["list_name"]  as String? ?? '',
        listNameEncoded: json["list_name_encoded"]  as String? ?? '',
        bestsellersDate: json["bestsellers_date"]  as String? ?? '',
        publishedDate: json["published_date"]  as String? ?? '',
        publishedDateDescription: json["published_date_description"]  as String? ?? '',
        nextPublishedDate: json["next_published_date"]  as String? ?? '',
        previousPublishedDate: json["previous_published_date"]  as String? ?? '',
        displayName: json["display_name"]  as String? ?? '',
        normalListEndsAt: json["normal_list_ends_at"] as int? ?? 0,
        updated: json["updated"]  as String? ?? '',
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
        corrections: List<dynamic>.from(json["corrections"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "list_name": listName,
        "list_name_encoded": listNameEncoded,
        "bestsellers_date": bestsellersDate,
        "published_date": publishedDate,
        "published_date_description": publishedDateDescription,
        "next_published_date": nextPublishedDate,
        "previous_published_date": previousPublishedDate,
        "display_name": displayName,
        "normal_list_ends_at": normalListEndsAt,
        "updated": updated,
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
        "corrections": List<dynamic>.from(corrections.map((x) => x)),
    };
}

class Book {
    Book({
        required this.rank,
        required this.rankLastWeek,
        required this.weeksOnList,
        required this.asterisk,
        required this.dagger,
        required this.primaryIsbn10,
        required this.primaryIsbn13,
        required this.publisher,
        required this.description,
        required this.price,
        required this.title,
        required this.author,
        required this.contributor,
        required this.contributorNote,
        required this.bookImage,
        required this.bookImageWidth,
        required this.bookImageHeight,
        required this.amazonProductUrl,
        required this.ageGroup,
        required this.bookReviewLink,
        required this.firstChapterLink,
        required this.sundayReviewLink,
        required this.articleChapterLink,
        required this.isbns,
        required this.buyLinks,
        required this.bookUri,
    });

    int rank;
    int rankLastWeek;
    int weeksOnList;
    int asterisk;
    int dagger;
    String primaryIsbn10;
    String primaryIsbn13;
    String publisher;
    String description;
    String price;
    String title;
    String author;
    String contributor;
    String contributorNote;
    String bookImage;
    int bookImageWidth;
    int bookImageHeight;
    String amazonProductUrl;
    String ageGroup;
    String bookReviewLink;
    String firstChapterLink;
    String sundayReviewLink;
    String articleChapterLink;
    List<Isbn> isbns;
    List<BuyLink> buyLinks;
    String bookUri;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        rank: json["rank"] as int? ?? 0,
        rankLastWeek: json["rank_last_week"] as int? ?? 0,
        weeksOnList: json["weeks_on_list"] as int? ?? 0,
        asterisk: json["asterisk"] as int? ?? 0,
        dagger: json["dagger"] as int? ?? 0,
        primaryIsbn10: json["primary_isbn10"] as String? ?? "",
        primaryIsbn13: json["primary_isbn13"] as String? ?? "",
        publisher: json["publisher"] as String? ?? "",
        description: json["description"] as String? ?? "",
        price: json["price"] as String? ?? "",
        title: json["title"] as String? ?? "",
        author: json["author"] as String? ?? "",
        contributor: json["contributor"] as String? ?? "",
        contributorNote: json["contributor_note"] as String? ?? "",
        bookImage: json["book_image"] as String? ?? "",
        bookImageWidth: json["book_image_width"] as int? ?? 0,
        bookImageHeight: json["book_image_height"] as int? ?? 0,
        amazonProductUrl: json["amazon_product_url"] as String? ?? "",
        ageGroup: json["age_group"] as String? ?? "",
        bookReviewLink: json["book_review_link"] as String? ?? "",
        firstChapterLink: json["first_chapter_link"] as String? ?? "",
        sundayReviewLink: json["sunday_review_link"] as String? ?? "",
        articleChapterLink: json["article_chapter_link"] as String? ?? "",
        isbns: List<Isbn>.from(json["isbns"].map((x) => Isbn.fromJson(x))),
        buyLinks: List<BuyLink>.from(json["buy_links"].map((x) => BuyLink.fromJson(x))),
        bookUri: json["book_uri"] as String? ?? "",
    );

    Map<String, dynamic> toJson() => {
        "rank": rank,
        "rank_last_week": rankLastWeek,
        "weeks_on_list": weeksOnList,
        "asterisk": asterisk,
        "dagger": dagger,
        "primary_isbn10": primaryIsbn10,
        "primary_isbn13": primaryIsbn13,
        "publisher": publisher,
        "description": description,
        "price": price,
        "title": title,
        "author": author,
        "contributor": contributor,
        "contributor_note": contributorNote,
        "book_image": bookImage,
        "book_image_width": bookImageWidth,
        "book_image_height": bookImageHeight,
        "amazon_product_url": amazonProductUrl,
        "age_group": ageGroup,
        "book_review_link": bookReviewLink,
        "first_chapter_link": firstChapterLink,
        "sunday_review_link": sundayReviewLink,
        "article_chapter_link": articleChapterLink,
        "isbns": List<dynamic>.from(isbns.map((x) => x.toJson())),
        "buy_links": List<dynamic>.from(buyLinks.map((x) => x.toJson())),
        "book_uri": bookUri,
    };
}

class BuyLink {
    BuyLink({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory BuyLink.fromJson(Map<String, dynamic> json) => BuyLink(
        name: json["name"] as String? ?? "",
        url: json["url"] as String? ?? "",
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

class Isbn {
    Isbn({
        required this.isbn10,
        required this.isbn13,
    });

    String isbn10;
    String isbn13;

    factory Isbn.fromJson(Map<String, dynamic> json) => Isbn(
        isbn10: json["isbn10"] as String? ?? "",
        isbn13: json["isbn13"] as String? ?? "",
    );

    Map<String, dynamic> toJson() => {
        "isbn10": isbn10,
        "isbn13": isbn13,
    };
}

