import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venvice/utils/my_style.dart';

class RatingOrderPage extends StatefulWidget {
  const RatingOrderPage({Key? key}) : super(key: key);

  @override
  _RatingOrderPageState createState() => _RatingOrderPageState();
}

class _RatingOrderPageState extends State<RatingOrderPage> {
  double rating = 3.5;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: MyStyle.containerShadow(),
              child: Column(
                children: [
                  Container(
                    height: 30,
                    color: Colors.white,
                  ),

                  // top-nav
                  Container(
                    width: deviceWidth,
                    height: 60,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.arrow_back_ios_rounded),
                        ),
                        Text(
                          'Penilaian dan ulasan',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),

                  SizedBox(height: 12),

                  // jasa
                  Row(
                    children: [
                      Spacer(),
                      Image.asset(
                        'assets/images/workshop.png',
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(width: 18),
                      Text(
                        "Perbaikan Komputer",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                    ],
                  ),

                  SizedBox(height: 18),

                  // give rating
                  Text(
                    "Beri rating ke Mitra",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "( 1 Mengecewakan, 5 Gokil! )",
                    style: TextStyle(color: Colors.grey),
                  ),

                  SizedBox(height: 12),
                  StarRating(
                    rating: rating,
                    onRatingChanged: (rating) {
                      print("Rating : $rating");

                      setState(() => this.rating = rating);
                    },
                    color: Colors.orange,
                  ),
                  SizedBox(height: 12),

                  // mitra
                  Row(
                    children: [
                      SizedBox(width: 18),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(44),
                        child: Image(
                          image: NetworkImage('https://via.placeholder.com/44'),
                          fit: BoxFit.fill,
                          width: 44,
                          height: 44,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Viody Alfaridzi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),

                  // review
                  Row(
                    children: [
                      SizedBox(width: 18),
                      Text(
                        "Ulasan (Opsional)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  Container(
                    height: 50,
                    margin: EdgeInsets.only(left: 18, right: 18, top: 8),
                    decoration: MyStyle.textBoxInActive(),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: Icon(Icons.note_add),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: MyStyle.myInputDecor(
                                'Berikan ulasan pada Mitra'),
                            showCursor: false,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 18),
                ],
              ),
            ),

            SizedBox(height: 12),

            // Order detail
            Container(
              decoration: MyStyle.containerShadow(),
              width: deviceWidth,
              child: Column(
                children: [
                  SizedBox(height: 12),

                  // detail pesanan
                  Row(
                    children: [
                      SizedBox(width: 18),
                      Text(
                        "Detail pesanan",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),

                  // detail pesanan
                  Row(
                    children: [
                      SizedBox(width: 18),
                      Text(
                        "Order id",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                      Text(
                        "LTP-123-123-123",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 18),
                    ],
                  ),
                  SizedBox(height: 6),

                  Row(
                    children: [
                      SizedBox(width: 18),
                      Text(
                        "Tanggal",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                      Text(
                        "Hari ini, 02:37 PM",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 18),
                    ],
                  ),

                  SizedBox(height: 12),
                ],
              ),
            ),

            SizedBox(height: 12),

            // daftar belanja
            Container(
              decoration: MyStyle.containerShadow(),
              width: deviceWidth,
              child: Column(
                children: [
                  SizedBox(height: 12),

                  // detail pesanan
                  Row(
                    children: [
                      SizedBox(width: 18),
                      Text(
                        "Daftar belanja",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),

                  // detail pesanan
                  Row(
                    children: [
                      SizedBox(width: 18),
                      Text(
                        "Order id",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                      Text(
                        "LTP-123-123-123",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 18),
                    ],
                  ),
                  SizedBox(height: 6),

                  Row(
                    children: [
                      SizedBox(width: 18),
                      Text(
                        "Tanggal",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                      Text(
                        "Hari ini, 02:37 PM",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 18),
                    ],
                  ),

                  SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating(
      {this.starCount = 5,
      this.rating = .0,
      required this.onRatingChanged,
      required this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        size: 40,
        color: Colors.grey,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        size: 40,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        size: 40,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return new InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
