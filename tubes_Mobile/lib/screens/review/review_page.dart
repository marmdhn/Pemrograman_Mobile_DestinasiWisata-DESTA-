import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'detail_review_page.dart';
import 'add_review_page.dart';

import '../../providers/reviews.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  // bool isInit = true;
  @override
  // void didChangeDependencies() {
  //   if (isInit) {
  //     Provider.of<Reviews>(context).initialData();
  //   }
  //   isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final allReviewProvider = Provider.of<Reviews>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ALL YOUR REVIEW'S"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddReview.routeName);
            },
          ),
        ],
      ),
      body: (allReviewProvider.jumlahReview == 0)
          ? Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Review's",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AddReview.routeName);
                    },
                    child: Text(
                      "Add Review",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: allReviewProvider.jumlahReview,
              itemBuilder: (context, index) {
                var id = allReviewProvider.allReview[index].id;
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailReview.routeName,
                      arguments: id,
                    );
                  },

                  title: Text(
                    allReviewProvider.allReview[index].review.toString(),
                  ),
                  // subtitle: Text(
                  //   DateFormat.yMMMMd()
                  //       .format(allReviewProvider.allReview[index].createdAt),
                  // ),
                  trailing: IconButton(
                    onPressed: () {
                      allReviewProvider.deleteReview(id.toString()).then(
                        (_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Berhasil dihapus"),
                              duration: Duration(milliseconds: 500),
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
    );
  }
}
