FROM node:18-slim

WORKDIR /usr/src/app

# Copiamos archivos de configuración
COPY package*.json ./

# Instalamos todo, incluyendo ts-node para saltarnos el build
RUN npm install && npm install -g ts-node typescript

# Copiamos el resto del código
COPY . .

# EXPOSE del puerto que configuramos en main.ts
EXPOSE 8000

# Arrancamos directamente desde el archivo main.ts saltando el build
CMD ["ts-node", "src/main.ts"]
