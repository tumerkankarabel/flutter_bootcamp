class Odev2 {
  double soru1(double km) {
    var mile = km * 0.621;
    return mile;
  }

  void soru2(double en, double boy) {
    var alan = en * boy;
    print("Didörtgenin Alanı : $alan");
  }

  int soru3(int number) {
    var fact = 1;
    for (int i = 1; i <= number; i++) {
      fact = fact * i;
    }
    return fact;
  }

  void soru4(String word) {
    int sayac = 0;

    for (int i = 0; i < word.length; i++) {
      if (word[i].toLowerCase() == 'e') {
        sayac++;
      }
    }
    print("Kelime içinde $sayac adet e harfi vardır.");
  }

  double soru5(int kenarSayisi) {
    double icAcilarToplami = ((kenarSayisi - 2) * 180) / kenarSayisi;
    return icAcilarToplami;
  }

  double soru6(int gunSayisi) {
    const int gundeCalisilanSaat = 8;
    const double calismaSaatUcreti = 40.0;
    const double mesaiSaatUcreti = 80.0;
    const int fazlaMesaiSaati = 150;

    int toplamCalisilanSaat = gunSayisi * gundeCalisilanSaat;
    double toplamMaas = 0.0;

    if (toplamCalisilanSaat > fazlaMesaiSaati) {
      int fazlaSaat = toplamCalisilanSaat - fazlaMesaiSaati;
      int normalSaat = fazlaMesaiSaati;
      toplamMaas =
          (normalSaat * calismaSaatUcreti) + (fazlaSaat * mesaiSaatUcreti);
    } else {
      toplamMaas = toplamCalisilanSaat * calismaSaatUcreti;
    }

    return toplamMaas;
  }

  double soru7(int otoparkSuresi) {
    const double saatlikUcret = 50.0;
    const double ekSaatlikUcret = 10.0;

    if (otoparkSuresi <= 0) {
      return 0.0;
    } else if (otoparkSuresi == 1) {
      return saatlikUcret;
    } else {
      return saatlikUcret + (otoparkSuresi - 1) * ekSaatlikUcret;
    }
  }
}
