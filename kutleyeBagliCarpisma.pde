float kare1X, kare1Y; // Kare 1'in pozisyonu
float kare1HizX, kare1HizY; // Kare 1'in hızı
float kare1Kutle; // Kare 1'in kütlesi

float kare2X, kare2Y; // Kare 2'nin pozisyonu
float kare2HizX, kare2HizY; // Kare 2'nin hızı
float kare2Kutle; // Kare 2'nin kütlesi
int carpismaSayisi = 0;

final int kare1Boyut = 50;
final int kare2Boyut = 100;
final int xEkseniSiniri = 100;

void setup() {
  size(800, 400);

  // Kare 1'in başlangıç değerleri
  kare1X = 200;
  kare1Y = 2 * height / 3;
  kare1HizX = 0;
  kare1HizY = 0;
  kare1Kutle = 1;

  // Kare 2'nin başlangıç değerleri
  kare2X = 400;
  kare2Y = 2 * height / 3;
  kare2HizX = -1;
  kare2HizY = 0;
  kare2Kutle = 100;
}

void draw() {
  background(150);
  kareleriCiz();
  // Karelerin hareketi
  kare1X += kare1HizX;

  kare2X += kare2HizX;

  // Karelerin çarpışmasını kontrol etme
  if (karelerCarpisti()) {

    // Kareler çarpıştığında hız değişimlerini hesapla
    float yeniHiz1X = ((kare1Kutle - kare2Kutle) * kare1HizX + (2 * kare2Kutle * kare2HizX)) / (kare1Kutle + kare2Kutle);
    float yeniHiz1Y = ((kare1Kutle - kare2Kutle) * kare1HizY + (2 * kare2Kutle * kare2HizY)) / (kare1Kutle + kare2Kutle);

    float yeniHiz2X = ((kare2Kutle - kare1Kutle) * kare2HizX + (2 * kare1Kutle * kare1HizX)) / (kare1Kutle + kare2Kutle);
    float yeniHiz2Y = ((kare2Kutle - kare1Kutle) * kare2HizY + (2 * kare1Kutle * kare1HizY)) / (kare1Kutle + kare2Kutle);

    // Hız değişimlerini atama
    kare1HizX = yeniHiz1X;
    kare1HizY = yeniHiz1Y;

    kare2HizX = yeniHiz2X;
    kare2HizY = yeniHiz2Y;
    carpismaSayisiArttir();
  }

  // Ekran sınırlarına çarpma kontrolü
  if (kare1X <= xEkseniSiniri) {
    kare1HizX *= -1;
    carpismaSayisiArttir();
  }

  if (kare2X <= 0) {
    kare2HizX *= -1;
  }
}

void carpismaSayisiArttir() {
  carpismaSayisi +=1 ; //<>//
  println(carpismaSayisi);
}

// Karelerin çarpışma kontrolü
boolean karelerCarpisti() {
  return kare1X + kare1Boyut >= kare2X && kare1X <= kare2X + kare2Boyut;
}
void kareleriCiz() {
  fill(50);
  rect(kare1X, kare1Y, kare1Boyut, kare1Boyut);
  text("KG: " + kare1Kutle, kare1X, kare1Y);

  fill(200);
  rect(kare2X, kare2Y - kare1Boyut, kare2Boyut, kare2Boyut);

  text("KG: " + kare2Kutle, kare2X, kare2Y - kare1Boyut);
  line(xEkseniSiniri, 0, xEkseniSiniri, height);
  line(xEkseniSiniri, kare2Y - kare1Boyut + kare2Boyut, width, kare2Y - kare1Boyut + kare2Boyut);
}
