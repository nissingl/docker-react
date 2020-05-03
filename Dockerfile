FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN yarn build
 
 # Each From statement we Put in here simply tells that previous phase of docking is complete 
FROM nginx
# this expose does nothing for developer.. but of great use for beanstalk to expose
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html