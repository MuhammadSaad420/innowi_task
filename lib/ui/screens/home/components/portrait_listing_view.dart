import 'package:flutter/material.dart';

class PortraitListingView extends StatelessWidget {
  const PortraitListingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, index) => Container(
        height: 200,
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
