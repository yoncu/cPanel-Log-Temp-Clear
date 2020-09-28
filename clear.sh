#!/bin/bash

for user in `cat /etc/domainusers | cut -d: -f1`; do
	UserDir="/home/$user"

	# SymLink Sil:
	find $UserDir -type l -exec rm -rf {} \;

	# Ozel php.ini Sil:
	find $UserDir -iname "php.ini" -exec rm -rf {} \;

	# 2Mb uzeri .zip sil
	find $UserDir -type f -iname "*.zip" -size +2M -exec rm -rf {} \;

	# 2Mb uzeri .tar sil
	find $UserDir -type f -iname "*.tar" -size +2M -exec rm -rf {} \;

	# 2Mb uzeri .tar.gz sil
	find $UserDir -type f -iname "*.tar.gz" -size +2M -exec rm -rf {} \;

	# 2Mb uzeri .rar sil
	find $UserDir -type f -iname "*.rar" -size +2M -exec rm -rf {} \;

	# 2Mb uzeri .iso sil
	find $UserDir -type f -iname "*.iso" -size +2M -exec rm -rf {} \;

	# 5Mb uzeri .jpg sil
	find $UserDir -type f -iname "*.jpg" -size +5M -exec rm -rf {} \;

	# 5Mb uzeri .png sil
	find $UserDir -type f -iname "*.png" -size +5M -exec rm -rf {} \;

	# 5Mb uzeri .gif sil
	find $UserDir -type f -iname "*.gif" -size +5M -exec rm -rf {} \;

	# 5Mb uzeri .jpeg sil
	find $UserDir -type f -iname "*.jpeg" -size +5M -exec rm -rf {} \;

	# 10Mb uzeri * sil
	find $UserDir -type f -size +10M -exec rm -rf {} \;

	# error_log dosyalarini sil
	find $UserDir -type f -name error_log -delete

done

# Geri Donusum Kutusunu Sil:
rm -rf /home/*/.trash/*;

rm -rf /error_log;

# Apache loglarini sil:
rm -rf /etc/apache2/domlogs/*.*;
rm -rf /var/log/apache2/domlogs/*.*;
rm -rf /var/log/apache2/domlogs/*/*;
rm -rf /var/log/apache2/archive/*;
rm -rf /var/log/apache2/suphp_log /var/log/apache2/error_log;
rm -rf /opt/cpanel/ea-php*/root/usr/var/log/php-fpm/error*;
rm -rf /etc/apache2/conf/httpd.conf.work.*;

# /tmp/ icini sil ama tümünü silme /tmp/mysql.sock dosyasini siliyo.
find /tmp/* -prune -type f -size +1M -exec rm -rf {} \;

# 60 dakikadan daha eski olan kullanıcı tmp dosyalarını sil:
find /home/*/tmp/sess_* -mmin +360 -exec rm -rf {} \;


# Code By Yoncu Bilisim Cozumleri Limited Sirketi
# Yoncu Datacenter - www.yoncu.com - +90.2169900099
