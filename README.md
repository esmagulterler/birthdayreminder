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

### Packages
```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^3.8.0
  firebase_auth: ^5.3.3
  google_sign_in: ^6.2.0
  supabase_flutter: ^2.9.3
  intl: ^0.19.0
  flutter_localizations:
    sdk: flutter
```

## 🚀 Kurulum

### 1. Gereksinimler
- Flutter SDK (3.0+)
- Dart SDK (3.0+)
- Android Studio / VS Code
- Firebase Account
- Supabase Account

### 2. Proje Klonlama
```bash
git clone <repository-url>
cd birthdayreminder
```

### 3. Dependencies Yükleme
```bash
flutter pub get
```

### 4. Firebase Yapılandırması

#### Firebase Console
1. [Firebase Console](https://console.firebase.google.com/) → Yeni proje oluştur
2. **Authentication** → **Sign-in method** → Enable:
   - Email/Password
   - Google
   - GitHub (opsiyonel)

#### Firebase Config
`lib/firebase_options.dart` dosyasını Firebase CLI ile oluşturun:
```bash
firebase login
flutterfire configure
```

#### Web için Google Client ID
`web/index.html` dosyasına Google Client ID ekleyin:
```html
<meta name="google-signin-client_id" content="YOUR_GOOGLE_CLIENT_ID.googleusercontent.com">
```

### 5. Supabase Yapılandırması

#### Supabase Console
1. [Supabase](https://supabase.com/) → Yeni proje oluştur
2. **SQL Editor**'da aşağıdaki tabloyu oluşturun:

```sql
-- Doğum günleri tablosu
CREATE TABLE birthdays (
    id BIGSERIAL PRIMARY KEY,
    user_id TEXT NOT NULL,
    name TEXT NOT NULL,
    birthday_date DATE NOT NULL,
    note TEXT DEFAULT '',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Güncellenme zamanını otomatik güncelle
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_birthdays_updated_at 
    BEFORE UPDATE ON birthdays
    FOR EACH ROW 
    EXECUTE FUNCTION update_updated_at_column();

-- Row Level Security (RLS) - Şimdilik kapalı
ALTER TABLE birthdays DISABLE ROW LEVEL SECURITY;

-- İndeksler (performans için)
CREATE INDEX IF NOT EXISTS birthdays_user_id_idx ON birthdays(user_id);
CREATE INDEX IF NOT EXISTS birthdays_birthday_date_idx ON birthdays(birthday_date);
```

#### Supabase Config
`lib/main.dart` dosyasında Supabase URL ve anon key'i güncelleyin:
```dart
await Supabase.initialize(
  url: 'YOUR_SUPABASE_URL',
  anonKey: 'YOUR_SUPABASE_ANON_KEY',
);
```

## 🖥️ Çalıştırma

### Web
```bash
flutter run -d chrome
```

### Android
```bash
flutter run
```

### iOS
```bash
flutter run -d ios
```

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

## 🔐 Authentication Flow

```
Login Page → Firebase Auth → Home Page
     ↓
   Success → Supabase ile veri operations
     ↓
   Logout → Clear session & return to Login
```

## 🎯 Kullanım

1. **Kayıt/Giriş**: Email/şifre, Google veya GitHub ile
2. **Doğum Günü Ekleme**: + butonuna tıklayın
3. **Arama**: Üst kısımdaki arama kutusunu kullanın
4. **Düzenleme**: Doğum günü kartındaki butonları kullanın
5. **İstatistikler**: Ana sayfada özet bilgileri görün

## ⚠️ Bilinen Problemler

- GitHub login sadece web platformunda çalışır
- RLS (Row Level Security) şu anda kapalı - güvenlik için etkinleştirin
- Bildirimler henüz implement edilmemiş

## 🛠️ Geliştirme

### Debug Mode
```bash
flutter run --debug
```

### Release Build
```bash
# Android
flutter build apk --release

# Web
flutter build web --release

# iOS
flutter build ios --release
```

### Testing
```bash
flutter test
```

## 📄 License

MIT License - Detaylar için [LICENSE](LICENSE) dosyasını görün.

## 👥 Katkıda Bulunma

1. Fork edin
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Commit edin (`git commit -m 'Add amazing feature'`)
4. Push edin (`git push origin feature/amazing-feature`)
5. Pull Request açın

## 📞 İletişim

Sorularınız için issue açabilirsiniz.

---

### 🎉 Doğum günlerini unutmayın, sevdiklerinizi mutlu edin! 🎂 