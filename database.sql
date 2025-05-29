/* 
 * ======================================================
 *                    DATABASE YARATISH                  
 * ======================================================
 */

-- 1. Avvalgi mavjud database bo‘lsa, uni o‘chirish
DROP DATABASE IF EXISTS messager_db;

-- 2. Yangi database yaratish
CREATE DATABASE messager_db;

-- 3. Yaratilgan database'ni aktivlashtirish
USE messager_db;

-- Foydalanuvchilar jadvali: foydalanuvchi ma'lumotlari saqlanadi
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Xabarlar jadvali: foydalanuvchilar orasidagi yozishmalar saqlanadi
CREATE TABLE messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    content TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

-- Demo maqsadida 4 ta foydalanuvchi qo‘shilmoqda
INSERT INTO users (name, username, password)
VALUES 
('Iqbolshoh Ilhomjonov', 'iqbolshoh', '$2y$10$gIKUrsLRB.U7ee9Fv9nib.di2NgMYvAeqqWGoB5aFXpHoxIv/igkW'),
('Sindor Ostonov', 'sindor', '$2y$10$gIKUrsLRB.U7ee9Fv9nib.di2NgMYvAeqqWGoB5aFXpHoxIv/igkW'),
('Doston Davlatov', 'doston', '$2y$10$gIKUrsLRB.U7ee9Fv9nib.di2NgMYvAeqqWGoB5aFXpHoxIv/igkW'),
('Elnazar Sharopov', 'elnazar', '$2y$10$gIKUrsLRB.U7ee9Fv9nib.di2NgMYvAeqqWGoB5aFXpHoxIv/igkW');

-- Foydalanuvchilar orasida yozilgan 40 ta xabarni qo‘shamiz
INSERT INTO messages (sender_id, receiver_id, content, is_read)
VALUES 
(1, 2, 'Salom Sindor, ishlaring yaxshimi?', true),
(2, 1, 'Salom Iqbolshoh! Ha, yaxshi. Oʻzingchi?', true),
(3, 1, 'Assalomu alaykum Iqbolshoh aka! Yordam kerak edi.', true),
(1, 3, 'Va alaykum assalom Doston. Albatta, aytavering.', true),
(2, 3, 'Doston, bugungi uchrashuv soat nechada edi?', true),
(3, 2, 'Soat 3:00 da boshlanadi.', true),
(4, 1, 'Iqbolshoh, loyihani yubordingizmi?', true),
(1, 4, 'Ha, Elnazar, emailingizga yubordim.', true),
(3, 4, 'Elnazar, sen ham tayyormisan?', true),
(4, 3, 'Ha, Doston. Hamma narsa joyida.', true),
(2, 4, 'Elnazar, menga ham faylni yubora olasizmi?', true),
(4, 2, 'Albatta, hozir jo‘nataman.', true),
(1, 2, 'Sindor, frontend qismi tugadimi?', true),
(2, 1, 'Ha, endi backend qismi sizda.', true),
(3, 1, 'Bugun yigʻilish bor edi, esingdami?', true),
(1, 3, 'Ha, albatta. Zoom linkni tashlaysizmi?', true),
(4, 1, 'Zoom link bu yerda: zoom.com/meeting123', true),
(1, 4, 'Rahmat, Elnazar.', true),
(2, 3, 'Doston, dizaynni o‘zgartirish kerakmi?', true),
(3, 2, 'Ha, kichik o‘zgarishlar kiritamiz.', true),
(2, 4, 'Elnazar, texnik hujjatlarni tayyorlab qo‘ying.', true),
(4, 2, 'Bo‘ldi, ertalabgacha tugataman.', true),
(1, 3, 'Doston, kodlar to‘liq ishga tushadimi?', true),
(3, 1, 'Ha, testdan o‘tdi. Hamma narsa joyida.', true),
(4, 1, 'Yangi modulni qachon birlashtiramiz?', true),
(1, 4, 'Bugun kechqurun merge qilamiz.', true),
(2, 1, 'Login sahifasida kichik muammo bor.', true),
(1, 2, 'Screenshot yuboring, ko‘rib chiqaman.', true),
(3, 2, 'Bugungi deadline esingizda bo‘lsin.', true),
(2, 3, 'Albatta, vaqtida topshiraman.', true),
(4, 3, 'Grafik interfeysni yaxshilash kerak.', true),
(3, 4, 'Takliflaringizni kutyapman.', true),
(1, 2, 'Profil sozlamalari qismi tayyormi?', true),
(2, 1, 'Yarimtayyor, bugun tugataman.', true),
(4, 2, 'Sindor, siz REST API ustida ishlayapsizmi?', true),
(2, 4, 'Ha, ayni damda endpointlarni tekshiryapman.', true),
(1, 3, 'Test qamrovini oshirish kerak.', true),
(3, 1, 'Qancha foizgacha oshiramiz?', true),
(1, 3, 'Kamida 80% bo‘lishi kerak.', false),
(4, 1, 'Texnik qarorlarni jamlab chiqyapman.', false);