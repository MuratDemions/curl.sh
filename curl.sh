#!/bin/bash

# Betiğin root yetkisiyle çalıştırılıp çalıştırılmadığını kontrol et
if [ "$EUID" -ne 0 ]; then
  echo "Lütfen bu betiği sudo ile çalıştırın: sudo ./create_debian_sources.sh"
  exit 1
fi

# /etc/apt/sources.list.d dizininin var olduğundan emin ol
mkdir -p /etc/apt/sources.list.d

# debian.sources dosyasını oluştur ve içeriği yaz
cat << 'EOF' > /etc/apt/sources.list.d/debian.sources
Types: deb
URIS: https://deb.debian.org/debian
Suites: trixie trixie-updates
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg

Types: deb
URIS: https://security.debian.org/debian-security
Suites: trixie-security
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
EOF

echo "/etc/apt/sources.list.d/debian.sources dosyası başarıyla oluşturuldu!"
echo "Paket listesini güncellemek için 'sudo apt update' komutunu çalıştırabilirsiniz."
