openssl req -newkey rsa:2048 -nodes -keyout domain.key -out domain.csr
openssl x509 -signkey domain.key -in domain.csr -req -days 365 -out domain.crt

cat <<EOF > index.html
test
EOF


cat <<EOF > Dockerfile
FROM nginx:alpine

# Copy website files
COPY . /usr/share/nginx/html

# Remove default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy new configuration file
COPY nginx.conf /etc/nginx/conf.d/

# Copy SSL certificates
COPY domain.crt /etc/ssl/certs/
COPY domain.key /etc/ssl/private/
EOF

cat <<EOF > nginx.conf
server {
    listen 443 ssl;
    server_name your_domain_or_IP;

    ssl_certificate /etc/ssl/certs/domain.crt;
    ssl_certificate_key /etc/ssl/private/domain.key;

    location / {
        root /usr/share/nginx/html;
        index index.html index.htm;
    }
}
EOF

sudo docker build -t homepage .
sudo docker run -d --restart unless-stopped --name homepage -p 443:443 homepage
