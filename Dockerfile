FROM node:18-alpine

WORKDIR /usr/src/app

# Solo copiamos el archivo de dependencias
COPY package.json ./

# Instalamos solo lo necesario para que la imagen pese poco
RUN npm install --production && npm install -g ts-node typescript

# Copiamos el resto del bot
COPY . .

EXPOSE 8000

# Iniciamos ignorando errores de tipos para que no se detenga
CMD ["ts-node", "--transpile-only", "src/main.ts"]
