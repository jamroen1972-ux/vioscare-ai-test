# พัดลมดี — ระบบขาย ซ่อม สต๊อก และใบรับประกัน

ชุดไฟล์เว็บสำหรับ GitHub Pages และติดตั้งเป็นแอปจากเมนู Chrome บนโทรศัพท์ได้ ไม่มีปุ่มติดตั้งแยกอยู่ในหน้าเว็บ

## ไฟล์ในชุดนี้

- `index.html` — เว็บแอป
- `manifest.webmanifest`, `sw.js`, `fan-icon-192.png`, `fan-icon-512.png` — การติดตั้งและใช้งานออฟไลน์
- `supabase.min.js` — Supabase JavaScript SDK
- `supabase-schema.sql` — สำเนาโครงสร้างตารางและนโยบายความปลอดภัย
- `fan-hero-banner*.png` — ภาพหน้าร้าน

## เริ่มบันทึกข้อมูลใหม่

1. อัปโหลดไฟล์ทั้งหมดในโฟลเดอร์นี้เข้า `fan-sales-warranty` บน GitHub Pages
2. เปิดเว็บและเข้าเมนู **โปรไฟล์ร้าน**
3. กด **ล้างข้อมูลเก่าและเริ่มใหม่** แล้วยืนยัน

ระบบจะล้างรายการขาย งานซ่อม สต๊อก ประวัติรับเข้า/เบิกออก และประกาศขาย โดยเก็บโปรไฟล์ร้านไว้ รหัสสินค้าใหม่จะเริ่มจาก FAN-0001 และเลขเครื่อง FN-0001 ข้อมูลที่ล้างแล้วกู้คืนไม่ได้

## ซิงก์ข้อมูลกับ Supabase

ตาราง `public.fan_shop_data` และ RLS ตั้งค่าไว้แล้ว การซิงก์ต้องเข้าสู่ระบบก่อน ปุ่มเชื่อมข้อมูลอยู่ในหน้า **โปรไฟล์ร้าน**

ขณะนี้ Supabase แจ้ง `Unsupported provider: provider is not enabled` เพราะ GitHub ยังไม่ได้เปิดเป็นผู้ให้บริการเข้าสู่ระบบใน Supabase Auth จึงต้องตั้งค่าครั้งเดียวก่อน:

1. ใน GitHub สร้าง OAuth App โดยใช้ URL เว็บพัดลมดีเป็น Homepage URL
2. ใช้ Callback URL นี้ใน GitHub OAuth App: `https://krhqrfmwvxtcrugbhywv.supabase.co/auth/v1/callback`
3. ใน Supabase เปิด **Authentication → Sign In / Providers → GitHub** แล้วใส่ Client ID และ Client Secret จาก GitHub OAuth App
4. ใน Supabase ตั้ง Site URL และ Redirect URL ให้ตรงกับเว็บ: `https://jamroen1972-ux.github.io/vioscare-ai-test/fan-sales-warranty/**`
5. กลับหน้าเว็บแล้วแตะ **เชื่อมข้อมูลกับ Supabase** ในโปรไฟล์ร้าน

เก็บ Client Secret ไว้ใน GitHub OAuth และ Supabase Dashboard เท่านั้น ห้ามใส่ใน `index.html` หรือไฟล์เว็บ

## ติดตั้งบน Android

เปิดเว็บที่เผยแพร่แล้วใน Chrome ผ่าน HTTPS จากนั้นเลือก **ติดตั้งแอป** หรือ **เพิ่มลงในหน้าจอหลัก** ในเมนู Chrome `⋮` ได้เลย
