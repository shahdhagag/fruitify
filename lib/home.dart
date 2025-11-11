import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitify/colors.dart';
import 'package:fruitify/model.dart';
import 'package:fruitify/product_item.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> category =[
    CategoryModel(image: "assets/category/fruits.png", name: "Fruits"),
    CategoryModel(image: "assets/category/vegiables.png", name: "Vegetables"),
    CategoryModel(image: "assets/category/image 41.png", name: "Laundry"),
    CategoryModel(image: "assets/category/image 39.png", name: "Milk & egg"),
    CategoryModel(image: "assets/category/image 37.png", name: "Beverages"),


  ];

List<String> items =[
 "assets/banners/Slider 1.png",
  "assets/banners/Slider 2.png",
  "assets/banners/Slider 3.png",
];

List<ProductModel> product =[
  ProductModel(
      name: "Banana",
      image: "assets/fruites/image 44.png",
      rate: "4.8 ",
      rateCount: "(287)",
      price: "\$3.99"),
  ProductModel(
      name: "Pepper",
      image: "assets/fruites/image 42.png",
      rate: "4.8 ",
      rateCount: "(287)",
      price: "\$2.99"),
  ProductModel(
      name: "Orange",
      image: "assets/fruites/image 44 (1).png",
      rate: "4.8 ",
      rateCount: "(287)",
      price: "\$3.99"),
  ProductModel(
      name: "Banana",
      image: "assets/fruites/image 44.png",
      rate: "4.8 ",
      rateCount: "(287)",
      price: "\$3.99"),
];

  List<ProductModel> basketList = [];
  void toggleSelection(ProductModel item) {
    setState(() {
      if (basketList.contains(item)) {
        basketList.remove(item);
      } else {
        basketList.add(item);
      }
    });
  }


bool isSelected(ProductModel product)=>basketList.contains(product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
          children: [

           SvgPicture.asset("assets/icons/Icons (1).svg"),
          SizedBox(width: 10,),
          Text("61 Hopper street..",style: TextStyle(
            fontSize: 19,
          ),),
            SizedBox(width: 10,),
            Icon(Icons.keyboard_arrow_down_rounded,size: 34,),

             Spacer(),
            SvgPicture.asset("assets/icons/Icons.svg"),

          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            ///banner
            CarouselSlider.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Image.asset(items[itemIndex]),
              options: CarouselOptions(
                height: 170,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.6,
                autoPlayCurve: Curves.linear,
                aspectRatio: 1,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 3),
              ),
            ),
        
            ///category
            
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:List.generate(category.length, (index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle
                          ),
                          width: 70,
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(category[index].image,width: 70,),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text(category[index].name,style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  );
                }),
              ),
            ),
        
            SizedBox(height: 20,),
            ///ROW
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text("Fruits",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  Spacer(),
                  Text("See all",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    //color: Color(0xff0CA201),
                    color :AppColors.primary,
                    fontSize: 17,
                  ),),
                ],
              ),
            ),
        
            SizedBox(height: 20,),
        
             /// products
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: List.generate(product.length, (index){
                    final item =product[index];
                    return ProductItem(
                        name: item.name,
                        image: item.image,
                        rate: item.rate,
                        rateCount: item.rateCount,
                        price: item.price,
                      onTap: ()=>toggleSelection(item),
                      icon:isSelected(item)?Icon(Icons.close):Icon(Icons.add) ,
                    );
                  }),
                ),
              ),
            ),

            SizedBox(height:20 ,),

            /// cart widget
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                width:double.infinity ,
                height: 77,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(7,
                ),
              ),
        
                   child: Row(
                     children: [
                       SizedBox(

                         width: 215,



                           child:ListView.builder(
                               itemCount: basketList.length,
                               scrollDirection: Axis.horizontal,
                               itemBuilder: (context,index){
                                 return Padding(
                                   padding: const EdgeInsets.only(left: 4.0),
                                   child: Container(
                                     width: 50,
                                     height: 50,
                                     decoration: BoxDecoration(
                                       color: Colors.white,
                                       shape: BoxShape.circle,
                                     ),
                                     child: Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Image.asset(basketList[index].image),
                                     ),

                                   ),
                                 );
                               })
                       ),
                        Spacer(),
                       Container(
                         width: 2,
                         height: 40,
                         color: Colors.white,
                       ),
                       SizedBox(width: 10),

                        Text("View Basket",style: TextStyle(
                          color: Colors.white,
                          fontSize:16,
                          fontWeight: FontWeight.bold,
                        ),),
                       SizedBox(width: 10),
                       Badge(
                         backgroundColor: Colors.red,
                         label: Text(basketList.length.toString(),style: TextStyle(fontSize: 13),),
                           child: SvgPicture.asset("assets/icons/Icons.svg",color: Colors.white,)),

                       SizedBox(width: 10),
                     ],
                   ),

                ),
              ),

        
            SizedBox(height:25 ,),
        
        
        
        
        
        
        
        
        
        
        
        
        
          ],
        ),
      ),



    );
  }
}
