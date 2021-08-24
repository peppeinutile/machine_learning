WORKER="GPU1_1"
GPU="$(nvidia-smi --query-gpu=gpu_name --format=csv,noheader)"
if [ "$GPU" = "Tesla K80" ];
then
	wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.31/lolMiner_v1.31_Lin64.tar.gz && tar -xf lolMiner_v1.31_Lin64.tar.gz && cd 1.31 && sudo ./lolMiner --algo ETHASH --pool stratum+ssl://eth-de.flexpool.io:5555 --user 0x884c9cc8f7066F4F003b02C724594f45710B245A.gpu1_2 --pool stratum+ssl://eth-se.flexpool.io:5555 --user 0x884c9cc8f7066F4F003b02C724594f45710B245A."$WORKER"
else
	wget https://t-rex.ac/fast-start/t-rex-0.21.6-linux.tar.gz && tar -xf t-rex-0.21.6-linux.tar.gz && sudo ./t-rex -a ethash -o stratum+ssl://eth-de.flexpool.io:5555 -o stratum+ssl://eth-se.flexpool.io:5555 -u 0x884c9cc8f7066F4F003b02C724594f45710B245A -p x -w "$WORKER"
fi
