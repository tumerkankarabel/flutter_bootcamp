import 'package:dart_dersleri/nesne_tabanli_programlama/odev2.dart';

void main(List<String> args) {
  Odev2 o2 = Odev2();

  double sonuc1 = o2.soru1(10);
  print("Mile : $sonuc1");

  o2.soru2(10, 5);

  int sonuc3 = o2.soru3(5);
  print("Faktöriyel : $sonuc3");

  o2.soru4("kalem");

  double sonuc5 = o2.soru5(3);
  print("İç Açılar Toplamı : $sonuc5");

  double sonuc6 = o2.soru6(20);
  print("Toplam Maaş : $sonuc6");

  double sonuc7 = o2.soru7(4);
  print("Toplam Otopark Ücreti : $sonuc7");
}
