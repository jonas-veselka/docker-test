# in case of deploy to AWS, remove alias and link it simply as 0
FROM node:alpine AS builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# nginx starts automatically

