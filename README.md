# README

redirect_uri must be using ssl so you'll need to generate a self-signed cert and configure puma to use it.

# openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout localhost.key -out localhost.crt

# rails s -b 'ssl://localhost:3000?key=./localhost.key&cert=./localhost.crt'
