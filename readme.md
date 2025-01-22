
# README.md: Cara Menggunakan Terraform

## 📘 **Pendahuluan**
Terraform adalah alat Infrastructure as Code (IaC) yang memungkinkan Anda mengelola infrastruktur secara deklaratif. Dengan Terraform, Anda dapat membuat, memperbarui, dan menghapus sumber daya di berbagai cloud provider seperti AWS, GCP, dan Azure, serta layanan on-premises. Berikut untuk informasi lebih detail terkait [terraform](https://www.terraform.io/)

File ini akan memandu Anda dalam menggunakan Terraform dengan cara yang mudah dan terstruktur.

---

## 🛠 **Persyaratan**
Sebelum memulai, pastikan Anda telah menyiapkan:
1. **Terraform**:
   - Jika belum menginstall terraform, unduh dan instal Terraform dari [terraform.io](https://www.terraform.io/downloads).
2. **Konfigurasi API Key atau Credentials**:
   - Contoh: Simpan Service Account File JSON GCP di dalam folder `/iac-pgd/service-account`
3. **Editor Teks**:
   - Gunakan editor seperti **VS Code** atau **Vim** untuk mengedit file `.tf`.

---

## ⚙️ **Langkah-Langkah**

### 1. **Clone Repository**
Pastikan repository ini telah di clone, jika belum jalankan command line berikut:
```bash
git clone https://github.com/mhmd-deniafendi/iac-pgd.git
cd /iac-pgd/pgd-phase2-iac
```

### 2. **Inisialisasi Terraform**
Inisialisasi proyek Terraform untuk mendownload plugin provider yang diperlukan:
```bash
terraform init
```

### 3. **Melihat Rencana Infrastruktur**
Gunakan perintah berikut untuk melihat sumber daya yang akan dibuat:
```bash
terraform plan
```

Hasilnya akan menampilkan ringkasan sumber daya (resource) yang akan dibuat tanpa benar-benar menerapkannya. Jika hanya ingin membuat sumber daya (resource) tertentu gunakan:
```bash
terraform plan -target=module.compute-engine
```
Ganti `module.compute-engine` dengan nama module sumber daya (resource) yang ingin dibuat

### 4. **Perhatikan Ringkasan: Add, Change dan Destroy
1. **Add**:
   - Jumlah dari sumber daya atau resource yang akan dibuat
2. **Change**:
   - Jumlah dari sumber daya atau resource yang akan dirubah
3. **Desrtoy**:
   - Jumlah dari sumber daya atau resource yang akan dihapus

### 5. **Menerapkan Konfigurasi**
Gunakan perintah ini untuk membuat sumber daya yang telah didefinisikan:
```bash
terraform apply
```
Masukkan `yes` jika diminta konfirmasi. Jika hanya ingin membuat sumber daya atau resource tertentu gunakan ini:
```bash
terraform apply -target=module.compute-engine
```
Ganti `module.compute-engine` dengan nama module sumber daya (resource) yang ingin dibuat

### 6. **Mengelola Infrastruktur**
- **Memperbarui Konfigurasi**: Perbarui file `.tf` Anda, lalu jalankan:
  ```bash
  terraform plan
  terraform apply
  ```

- **Menghapus Infrastruktur**: Untuk menghapus semua sumber daya yang telah dibuat:
  ```bash
  terraform destroy
  ```

---

## 📝 **Struktur Direktori**
Contoh struktur direktori untuk proyek Terraform:
```
my-terraform-project/
├── main.tf          # Konfigurasi utama
├── variables.tf     # Definisi variabel
├── terraform.tfvars # Nilai variabel
├── outputs.tf       # Output dari Terraform
└── README.md        # Dokumentasi proyek
```

---

## 💡 **Note**
**Selalu Review**:
   - Jalankan `terraform plan` sebelum `apply` untuk memastikan perubahan yang benar akan diterapkan.

---

## 📚 **Referensi**
- [Dokumentasi Terraform](https://www.terraform.io/docs)
- [HashiCorp Learn Terraform](https://learn.hashicorp.com/terraform)
- [Contoh Proyek Terraform di GitHub](https://github.com/topics/terraform)

---

Selamat mencoba dan semoga sukses mengelola infrastruktur Anda dengan Terraform! 🚀
