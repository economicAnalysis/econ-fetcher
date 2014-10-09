
echo "-----------src/python-std*------------" > RESULTS.log
ssh root@localhost -p 50006 -i fetcher_docker_rsa 'cat /var/log/supervisor/python-std*' >> RESULTS.log
echo "" >> RESULTS.log

cat RESULTS.log