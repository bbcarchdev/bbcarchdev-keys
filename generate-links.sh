#! /bin/sh

ROOTS="bbc-ca.pem greenhouse.pem ddo.pem cloud.pem"

for root in $ROOTS ; do
	hash=`openssl x509 -in $root -noout -subject_hash`
	oldhash=`openssl x509 -in $root -noout -subject_hash_old`
	rm -f ${hash}.0 ${oldhash}.0
	ln -s $root ${hash}.0
	ln -s $root ${oldhash}.0
done
