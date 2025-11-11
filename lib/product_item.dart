import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.name,
    required this.image,
    required this.rate,
    required this.rateCount,
    required this.price, this.onTap, required this.icon,
  });

  final String name;
  final String image;
  final String rate;
  final String rateCount;
  final String price;
  final Function()? onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 140,
                  height:120 ,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(image, width: 120,fit:BoxFit.cover ,),
                  ),
                ),
                
                Positioned(
                  bottom: 0,
                    right: 5,
                    child: GestureDetector(
                      onTap: onTap,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor:Colors.white ,
                          child: icon,
                    ),
    ),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/icons/star (1).png", width: 18),
                    SizedBox(width: 5),
                    Text(
                     " $rate $rateCount",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  " $price",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
