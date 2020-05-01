FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN yarn build

# Each From statement we Put in here simply tells that previous phase of docking is complete 
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html