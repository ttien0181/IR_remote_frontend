# Quick Start Guide - IoT IR Control

## 🚀 Bước 1: Cài đặt và chạy

```bash
# 1. Cài dependencies
flutter pub get

# 2. Generate code cho models
flutter pub run build_runner build --delete-conflicting-outputs

# 3. Chạy app (đảm bảo backend đang chạy trên localhost:5000)
flutter run
```

## 📱 Bước 2: Test Auth Flow

### Register (Đăng ký)
1. Mở app, click "Don't have an account? Register"
2. Nhập:
   - Email: test@example.com
   - Password: test123456
   - Username (optional): testuser
3. Click "Register"
4. App sẽ gửi code 6 số qua email

### Verify Email
1. Check email và lấy code 6 số
2. Nhập code vào form
3. Click "Verify"
4. Nếu code hết hạn, click "Resend Code"

### Login
1. Nhập email và password
2. Click "Login"
3. JWT token được lưu vào secure storage
4. Redirect đến HomePage với 5 tabs

## 🏠 Bước 3: Test Main Features

### Tab 1: Rooms
- **Xem danh sách**: Kéo xuống để refresh
- **Thêm room**: Click nút + (FAB)
  - Nhập: name = "Living Room", description = "Main room"
- **Sửa room**: Click menu 3 chấm → Edit
- **Xóa room**: Click menu 3 chấm → Delete

### Tab 2: Controllers
- **Xem danh sách**: Hiển thị status online/offline
- **Toggle status**: Click menu 3 chấm → Set Online/Offline
- Màu xanh = online, xám = offline

### Tab 3: Appliances
- **Xem danh sách**: Icons thay đổi theo type (TV, AC, Fan)
- **Filter**: Có thể filter theo room_id, controller_id, type (cần implement UI)

### Tab 4: Commands
- **Send command**: Click nút + (FAB)
  1. Chọn Room
  2. Chọn Controller
  3. Chọn Appliance
  4. Nhập Action (vd: "power_on", "increase_temp")
  5. Click "Send"
- **Xem history**: List hiển thị status với màu:
  - Orange = queued
  - Blue = sent
  - Green = acked
  - Red = failed

### Tab 5: Telemetry
- **Latest data**:
  1. Nhập Controller ID
  2. Click "Load Latest"
  3. Xem các metrics (temperature, humidity, etc.)
- **Statistics**: Sẵn sàng cho tích hợp chart/graph

## 🔐 Bước 4: Test Security

### Auto Logout khi 401
1. Sau khi login, đợi token hết hạn (hoặc xóa token trên backend)
2. Gọi bất kỳ API protected nào
3. App tự động:
   - Clear token
   - Clear user data
   - Redirect về Login page

### Manual Logout
1. Mở drawer (swipe từ trái hoặc tap icon menu)
2. Click "Logout"
3. Token bị xóa, redirect về Login

## 🎨 UI States Tested

Mỗi tab có 3 states:

1. **Loading**: Spinner với message
2. **Empty**: Icon + message + action button (nếu có)
3. **Error**: Error icon + message + Retry button

## 📋 API Endpoints Tested

### Auth (Public)
- ✅ POST /auth/register
- ✅ POST /auth/verify-email
- ✅ POST /auth/login
- ✅ POST /auth/resend-code

### Protected (cần Bearer token)
- ✅ GET /rooms
- ✅ POST /rooms
- ✅ PATCH /rooms/:id
- ✅ DELETE /rooms/:id
- ✅ GET /controllers
- ✅ PATCH /controllers/:id (set status)
- ✅ GET /appliances
- ✅ GET /commands
- ✅ POST /commands
- ✅ GET /telemetry/latest/:controllerId

## 🐛 Common Issues & Solutions

### Issue 1: Network Error
```
Error: Failed to connect to localhost:5000
```
**Solution**: 
- Android emulator: Đổi baseUrl thành `http://10.0.2.2:5000/api`
- iOS simulator: `http://localhost:5000/api` OK
- Real device: Dùng IP máy (vd: `http://192.168.1.100:5000/api`)

### Issue 2: Build Runner Failed
```
Error: Conflicting outputs
```
**Solution**:
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Issue 3: 401 Unauthorized ngay sau login
**Solution**: Check backend response có trả token không
```json
{
  "token": "eyJhbGc...",
  "message": "Login successful"
}
```

## 🔧 Config cho Production

### Thay đổi Base URL
```bash
# Development
flutter run --dart-define=BASE_URL=http://localhost:5000/api

# Staging
flutter run --dart-define=BASE_URL=https://staging-api.example.com/api

# Production
flutter build apk --dart-define=BASE_URL=https://api.example.com/api
```

## 📊 Test Data Examples

### Room
```json
{
  "name": "Living Room",
  "description": "Main living area"
}
```

### Controller
```json
{
  "name": "ESP32-01",
  "description": "Main controller",
  "room_id": "60d5ec49f1b2c8b1f8e4e1a1",
  "status": "online"
}
```

### Appliance
```json
{
  "name": "Samsung TV",
  "type": "TV",
  "room_id": "60d5ec49f1b2c8b1f8e4e1a1",
  "controller_id": "60d5ec49f1b2c8b1f8e4e1a2",
  "ir_protocol": "NEC"
}
```

### Command
```json
{
  "room_id": "60d5ec49f1b2c8b1f8e4e1a1",
  "controller_id": "60d5ec49f1b2c8b1f8e4e1a2",
  "appliance_id": "60d5ec49f1b2c8b1f8e4e1a3",
  "action": "power_on"
}
```

## ✅ Checklist Before Release

- [ ] All models generated (*.freezed.dart, *.g.dart exist)
- [ ] Base URL configured for production
- [ ] Test all auth flows
- [ ] Test CRUD operations
- [ ] Test error handling (network, 401, validation)
- [ ] Test on both platforms (Android & iOS)
- [ ] Icons and images optimized
- [ ] Remove debug prints
- [ ] Update version in pubspec.yaml

## 🎯 Next Steps

1. **MQTT Integration**: Real-time updates cho controller status
2. **Push Notifications**: Firebase FCM cho alerts
3. **Offline Mode**: Cache data với Hive/Drift
4. **Charts**: Telemetry visualization với fl_chart
5. **Dark Mode**: Theme switching
6. **Testing**: Unit tests, widget tests, integration tests

Happy Coding! 🚀
