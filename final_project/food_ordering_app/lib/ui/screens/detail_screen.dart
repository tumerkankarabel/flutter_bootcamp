import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/data/entity/food.dart';
import 'package:food_ordering_app/ui/cubit/detail_screen_cubit.dart';
import 'package:food_ordering_app/ui/screens/cart_screen.dart';

class DetailScreen extends StatefulWidget {
  final Yemekler food;

  DetailScreen({required this.food});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var quantity = 0;
  var price = 0;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear),
        ),
        title: const Text(
          "Ürün Detay",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
                "http://kasimadalan.pe.hu/yemekler/resimler/${widget.food.yemek_resim_adi}"),
            Text(
              "₺ ${widget.food.yemek_fiyat}",
              style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.food.yemek_adi,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (quantity < 1) {
                        quantity = 0;
                      } else {
                        quantity -= 1;
                        if (quantity == 0) {
                          isVisible = false;
                        } else {
                          isVisible = true;
                        }
                      }
                      var foodPrice = int.parse(widget.food.yemek_fiyat);
                      price = foodPrice * quantity;
                    });
                  },
                  icon: const Icon(
                    Icons.indeterminate_check_box,
                  ),
                  iconSize: 50,
                ),
                Text(
                  quantity.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity += 1;
                      isVisible = true;
                      var foodPrice = int.parse(widget.food.yemek_fiyat);
                      price = foodPrice * quantity;
                    });
                  },
                  icon: const Icon(
                    Icons.add_box,
                  ),
                  iconSize: 50,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.grey[300]),
                  onPressed: () {},
                  child: const Text(
                    "25-30 dk",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.grey[300]),
                  onPressed: () {},
                  child: const Text(
                    "Ücretsiz Teslimat",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.grey[300]),
                  onPressed: () {},
                  child: const Text(
                    "İndirim %10",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "₺ $price",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(
                              food: widget.food,
                              quantity: quantity,
                              username: "tumerkan",
                            ),
                          ),
                        );
                        context.read<DetailScreenCubit>().addToCart(
                            widget.food.yemek_adi,
                            widget.food.yemek_resim_adi,
                            int.parse(widget.food.yemek_fiyat),
                            quantity,
                            "tumerkan");
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        backgroundColor: Colors.grey[700],
                      ),
                      child: const Text(
                        "Sepete Ekle",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
