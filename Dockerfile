# ใช้ Node.js เป็น base image
FROM node:18

# ตั้งค่า working directory เป็น /app
WORKDIR /app

# คัดลอกไฟล์ทั้งหมดเข้าไปใน container
COPY . .

# ติดตั้งและ build frontend
WORKDIR /app/frontend
RUN ls -la  # ตรวจสอบว่าไฟล์มีอยู่จริง
RUN npm install && npm run build

# ติดตั้ง backend
WORKDIR /app/backend
RUN npm install

# เปิดพอร์ต
EXPOSE 5000

# คำสั่งเริ่มต้น
CMD ["npm", "start"]
