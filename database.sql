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
INSERT INTO messages (sender_id, receiver_id, content)
VALUES 
(1, 2, 'Salom Sindor, ishlaring yaxshimi?'),
(2, 1, 'Salom Iqbolshoh! Ha, yaxshi. Oʻzingchi?'),
(3, 1, 'Assalomu alaykum Iqbolshoh aka! Yordam kerak edi.'),
(1, 3, 'Va alaykum assalom Doston. Albatta, aytavering.'),
(2, 3, 'Doston, bugungi uchrashuv soat nechada edi?'),
(3, 2, 'Soat 3:00 da boshlanadi.'),
(4, 1, 'Iqbolshoh, loyihani yubordingizmi?'),
(1, 4, 'Ha, Elnazar, emailingizga yubordim.'),
(3, 4, 'Elnazar, sen ham tayyormisan?'),
(4, 3, 'Ha, Doston. Hamma narsa joyida.'),
(2, 4, 'Elnazar, menga ham faylni yubora olasizmi?'),
(4, 2, 'Albatta, hozir jo‘nataman.'),
(1, 2, 'Sindor, frontend qismi tugadimi?'),
(2, 1, 'Ha, endi backend qismi sizda.'),
(3, 1, 'Bugun yigʻilish bor edi, esingdami?'),
(1, 3, 'Ha, albatta. Zoom linkni tashlaysizmi?'),
(4, 1, 'Zoom link bu yerda: zoom.com/meeting123'),
(1, 4, 'Rahmat, Elnazar.'),
(2, 3, 'Doston, dizaynni o‘zgartirish kerakmi?'),
(3, 2, 'Ha, kichik o‘zgarishlar kiritamiz.'),
(2, 4, 'Elnazar, texnik hujjatlarni tayyorlab qo‘ying.'),
(4, 2, 'Bo‘ldi, ertalabgacha tugataman.'),
(1, 3, 'Doston, kodlar to‘liq ishga tushadimi?'),
(3, 1, 'Ha, testdan o‘tdi. Hamma narsa joyida.'),
(4, 1, 'Yangi modulni qachon birlashtiramiz?'),
(1, 4, 'Bugun kechqurun merge qilamiz.'),
(2, 1, 'Login sahifasida kichik muammo bor.'),
(1, 2, 'Screenshot yuboring, ko‘rib chiqaman.'),
(3, 2, 'Bugungi deadline esingizda bo‘lsin.'),
(2, 3, 'Albatta, vaqtida topshiraman.'),
(4, 3, 'Grafik interfeysni yaxshilash kerak.'),
(3, 4, 'Takliflaringizni kutyapman.'),
(1, 2, 'Profil sozlamalari qismi tayyormi?'),
(2, 1, 'Yarimtayyor, bugun tugataman.'),
(4, 2, 'Sindor, siz REST API ustida ishlayapsizmi?'),
(2, 4, 'Ha, ayni damda endpointlarni tekshiryapman.'),
(1, 3, 'Test qamrovini oshirish kerak.'),
(3, 1, 'Qancha foizgacha oshiramiz?'),
(1, 3, 'Kamida 80% bo‘lishi kerak.'),
(4, 1, 'Texnik qarorlarni jamlab chiqyapman.');