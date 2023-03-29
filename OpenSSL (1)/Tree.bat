OpenSSL> req -days 3650 -newkey rsa:4096 -x509 -passout pass:"111111" -config openssl.cnf -subj /C=RU/L=Moscow/O=HSE/OU=MIEM/CN=HSE -keyout HSE.key -out HSE.crt
Generating a 4096 bit RSA private key
................................................................................................................................++
.......................................................++
writing new private key to 'HSE.key'
-----
OpenSSL> req -newkey rsa:4096 -passout pass:"111111" -config openssl.cnf -subj /C=RU/L=Moscow/O=HSE/OU=MIEM/OU=BIB201/CN=BIB201 -keyout BIB201.key  -out BIB201.csr
Generating a 4096 bit RSA private key
....................................++
.................................................................................................................................++
writing new private key to 'BIB201.key'
-----
OpenSSL> x509 -req -days 365 -passin pass:"111111" -CA HSE.crt -CAkey HSE.key  -set_serial 01  -in BIB201.csr -out BIB201.crt
Signature ok
subject=/C=RU/L=Moscow/O=HSE/OU=MIEM/OU=BIB201/CN=BIB201
Getting CA Private Key
OpenSSL> req -newkey rsa:4096 -passout pass:"111111" -config openssl.cnf -subj /C=RU/L=Moscow/O=HSE/OU=MIEM/OU=BIB201/OU=ME/CN=DenisMorin -keyout DenisMorin.key -out DenisMorin.csr
Generating a 4096 bit RSA private key
..................................................................................................................................................................................................................................++
..............................................................................++
writing new private key to 'DenisMorin.key'
-----
OpenSSL> x509 -req -days 365 -passin pass:"111111" -CA BIB201.crt -CAkey BIB201.key -set_serial 01  -in DenisMorin.csr -out DenisMorin.crt
Signature ok
subject=/C=RU/L=Moscow/O=HSE/OU=MIEM/OU=BIB201/OU=ME/CN=DenisMorin
Getting CA Private Key