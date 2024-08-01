import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/data/entity/cart_food.dart';
import 'package:food_ordering_app/data/entity/food.dart';
import 'package:food_ordering_app/ui/cubit/cart_screen_cubit.dart';
import 'package:food_ordering_app/ui/screens/home_screen.dart';

class CartScreen extends StatefulWidget {
  final Yemekler food;
  final int quantity;
  final String username;

  CartScreen(
      {required this.food, required this.quantity, required this.username});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  num total = 0;

  @override
  void initState() {
    super.initState();
    context.read<CartScreenCubit>().getCartFoods("tumerkan");
    total = total + int.parse(widget.food.yemek_fiyat) * (widget.quantity);
  }

  Future<bool> goBackButton(BuildContext context) async {
    Navigator.of(context).popUntil((route) => route.isFirst);
    total = 0;
    return true;
  }

  void buttonShowDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Siparişiniz yola çıkmak için hazırlanıyor"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: const Text("Anasayfaya Dön"),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => goBackButton(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sepetim"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                total = 0;
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              icon: const Icon(Icons.clear)),
        ),
        body: BlocBuilder<CartScreenCubit, List<SepetYemekler>>(
          builder: (context, cartFoodList) {
            if (cartFoodList.isNotEmpty) {
              total = cartFoodList.fold(
                  0,
                  (previousValue, element) =>
                      previousValue +
                      (int.parse(element.yemek_fiyat) *
                          int.parse(element.yemek_siparis_adet)));

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartFoodList.length,
                      itemBuilder: (context, index) {
                        var food = cartFoodList[index];
                        total = total +
                            (int.parse(cartFoodList[index].yemek_fiyat) *
                                int.parse(
                                    cartFoodList[index].yemek_siparis_adet));
                        return Card(
                          child: SizedBox(
                            height: 125,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                    "http://kasimadalan.pe.hu/yemekler/resimler/${food.yemek_resim_adi}"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        food.yemek_adi,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Fiyat: ₺${food.yemek_fiyat}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Adet: ${food.yemek_siparis_adet}"),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text("${food.yemek_adi} silinsin mi?"),
                                            action: SnackBarAction(
                                              label: "Evet",
                                              onPressed: () {
                                                context
                                                    .read<CartScreenCubit>()
                                                    .deleteFromCart(
                                                        int.parse(food
                                                            .sepet_yemek_id),
                                                        food.kullanici_adi);
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.delete),
                                      iconSize: 24,
                                    ),
                                    Text(
                                      "₺ ${int.parse(food.yemek_fiyat) * int.parse(food.yemek_siparis_adet)}",
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Divider(),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Gönderim Ücreti",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              "₺0",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Toplam:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "₺$total",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: buttonShowDialog,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow[700]),
                            child: const Text(
                              "SEPETİ ONAYLA",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('Sepetiniz boş.'),
              );
            }
          },
        ),
      ),
    );
  }
}
