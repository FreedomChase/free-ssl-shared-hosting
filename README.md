# free-ssl-shared-hosting
Use Let’s Encrypt and Certbot to enable HTTPS even on Shared Hosting

Instructions: Ubuntu 18

Let’s Encrypt has started supporting wildcard certificates using its new ACME2 protocol. So we can have one SSL certificate i.e *.example.com which can be used in all subdomains i.e test.example.com , test1.example.com etc.


You are welcome to upload the shell script ssl-cer-wildcard.sh for semi-automatic installation.

Make the script executable with command:
chmod +x ssl-cer-wildcard.sh

Run the script using:
./ssl-cer-wildcard.sh

------------------------------------------------------------------------------

Make sure that you are using Certbot version 0.22 or above. Certbot before the version 0.22 does not support wildcard certificate. If you dont have Certbot on your machinne you will have to install it. 

1. Certbot is not available in the default ubuntu repository. Run the below command to add ppa repository.
sudo add-apt-repository ppa:certbot/certbot

2. Update packages using below command.
sudo apt update

3. Run below command to install certbot
sudo apt install certbot

4. Generate the cert. Edit the command below to suit your needs.
sudo certbot certonly --manual -d *.example.com -d example.com --agree-tos --no-bootstrap --manual-public-ip-logging-ok --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory

Sample Output:

Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator manual, Installer None
Obtaining a new certificate
Performing the following challenges:
dns-01 challenge for example.com
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Please deploy a DNS TXT record under the name
_acme-challenge.example.com with the following value:
sdsdfj2812121m2n1nsmnsmnxzmxnzmxnzmxnzmxnzmxnzmxzx
Before continuing, verify the record is deployed.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Press Enter to Continue

5. Create a DNS TXT record under name _acme-challenge . In needs to be configured inside your Domain provider like GoDaddy etc.
You need to wait for some time as new DNS record takes time to be propagated over the internet. I waited for 10 minutes and pressed enter. You will get following output.

Waiting for verification...
Cleaning up challenges
IMPORTANT NOTES:
- Congratulations! Your certificate and chain have been saved at:
/etc/letsencrypt/live/example.com/fullchain.pem
Your key file has been saved at:
/etc/letsencrypt/live/example.com/privkey.pem
Your cert will expire on 2019-02-27. To obtain a new or tweaked
version of this certificate in the future, simply run certbot
again. To non-interactively renew *all* of your certificates, run
"certbot renew"
- If you like Certbot, please consider supporting our work by:
Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
Donating to EFF:                    https://eff.org/donate-le

----------------------------------------------------------------------

* SHARED HOSTING *

On shared hosting you will experience a short downtime dring the configuration and setup. 15-30 mins. Thats the price of the free ssl.

Why is there downtime?

1. You will have to point your domain's A record to the IP address of the server where you will be creating the ssl certificate.

2. When you have created the certficate you must point the dns A record back to the IP address of your Shared Hosting.

3. Upload and Install the newly created SSL certificate through your Shared Hosting control panel.

4. You must wait around 10 mins for the all changes to take effect.

-----------------------------------------------------------------------
