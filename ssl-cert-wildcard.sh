#! /bin/sh
# Certbot is not available in the default ubuntu repository. Run the below command to add ppa repository
sudo add-apt-repository ppa:certbot/certbot

sudo apt update

# Install certbot
sudo apt install certbot

# Generate the cert
sudo certbot certonly --manual -d *.isc.coop -d isc.coop --agree-tos --no-bootstrap --manual-public-ip-logging-ok --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory
