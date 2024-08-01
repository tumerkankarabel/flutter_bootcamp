import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/data/entity/food.dart';
import 'package:food_ordering_app/ui/cubit/home_screen_cubit.dart';
import 'package:food_ordering_app/ui/screens/cart_screen.dart';
import 'package:food_ordering_app/ui/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;

  Yemekler food = Yemekler(
      yemek_id: "0",
      yemek_adi: "food",
      yemek_resim_adi: "default_image.png",
      yemek_fiyat: "0");

  @override
  void initState() {
    super.initState();
    context.read<HomeScreenCubit>().getAllFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                decoration: const InputDecoration(hintText: "Search"),
                onChanged: (searchingResult) {
                  context.read<HomeScreenCubit>().searchFoods(searchingResult);
                },
              )
            : const Text("Merhaba"),
        actions: [
          isSearching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                    });
                  },
                  icon: const Icon(Icons.clear),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
        ],
      ),
      body: BlocBuilder<HomeScreenCubit, List<Yemekler>>(
        builder: (context, foodList) {
          if (foodList.isNotEmpty) {
            return GridView.builder(
              itemCount: foodList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.7),
              itemBuilder: (context, index) {
                var food = foodList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  food: food,
                                ))).then((value) {
                      context.read<HomeScreenCubit>().getAllFoods();
                    });
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                            "http://kasimadalan.pe.hu/yemekler/resimler/${food.yemek_resim_adi}"),
                        Text(
                          food.yemek_adi,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.directions_bike_outlined,
                              size: 20,
                            ),
                            Text("Ücretsiz Teslimat"),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "₺ ${food.yemek_fiyat}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailScreen(food: food)));
                                },
                                iconSize: 30,
                                color: Colors.grey,
                                icon: const Icon(Icons.add_box),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(
                food: food,
                quantity: 1,
                username: "tumerkan",
              ),
            ),
          );
        },
        child: const Icon(
          Icons.shopping_cart,
          size: 32,
        ),
      ),
    );
  }
}
