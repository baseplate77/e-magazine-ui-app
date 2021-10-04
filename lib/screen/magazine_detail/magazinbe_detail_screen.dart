import 'package:flutter/material.dart';

class MagazineDetailScreen extends StatefulWidget {
  const MagazineDetailScreen({Key? key}) : super(key: key);

  @override
  _MagazineDetailScreenState createState() => _MagazineDetailScreenState();
}

class _MagazineDetailScreenState extends State<MagazineDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
