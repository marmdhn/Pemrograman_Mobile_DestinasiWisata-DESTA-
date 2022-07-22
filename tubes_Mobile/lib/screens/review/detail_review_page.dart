import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/reviews.dart';

class DetailReview extends StatelessWidget {
  static const routeName = "/detail-review";

  @override
  Widget build(BuildContext context) {
    final reviews = Provider.of<Reviews>(context, listen: false);
    final reviewId = ModalRoute.of(context)!.settings.arguments as String;
    final selectReview = reviews.selectById(reviewId);
    final TextEditingController nameController =
        TextEditingController(text: selectReview.review);
    return Scaffold(
      appBar: AppBar(
        title: Text("DETAIL REVIEW"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(labelText: "Review"),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    reviews
                        .editReview(
                      reviewId,
                      nameController.text,
                    )
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Berhasil diubah"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
