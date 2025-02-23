# Sử dụng node image từ Docker Hub
FROM node:18-alpine

# Cài đặt thư viện cần thiết cho build
WORKDIR /usr/src/app

# Copy package.json và package-lock.json vào container
COPY package*.json ./

# Cài đặt các dependencies
RUN npm install

# Copy toàn bộ mã nguồn vào container
COPY . .

# Build ứng dụng NestJS
RUN npm run build

# Expose cổng mà ứng dụng NestJS sẽ chạy
EXPOSE 3000

# Chạy ứng dụng NestJS
CMD ["npm", "run", "start:prod"]
