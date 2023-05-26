# Employee Tracking System

Employee Tracking System, bir şirketin çalışanlarının, departmanlarının, hizmetlerinin ve izinlerinin takibini yapmak için kullanılan bir veritabanı projesidir.

## Kurulum

1. Projenin tamamını bilgisayarınıza indirin veya klonlayın.
2. Veritabanını oluşturmak için `Employee_Tracking_System.sql` dosyasını MSSQL veritabanı yönetim aracınızda çalıştırın.
3. Proje klasöründe, gerekli SQL kodlarına `Trigger.sql` ve `View.sql` dosyalarında ulaşabilirsiniz. Bu kodları kullanarak tetikleyicileri ve görünümleri ekleyebilirsiniz.

## Kullanım

Proje, çalışanlar, departmanlar, hizmetler, izinler ve diğer ilgili verilerin takibi için bir veritabanı sunmaktadır. Aşağıda bazı temel kullanım örnekleri bulunmaktadır:

- **EmpInfo** görünümü, çalışanların isimleri, telefon numaraları, e-posta adresleri, departmanları, rolleri ve maaşları gibi bilgileri listeler.
- **EmpTimeLog** görünümü, çalışanların giriş ve çıkış saatlerini gösterir.
- **EmpService** görünümü, çalışanların hizmet bilgilerini, plaka numaralarını ve sürücü isimlerini gösterir.
- **LeaveDaysEmployee** görünümü, çalışanların her ay aldığı izin günlerini gösterir.

Detaylı kullanım talimatları için, proje içerisindeki diğer kod dosyalarına ve belgelendirmelere bakabilirsiniz.

## Tetikleyiciler

Projede yer alan bazı tetikleyiciler de bulunmaktadır:

- **tg_CheckSeats**: Yeni bir çalışan eklendiğinde, hizmetteki boş koltuk sayısını kontrol eder ve eğer boş koltuk yoksa hata mesajı döndürür.
- **tg_PermissionInsert**: İzin eklendiğinde, çalışanın mevcut izin sayısını kontrol eder ve izin sayısı uygun değilse hata mesajı döndürür.

Detaylı kullanım talimatları için ilgili kod dosyalarını ve belgelendirmeleri inceleyebilirsiniz.

## İletişim

Proje ile ilgili sorularınız veya geri bildirimleriniz için lütfen [sametertugrulbuyukevli@gmail.com] adresine e-posta gönderin.

Bu README dosyası, Employee Tracking System projesinin kullanımı ve katkıda bulunma süreci hakkında temel bilgileri içermektedir. Detaylı bilgiler için ilgili kod dosyalarını ve belgelendirmeleri inceleyebilirsiniz. Projeyle ilgili herhangi bir sorunuz veya destek talebiniz varsa, iletişim bilgilerini kullanarak bize ulaşabilirsiniz.
