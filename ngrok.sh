rm -rf ngrok ngrok.zip ngrok.sh > /dev/null 2>&1
rm -rf ngrok ngrok.zip ng.sh > /dev/null 2>&1

echo "======================="
echo "Download ngrok"
echo "======================="

wget -O ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok.zip > /dev/null 2>&1
./ngrok config add-authtoken "2H2bm5920tVI1B78PUvsAHdgjOQ_5yGs1VWW3bD9PzTh2iwuU"
./ngrok authtoken "2H2bm5920tVI1B78PUvsAHdgjOQ_5yGs1VWW3bD9PzTh2iwuU"
clear


./ngrok tcp --region "eu" 22 &>/dev/null &
echo "======================="
echo Updating Please Wait
echo "======================="
sudo apt update > /dev/null 2>&1
sudo apt install openssh-server > /dev/null 2>&1
mkdir -p /var/run/sshd
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc
echo "export LD_LIBRARY_PATH" >> /root/.bashrc
sudo service ssh start
echo "===================================="
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo create root password
passwd
echo "===================================="
