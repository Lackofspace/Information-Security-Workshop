set config file=c:\OpenSSL\bin\openssl.cfg
openssl req -days 3650 -newkey rsa:4096 -x509 -passout pass:"111111" -config openssl.cnf -extensions v3_ca  -subj /C=RU/L=Moscow/O=HSE/OU=MIEM/CN=HSE -keyout HSE.key -out HSE.crt
openssl req -newkey rsa:4096 -passout pass:"111111" -config openssl.cnf -subj /C=RU/L=Moscow/O=HSE/OU=MIEM/OU=BIB201/CN=BIB201 -keyout BIB201.key  -out BIB201.csr
openssl x509 -req -days 365 -passin pass:"111111" -CA HSE.crt -CAkey HSE.key -extfile openssl.cnf  -extensions v3_BIB201_ca  -set_serial 01  -in BIB201.csr -out BIB201.crt
openssl req -newkey rsa:4096 -passout pass:"111111" -config openssl.cnf -subj /C=RU/L=Moscow/O=HSE/OU=MIEM/OU=BIB201/CN=DenisMorin -keyout DenisMorin.key -out DenisMorin.csr
openssl x509 -req -days 365 -passin pass:"111111" -CA BIB201.crt -CAkey BIB201.key -extfile openssl.cnf -extensions DenisMorin_cert -set_serial 01  -in DenisMorin.csr -out DenisMorin.crt
type DenisMorin.key Denismorin.crt BIB201.crt HSE.crt > groupedfiles.pem
openssl pkcs12 -password pass:"111111" -passin pass:"111111" -export -out mykeysandcrt.p12 -inkey DenisMorin.key -in groupedfiles.pem
certutil -f -p "111111" -importpfx mykeysandcrt.p12 NoExport
Pause