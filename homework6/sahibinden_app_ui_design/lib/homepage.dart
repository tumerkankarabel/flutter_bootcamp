import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004F82),
        leading: IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: const Icon(Icons.menu)),
        title: const Text(
          'sahibinden.com',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.camera_alt),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF0F0F0),
      body: Column(
        children: [
          Card(
            color: Colors.white,
            shape: LinearBorder.start(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Kelime veya ilan No. ile ara',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Card(
              color: Colors.white,
              shape: LinearBorder.start(),
              child: ListView(
                children: [
                  _buildCategoryItem(
                      Icons.home,
                      'Emlak',
                      'Konut, İş Yeri, Arsa, Konut Projeleri, Bina, ...',
                      Colors.orange),
                  const Divider(height: 1, color: Colors.grey),
                  _buildCategoryItem(
                      Icons.directions_car,
                      'Vasıta',
                      'Otomobil, Arazi, SUV & Pickup, Motosiklet, ...',
                      Colors.red),
                  const Divider(height: 1, color: Colors.grey),
                  _buildCategoryItem(
                      Icons.build,
                      'Yedek Parça, Aksesuar, Donanım & Tuning',
                      'Otomotiv Ekipmanları, Motosiklet Ekipmanları, ...',
                      Colors.cyan),
                  const Divider(height: 1, color: Colors.grey),
                  _buildCategoryItem(
                      Icons.shopping_basket,
                      'İkinci El ve Sıfır Alışveriş',
                      'Bilgisayar, Cep Telefonu, Elektronik, ...',
                      Colors.purple),
                  const Divider(height: 1, color: Colors.grey),
                  _buildCategoryItem(
                      Icons.agriculture,
                      'İş Makineleri & Sanayi',
                      'İş Makineleri, Tarım Makineleri, Sanayi, Elektrik, ...',
                      Colors.deepPurple),
                  const Divider(height: 1, color: Colors.grey),
                  _buildCategoryItem(
                      Icons.brush,
                      'Ustalar ve Hizmetler',
                      'Ev Tadilat & Dekorasyon, Nakliye, Araç Servis, ...',
                      Colors.teal),
                  const Divider(height: 1, color: Colors.grey),
                  _buildCategoryItem(
                      Icons.book,
                      'Özel Ders Verenler',
                      'Lise & Üniversite, İlkokul & Ortaokul, Yabancı Dil, ...',
                      Colors.green),
                  const Divider(height: 1, color: Colors.grey),
                  _buildCategoryItem(
                      Icons.work,
                      'İş İlanları',
                      'Avukatlık & Hukuki Danışmanlık, Eğitim, ...',
                      Colors.lime),
                  const Divider(height: 1, color: Colors.grey),
                  _buildCategoryItem(
                      Icons.baby_changing_station,
                      'Yardımcı Arayanlar',
                      'Bebek & Çocuk Bakıcısı, Yaşlı & Hasta Bakıcı, ...',
                      Colors.deepOrange),
                  const Divider(height: 1, color: Colors.grey),
                  _buildCategoryItem(
                      Icons.pets,
                      'Hayvanlar Alemi',
                      'Evcil Hayvanlar, Akvaryum Balıkları, Aksesuarlar, ...',
                      Colors.indigo),
                  const Divider(height: 1, color: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCategoryItem(
      IconData icon, String title, String subtitle, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(title),
      subtitle: Text(
        subtitle,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
