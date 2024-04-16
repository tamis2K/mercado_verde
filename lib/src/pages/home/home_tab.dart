import 'package:flutter/material.dart';
import 'package:mercado_verde/src/config/app_data.dart' as appData;
import 'package:mercado_verde/src/config/custom_colors.dart';
import 'package:mercado_verde/src/pages/home/components/category_tile.dart';
import 'package:mercado_verde/src/pages/home/components/item_title.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String SelectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 30),
            children: [
              TextSpan(
                text: 'Mercado',
                style: TextStyle(color: Colors.white),
              ),
              TextSpan(
                text: 'Verde',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: CustomColors.customContrstColor,
                label: Text(
                  '2',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),

      // Campo de busca
      body: Column(
        children: [
          // Campo de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquise aqui...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customContrstColor,
                  size: 21,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
              ),
            ),
          ),

          // Categorias
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryTile(
                  onPressed: () {
                    setState(() {
                      SelectedCategory = appData.categories[index];
                    });
                  },
                  category: appData.categories[index],
                  isSelected: appData.categories[index] == SelectedCategory,
                );
              },
              separatorBuilder: (_, index) => const SizedBox(width: 5),
              itemCount: appData.categories.length,
            ),
          ),

          // Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
              ),
              itemCount: appData.items.length,
              itemBuilder: (_, index) {
                return  ItemTile(
                  item: appData.items[index],
                );
              },
            ),
          ),
        ],
      ),

      // Categorias

      // Grid
    );
  }
}
