# 🎂 Birthday Reminder App

Sevdiklerinizin doğum günlerini unutmayın! Modern Flutter tabanlı doğum günü hatırlatma uygulaması.

## ✨ Özellikler

### 🔐 Authentication (Kimlik Doğrulama)
- ✅ Email/Şifre ile giriş ve kayıt
- ✅ Google ile giriş (Web & Mobile)
- ✅ GitHub ile giriş (Web)
- ✅ Firebase Authentication entegrasyonu

### 🎉 Doğum Günü Yönetimi
- ✅ Doğum günü ekleme, düzenleme, silme
- ✅ Akıllı yaş hesaplama
- ✅ Kalan gün hesaplama
- ✅ Bugünkü doğum günleri özel gösterimi
- ✅ Yaklaşan doğum günleri (7 gün)

### 🔍 Gelişmiş Arama ve Filtreleme
- ✅ İsim ile arama
- ✅ Not ile arama
- ✅ Gerçek zamanlı filtreleme
- ✅ Sonuç sayısı gösterimi

### 📊 İstatistikler
- ✅ Toplam doğum günü sayısı
- ✅ Bu ayki doğum günleri
- ✅ Bugünkü doğum günleri

### 🎨 Modern UI/UX
- ✅ Material Design 3
- ✅ Gradient arka planlar
- ✅ Responsive tasarım
- ✅ Türkçe dil desteği
- ✅ Loading states
- ✅ Error handling

## 🏗️ Teknoloji Stack

### Frontend
- **Flutter** - Cross-platform mobile framework
- **Dart** - Programming language
- **Material Design 3** - UI components

### Backend & Services
- **Firebase Authentication** - User management
- **Supabase** - Database (PostgreSQL)
- **Firebase Core** - App configuration

📄 Uygulama Sayfaları ve İşlevleri
Ana Sayfa (home_page.dart)
Kullanıcı giriş yaptıktan sonra karşısına çıkan ilk sayfadır. Uygulamadaki genel navigasyon bu sayfa üzerinden sağlanır.

Doğum Günleri Sayfası (birthdays_page.dart)
Kullanıcının eklediği doğum günü listelerini görüntülediği sayfadır. Buradan doğum günü yönetimi yapılabilir.

Doğum Günü Ekleme Sayfası (add_birthday_page.dart)
Yeni doğum günü eklemek için kullanılır. İsim, tarih gibi bilgiler bu sayfa üzerinden kaydedilir.

Giriş Sayfası (login_page.dart)
Kullanıcıların e-posta ve şifre ile giriş yapabildiği sayfadır. Firebase kimlik doğrulaması burada kullanılır.

Kayıt Olma Sayfası (register_page.dart)
Yeni kullanıcıların hesap oluşturabileceği sayfa. Firebase ile entegre çalışır.

Profil Sayfası (profile_page.dart)
Kullanıcı bilgilerini görüntüleyebileceği ve düzenleyebileceği sayfa.

Ayarlar Sayfası (settings_page.dart)
Tema yönetimi, bildirim ayarları gibi kişisel tercihler burada düzenlenebilir.

Bildirimler Sayfası (notifications_page.dart)
Kullanıcıya gönderilmiş doğum günü bildirimleri burada görüntülenir.

⚙️ Uygulama İç Yapısı ve Yardımcı Bileşenler
Ana Uygulama (main.dart)
Uygulamanın başlangıç noktasıdır. Tema ve yönlendirme işlemleri burada tanımlıdır.

Kayıt Modeli (register.dart)
Kullanıcı kayıt işlemlerinde kullanılan yardımcı yapılar burada bulunur.

Kullanıcı Yerel Veritabanı (user_local_db.dart)
Kullanıcının yerel cihazında saklanacak verileri yönetir.

Kullanıcı Yerel Depolama Servisi (user_local_storage.dart)
SharedPreferences veya benzeri yöntemlerle kullanıcı verilerini cihazda saklamaya yardımcı olur.

Temel Sayfa Yapısı (base_page.dart)
Sayfalar için ortak yapı ve düzen bileşenleri içerir.

Yan Menü (drawer_menu.dart)
Uygulama içi gezintide kullanılan açılır menü yapısı.

Widgetlar (widgets/...)
Uygulamada tekrar kullanılan özel butonlar, kartlar ve benzeri bileşenler burada bulunur.

## 🚀 Kurulum

### 1. Gereksinimler
- Flutter SDK (3.0+)
- Dart SDK (3.0+)
- Android Studio / VS Code
- Firebase Account
- Supabase Account


## 📱 Uygulama Yapısı

```
lib/
├── main.dart                 # Ana uygulama giriş noktası
├── firebase_options.dart     # Firebase yapılandırması
├── auth_service.dart         # Authentication servisi
├── birthday_service.dart     # Doğum günü CRUD işlemleri
├── home_page.dart           # Ana sayfa - İstatistikler
├── login_page.dart          # Giriş sayfası
├── register_page.dart       # Kayıt sayfası
├── birthdays_page.dart      # Doğum günleri listesi
├── add_birthday_page.dart   # Doğum günü ekleme
├── drawer_widget.dart       # Navigasyon drawer
├── custom_app_bar.dart      # Özel AppBar component
└── ...
```

## 🗄️ Veritabanı Şeması

### `birthdays` Tablosu
| Sütun | Tip | Açıklama |
|-------|-----|----------|
| `id` | BIGSERIAL | Primary key |
| `user_id` | TEXT | Firebase UID |
| `name` | TEXT | Kişi adı |
| `birthday_date` | DATE | Doğum tarihi |
| `note` | TEXT | Opsiyonel not |
| `created_at` | TIMESTAMPTZ | Oluşturulma zamanı |
| `updated_at` | TIMESTAMPTZ | Güncellenme zamanı |

## 🎯 Kullanım

1. **Kayıt/Giriş**: Email/şifre, Google veya GitHub ile
2. **Doğum Günü Ekleme**: + butonuna tıklayın
3. **Arama**: Üst kısımdaki arama kutusunu kullanın
4. **Düzenleme**: Doğum günü kartındaki butonları kullanın
5. **İstatistikler**: Ana sayfada özet bilgileri görün

👤 Örnek Kullanıcılar
Test amacıyla oluşturulmuş örnek kullanıcı hesapları aşağıda verilmiştir:

KULLANICILAR:

E-POSTA:hgencoglu@gmail.com	ŞİFRE: 123456	USER UID: 9DfJcSjrTvW0tNQyB5fcskhvaG62	EKLENME TARİHİ: 18.06.2025
E-POSTA:esma@gmail.com	    ŞİFRE: 123456  USER UID: 3tWyvQjW9KRAZ4O7Un9dgQWlwE83	 EKLENME TARİHİ: 18.06.2025

⚠️ Not: Bu kullanıcılar sadece test amaçlı oluşturulmuştur.


BU PROJE ESMANUR GÜLTERLER TARAFINDAN OLUŞTURULMUŞTUR.

## 📞 İletişim

Sorularınız için bize ulaşabilirsiniz.

---

### 🎉 Doğum günlerini unutmayın, sevdiklerinizi mutlu edin! 🎂 
