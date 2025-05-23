FROM node:18.15.0-alpine

ENV TZ=Asia/Ho_Chi_Minh

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /rental/backend

COPY package*.json ./

RUN npm install && npm install -g nodemon

COPY . .

EXPOSE 4000

CMD ["npm", "run", "dev"]
