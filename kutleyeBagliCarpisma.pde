float kare1X, kare1Y; // Kare 1'in pozisyonu
float kare1HizX, kare1HizY; // Kare 1'in hızı
float kare1Kutle; // Kare 1'in kütlesi

float kare2X, kare2Y; // Kare 2'nin pozisyonu
float kare2HizX, kare2HizY; // Kare 2'nin hızı
float kare2Kutle; // Kare 2'nin kütlesi
int carpismaSayisi = 0;

void setup() {
  size(800, 400);

  // Kare 1'in başlangıç değerleri
  kare1X = 200;
  kare1Y = height / 2;
  kare1HizX = 0;
  kare1HizY = 0;
  kare1Kutle = 2;

  // Kare 2'nin başlangıç değerleri
  kare2X = 400;
  kare2Y = height / 2;
  kare2HizX = -3;
  kare2HizY = 0;
  kare2Kutle = 20;
  print("kare 1 'in kütlesi" + kare1Kutle);
  print("kare 2 'nin kütlesi" + kare2Kutle);
}

void draw() {
  background(150);

  // Kareleri çizdirme
  fill(50);
  noStroke();
  rect(kare1X, kare1Y, 50, 50);

  fill(200);
  noStroke();
  rect(kare2X, kare2Y, 50, 50);

  // Karelerin hareketi
  kare1X += kare1HizX;
  kare1Y += kare1HizY;

  kare2X += kare2HizX;
  kare2Y += kare2HizY;

  // Karelerin çarpışmasını kontrol etme
  if (karelerCarpisti()) {

    carpismaSayisi +=1 ;
    println(carpismaSayisi);

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
  }

  // Ekran sınırlarına çarpma kontrolü
  if (kare1X <= 0 || kare1X >= width - 50) {
    kare1HizX *= -1;
  }
  if (kare1Y <= 0 || kare1Y >= height - 50) {
    kare1HizY *= -1;
  }

  if (kare2X <= 0 || kare2X >= width - 50) {
    kare2HizX *= -1;
  }
  if (kare2Y <= 0 || kare2Y >= height - 50) {
    kare2HizY *= -1;
  }
}

// Karelerin çarpışma kontrolü
boolean karelerCarpisti() {
  if (kare1X + 50 >= kare2X && kare1X <= kare2X + 50 && kare1Y + 50 >= kare2Y && kare1Y <= kare2Y + 50) {
    return true;
  }
  return false;
}
