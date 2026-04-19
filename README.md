# Skincare Essentials - Mobil Katalog Uygulaması

Bu proje, Flutter ile geliştirilmiş, kullanıcıların cilt bakım ürünlerini inceleyebileceği, arama yapabileceği ve ürünleri sepetine ekleyebileceği dinamik bir Mini Katalog Uygulamasıdır.

## 🚀 Proje Özellikleri
- **Dinamik Veri Yönetimi:** Ürün bilgileri yerel bir JSON dosyasından (`assets/products.json`) asenkron olarak çekilmektedir.
- **Gelişmiş Arama:** Kullanıcılar ürün adına veya markasına göre gerçek zamanlı filtreleme yapabilir.
- **Katalog Görünümü:** `GridView.builder` kullanılarak kart tabanlı şık bir ürün listeleme yapısı kurulmuştur.
- **Detay Sayfası:** `Navigator` ve `Route Arguments` kullanılarak her ürünün detaylı açıklamasına ve fiyat bilgisine erişim sağlanmıştır.
- **Sepet Sistemi:** `StatefulWidget` ve `setState` kullanılarak ürünlerin sepete eklenmesi ve sepetten çıkarılması simüle edilmiştir.

## 🛠️ Teknik Detaylar
- **Framework:** Flutter
- **Dil:** Dart
- **State Yönetimi:** `setState` (Basit State Güncelleme)
- **Veri Formatı:** JSON (Asset Management)
- **Klasör Yapısı:** - `lib/models`: Veri modelleri (Product class)
  - `lib/screens`: Uygulama sayfaları (Home, Detail, Cart)
  - `lib/widgets`: Tekrar kullanılabilir arayüz elemanları
  - `assets`: Yerel veri dosyaları

## 📂 Kurulum ve Çalıştırma
1. Bu depoyu klonlayın:
   ```bash
   git clone [https://github.com/asude2/skincare_katalog.git](https://github.com/asude2/skincare_katalog.git)
   
2. Proje dizinine gidin:
   cd skincare_katalog
  
3. Gerekli paketleri yükleyin:
   flutter pub get
   
4. Uygulamayı çalıştırın:
   flutter run

   

## 📸 Ekran Görüntüleri

| Ana Sayfa | Ürün Detay | Sepetim | Filtrelenmiş Ürünler | Boş Sepet
| <img width="694" height="1422" alt="image" src="https://github.com/user-attachments/assets/965adc96-45da-4341-8221-e0661dda9764" />
 | <img width="689" height="1438" alt="image" src="https://github.com/user-attachments/assets/da44a300-5fe1-42e1-b358-8b56d84fa8ec" />
 | <img width="689" height="1431" alt="image" src="https://github.com/user-attachments/assets/eb1964cf-81fc-42bc-81ab-82a19a5784ba" />
 | <img width="691" height="1388" alt="image" src="https://github.com/user-attachments/assets/791d7964-d28e-49ae-90b1-e7dc9da44fcd" />
 | <img width="666" height="1459" alt="image" src="https://github.com/user-attachments/assets/91af9605-71df-43c4-99a7-505e2bb13b65" />



