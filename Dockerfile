# Stage 1: Compile and Build Angular Codebase
FROM node:latest as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# Stage 2: Serve App with Nginx Server
FROM nginx:alpine
COPY --from=build /app/dist/your-angular-app /usr/share/nginx/html
EXPOSE 8100
CMD ["nginx", "-g", "daemon off;"]
