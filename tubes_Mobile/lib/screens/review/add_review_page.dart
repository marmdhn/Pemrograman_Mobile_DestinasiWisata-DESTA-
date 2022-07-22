import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_1/model/review.dart';

import '../../providers/reviews.dart';

class AddReview extends StatelessWidget {
  static const routeName = "/add-review";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Review = Provider.of<Reviews>(context, listen: false);
    final VoidCallback? AddReview = () {
      Review.addReview(
        nameController.text,
      ).then(
        (response) {
          print("Kembali ke Home & kasih notif snack bar");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Berhasil ditambahkan"),
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.pop(context);
        },
      ).catchError(
        (err) => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("TERJADI ERROR $err"),
            content: Text("Tidak dapat menambahkan Review."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OKAY"),
              ),
            ],
          ),
        ),
      );
    };
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD REVIEW"),
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
                  onPressed: AddReview,
                  child: Text(
                    "Submit",
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
