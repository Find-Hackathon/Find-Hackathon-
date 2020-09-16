import 'package:FindHackathon/Core/Constants/App/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return searchTextFieldRow(size);
  }

  Row searchTextFieldRow(Size size) {
    var controller = TextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size.width * 0.86,
          child: TextField(
            controller: controller,
            style: TextStyle(
              color: AppColors.kGreen,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              prefixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  controller.clear();
                },
              ),
              hintText: "Search",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
