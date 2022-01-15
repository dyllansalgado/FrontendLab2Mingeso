FROM node:17.3.1
WORKDIR /frontendlab2mingeso
ENV PATH /frontendlab2mingeso/node_modules/.bin:$PATH
COPY package.json ./
COPY package-lock.json ./
COPY ./ ./
RUN npm install
CMD ["npm", "run", "dev"]
EXPOSE 3000