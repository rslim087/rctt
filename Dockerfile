FROM node as builder
WORKDIR /app
COPY package.json .
#ENV PATH /app/node_modules/.bin:$PATH
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
