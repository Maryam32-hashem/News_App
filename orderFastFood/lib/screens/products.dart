import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:orderfastfood/database/db.dart';

import 'package:orderfastfood/screens/cart.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

import '../bloc/provider.dart';
import '../model/cartmodel.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<String> productName = [
   'co ca cola',
    'pepci',
    'seven up',
    'fayrouz',
    'shwips',
    'red bell',
  ];
  List<String> productUnit = [
    'S',
    'S',
    'S',
    'S',
    'S',
    'S',

  ];
  List<int> productPrice = [
    29000,
    29000,
    29000,
    29000,
    29000,
    29000,

  ];
  List<String> productImage = [
   ' https://www.google.com/search?sca_esv=568147601&sxsrf=AM9HkKkNtf7p3a50bxj8QVouBKEYgGqAAg:1695636029468&q=coca+cola&tbm=isch&source=lnms&sa=X&ved=2ahUKEwiandG5wMWBAxWnUaQEHfoSATYQ0pQJegQIDRAB&biw=1062&bih=698&dpr=1.25#imgrc=xZCsHktEyU3qhM',
    'https://www.google.com/search?q=pepsi&tbm=isch&ved=2ahUKEwisorC7wMWBAxVInycCHWW_BpsQ2-cCegQIABAA&oq=pe&gs_lcp=CgNpbWcQARgAMgoIABCKBRCxAxBDMgcIABCKBRBDMgcIABCKBRBDMgcIABCKBRBDMgcIABCKBRBDMgcIABCKBRBDMgcIABCKBRBDMgcIABCKBRBDMgcIABCKBRBDMgcIABCKBRBDOggIABCABBCxAzoFCAAQgAQ6BwgjEOoCECc6BAgjECc6CwgAEIAEELEDEIMBUKcJWM8RYJsiaAFwAHgAgAGfAYgBxgOSAQMwLjOYAQCgAQGqAQtnd3Mtd2l6LWltZ7ABCsABAQ&sclient=img&ei=QVoRZez9Bsi-nsEP5f6a2Ak&bih=698&biw=1062#imgrc=T_-mYhnugDZxRM',
    'https://www.google.com/search?sca_esv=568147601&sxsrf=AM9HkKkvsIAmwjMutd86bzmSLwIU28zWGw:1695636177082&q=seven+up+can&tbm=isch&source=lnms&sa=X&ved=2ahUKEwj874KAwcWBAxWfUKQEHeIlDOQQ0pQJegQIDhAB&biw=1062&bih=698&dpr=1.25#imgrc=5kZtdGoD1mc2VM',
    'https://www.google.com/search?q=fayrouz&tbm=isch&ved=2ahUKEwi2rvSTwcWBAxU5mycCHQZ1DUwQ2-cCegQIABAA&oq=fayr&gs_lcp=CgNpbWcQARgBMgQIIxAnMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEOggIABCABBCxAzoFCAAQsQM6BwgjEOoCECdQqQpY8yNg7y9oBHAAeAGAAekBiAHPB5IBBTAuNS4xmAEAoAEBqgELZ3dzLXdpei1pbWewAQrAAQE&sclient=img&ei=-loRZbbJL7m2nsEPhuq14AQ&bih=698&biw=1062#imgrc=1qw1ZSWvvud5gM',
    'https://www.google.com/search?q=shwips+can&tbm=isch&ved=2ahUKEwi0ofGkwcWBAxUEpycCHUp5BAoQ2-cCegQIABAA&oq=shwips+can&gs_lcp=CgNpbWcQAzoECCMQJzoFCAAQgAQ6CQgAEBgQgAQQClCUJli3MGCIOWgAcAB4AIAB_wGIAbsHkgEFMC4zLjKYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=HlsRZbSaF4TOnsEPyvKRUA&bih=698&biw=1062#imgrc=nNdACyxo3YksPM',
    'https://www.google.com/search?q=red+bull+can&tbm=isch&ved=2ahUKEwiCzIyqwcWBAxV0pycCHSbfC9QQ2-cCegQIABAA&oq=re&gs_lcp=CgNpbWcQARgAMgcIABCKBRBDMgcIABCKBRBDMgUIABCABDIICAAQgAQQsQMyCwgAEIAEELEDEIMBMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQ6BAgjECc6BwgjEOoCECdQnBBY5SVggTNoAXAAeAGAAaEBiAG1C5IBBDAuMTCYAQCgAQGqAQtnd3Mtd2l6LWltZ7ABCsABAQ&sclient=img&ei=KVsRZcKTE_TOnsEPpr6voA0&bih=698&biw=1062#imgrc=lXptIek0T_1fkM',
  ];
  DbHelper? dbHelper = DbHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>CartScreen()));
            },
            child: Center(child:
              badges.Badge(
                badgeContent: Text("3"),
                child: const Icon(Icons.shopping_bag_outlined),
                badgeAnimation: badges.BadgeAnimation.slide(
                  animationDuration: Duration(milliseconds: 300)
                ),


              ) ),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
       
                itemCount: productName.length,
        itemBuilder: (context,index){
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(


                                child: Image(

                                  image: NetworkImage(

                                      productImage[index].toString()),
                                  height: 100,
                                  width: 100,
                                ),
                                height: 100,
                                width: 100,
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(productName[index].toString(),style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),),
                                    SizedBox(height: 5,),
                                    Text(productUnit[index].toString()+
                                        " " +
                                        r"$" +
                                        productPrice[index].toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(height: 5,),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        child: Container(
                                          height: 35,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          child: const Center(
                                            child: Text(
                                              'Add to cart',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        onTap: (){
                                          dbHelper!
                                              .insert(Cart(
                                              id: index,
                                              productId: index.toString(),
                                              productName:
                                              productName[index]
                                                  .toString(),
                                              initialPrice:
                                              productPrice[index],
                                              productPrice:
                                              productPrice[index],
                                              quantity: 1,
                                              productUnit: productUnit[index]
                                                  .toString(),
                                              productImage: productImage[index]
                                                  .toString()))
                                              .then((value) {
                                            cart.addTotalPrice(double.parse(
                                                productPrice[index]
                                                    .toString()));
                                            cart.addCounter();

                                            final snackBar = SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                  'Product is added to cart'),
                                              duration: Duration(seconds: 1),
                                            );

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }).onError((error, stackTrace) {
                                            print("error" + error.toString());

                                            final snackBar = SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Text(
                                                    'Product is already added in cart'),
                                                duration: Duration(seconds: 1));

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          });

                                        },
                                      ),
                                    )

                                  ],

                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
        },
            ),
          )
        ],
      ),
    );
  }
}
