import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/review.dart';

class Reviews with ChangeNotifier {
  List<Review> _allReview = [];

  List<Review> get allReview => _allReview;

  int get jumlahReview => _allReview.length;

  Review selectById(String id) =>
      _allReview.firstWhere((element) => element.id == id);

  Future<void> addReview(String review) {
    DateTime datetimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://tubes-mobile-931d6-default-rtdb.firebaseio.com/Reviews.json");
    return http
        .post(
      url,
      body: json.encode(
        {
          "review": review,
        },
      ),
    )
        .then(
      (response) {
        print("THEN FUNCTION");
        _allReview.add(
          Review(
            id: json.decode(response.body)["review"].toString(),
            review: review,
            createdAt: datetimeNow,
          ),
        );

        notifyListeners();
      },
    );
  }

  editReview(String id, String review) async {
    Uri url = Uri.parse(
        "https://tubes-mobile-931d6-default-rtdb.firebaseio.com/Reviews/$id.json");
    try {
      final response = await http.patch(
        url,
        body: json.encode(
          {
            "review": review,
          },
        ),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        Review selectReview =
            _allReview.firstWhere((element) => element.id == id);
        selectReview.review = review;
        notifyListeners();
      } else {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      throw (error);
    }
  }

  Future<void> deleteReview(String id) {
    Uri url = Uri.parse(
        "https://tubes-mobile-931d6-default-rtdb.firebaseio.com/Reviews/$id.json");
    return http.delete(url).then(
      (response) {
        _allReview.removeWhere((element) => element.id == id);
        notifyListeners();
      },
    );
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        "https://tubes-mobile-931d6-default-rtdb.firebaseio.com/Reviews.json");

    var hasilGetData = await http.get(url);

    var dataResponse = json.decode(hasilGetData.body);

    if (dataResponse != null) {
      dataResponse.forEach(
        (key, value) {
          _allReview.add(
            Review(
              id: key,
              review: value["review"],
            ),
          );
        },
      );
      print("BERHASIL MASUKAN DATA LIST");

      notifyListeners();
    }
  }

  // addReview(String review) async {
  //   DateTime datetimeNow = DateTime.now();

  //   Uri url = Uri.parse(
  //       "https://tubes-mobile-931d6-default-rtdb.firebaseio.com/Reviews.json");

  //   try {
  //     final response = await http.post(
  //       url,
  //       body: json.encode(
  //         {
  //           "review": review,
  //           "createdAt": datetimeNow.toString(),
  //         },
  //       ),
  //     );
  //     if (response.statusCode >= 200 && response.statusCode < 300) {
  //       _allReview.add(
  //         Review(
  //           id: json.decode(response.body)["review"].toString(),
  //           review: review,
  //           createdAt: datetimeNow,
  //         ),
  //       );

  //       notifyListeners();
  //     } else {
  //       throw ("${response.statusCode}");
  //     }
  //   } catch (error) {
  //     throw (error);
  //   }
  // }

  // Future<void> editReview(String id, String review) {
  //   Uri url = Uri.parse(
  //       "https://tubes-mobile-931d6-default-rtdb.firebaseio.com/Reviews/$id.json");
  //   return http
  //       .put(
  //     url,
  //     body: json.encode(
  //       {
  //         "review": review,
  //       },
  //     ),
  //   )
  //       .then(
  //     (response) {
  //       Review selectReview =
  //           _allReview.firstWhere((element) => element.id == id);
  //       selectReview.review = review;
  //       notifyListeners();
  //     },
  //   );
  // }

  // deleteReview(String id) async {
  //   Uri url = Uri.parse(
  //       "https://tubes-mobile-931d6-default-rtdb.firebaseio.com/Reviews/$id.json");

  //   try {
  //     final response = await http.delete(url).then(
  //       (response) {
  //         _allReview.removeWhere((element) => element.id == id);
  //         notifyListeners();
  //       },
  //     );

  //     if (response.statusCode < 200 && response.statusCode >= 300) {
  //       throw ("${response.statusCode}");
  //     }
  //   } catch (error) {
  //     throw (error);
  //   }
  // }
}
