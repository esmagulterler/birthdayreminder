-- Doğum günleri tablosunu oluştur
CREATE TABLE IF NOT EXISTS birthdays (
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

-- Row Level Security (RLS) politikalarını etkinleştir
ALTER TABLE birthdays ENABLE ROW LEVEL SECURITY;

-- Kullanıcılar sadece kendi verilerini görebilir
CREATE POLICY "Users can view own birthdays" ON birthdays
    FOR SELECT USING (user_id = auth.uid()::text);

-- Kullanıcılar sadece kendi verilerini ekleyebilir
CREATE POLICY "Users can insert own birthdays" ON birthdays
    FOR INSERT WITH CHECK (user_id = auth.uid()::text);

-- Kullanıcılar sadece kendi verilerini güncelleyebilir
CREATE POLICY "Users can update own birthdays" ON birthdays
    FOR UPDATE USING (user_id = auth.uid()::text);

-- Kullanıcılar sadece kendi verilerini silebilir
CREATE POLICY "Users can delete own birthdays" ON birthdays
    FOR DELETE USING (user_id = auth.uid()::text);

-- İndeksler oluştur (performans için)
CREATE INDEX IF NOT EXISTS birthdays_user_id_idx ON birthdays(user_id);
CREATE INDEX IF NOT EXISTS birthdays_birthday_date_idx ON birthdays(birthday_date); 