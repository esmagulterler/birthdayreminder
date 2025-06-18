-- Firebase Auth UID'leri TEXT formatında olduğu için user_id sütununu UUID'den TEXT'e çevirelim

-- Önce mevcut veriler varsa yedekle (opsiyonel)
-- CREATE TABLE birthdays_backup AS SELECT * FROM birthdays;

-- Sütun tipini değiştir
ALTER TABLE birthdays 
ALTER COLUMN user_id TYPE TEXT;

-- Eğer tablo henüz yoksa, doğru tiplerle oluştur
CREATE TABLE IF NOT EXISTS birthdays (
    id BIGSERIAL PRIMARY KEY,
    user_id TEXT NOT NULL,  -- UUID değil TEXT!
    name TEXT NOT NULL,
    birthday_date DATE NOT NULL,
    note TEXT DEFAULT '',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- RLS politikalarını güncelle (Firebase Auth UID'leri için)
ALTER TABLE birthdays ENABLE ROW LEVEL SECURITY;

-- Eski politikaları sil
DROP POLICY IF EXISTS "Users can view own birthdays" ON birthdays;
DROP POLICY IF EXISTS "Users can insert own birthdays" ON birthdays;
DROP POLICY IF EXISTS "Users can update own birthdays" ON birthdays;
DROP POLICY IF EXISTS "Users can delete own birthdays" ON birthdays;

-- Yeni politikalar oluştur (TEXT karşılaştırması ile)
CREATE POLICY "Users can view own birthdays" ON birthdays
    FOR SELECT USING (user_id = current_setting('request.jwt.claims', true)::json->>'sub');

CREATE POLICY "Users can insert own birthdays" ON birthdays
    FOR INSERT WITH CHECK (user_id = current_setting('request.jwt.claims', true)::json->>'sub');

CREATE POLICY "Users can update own birthdays" ON birthdays
    FOR UPDATE USING (user_id = current_setting('request.jwt.claims', true)::json->>'sub');

CREATE POLICY "Users can delete own birthdays" ON birthdays
    FOR DELETE USING (user_id = current_setting('request.jwt.claims', true)::json->>'sub');

-- İndeksler
CREATE INDEX IF NOT EXISTS birthdays_user_id_idx ON birthdays(user_id);
CREATE INDEX IF NOT EXISTS birthdays_birthday_date_idx ON birthdays(birthday_date); 