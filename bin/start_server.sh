source .env

rails s -b 'ssl://localhost:3000?key=localhost.key&cert=localhost.crt'
