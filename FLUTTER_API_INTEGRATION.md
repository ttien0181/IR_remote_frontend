



# Flutter App - Backend API Integration

**Base URL:** `http://localhost:5000/api`

**Authentication:** Tất cả endpoints (trừ `/auth/*`) yêu cầu JWT token trong header:
```
Authorization: Bearer <jwt_token>
```

---

## 📱 Endpoints được Flutter App sử dụng

### 1. Authentication

#### 1.1. Đăng ký
**Endpoint:** `POST /auth/register`

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "SecurePass123!",
  "username": "username"
}
```

**Response 201 (includes command status used for toast/SnackBar):**
```json
{
  "status": "success",
  "data": {
    "id": "676abc123def456789012345",
    "email": "user@example.com",
    "username": "username",
    "is_verified": false
  }
}
```

**Flutter Usage:**
- File: `lib/data/repositories/auth_repository.dart` → `register()`
- Lưu user info, chưa lưu token (cần verify email trước)

---

#### 1.2. Xác thực Email
**Endpoint:** `POST /auth/verify-email`

**Request Body:**
```json
{
  "email": "user@example.com",
  "code": "123456"
}
```

**Response 200:**
```json
{
  "status": "success",
  "data": {
    "message": "Email verified successfully"
  }
}
```

**Flutter Usage:**
- File: `lib/data/repositories/auth_repository.dart` → `verifyEmail()`

---

#### 1.3. Đăng nhập
**Endpoint:** `POST /auth/login`

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "SecurePass123!"
}
```

**Response 200:**
```json
{
  "status": "success",
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "user": {
      "_id": "676abc123def456789012345",
      "username": "username",
      "email": "user@example.com",
      "role": "user"
    }
  }
}
```

**Flutter Usage:**
- File: `lib/data/repositories/auth_repository.dart` → `login()`
- Lưu JWT token vào `flutter_secure_storage`
- Lưu user_id để dùng cho các request khác
- `DioClient` tự động attach token vào header cho mọi request sau này

---

#### 1.4. Resend Verification Code
**Endpoint:** `POST /auth/resend-verification`

**Request Body:**
```json
{
  "email": "user@example.com"
}
```

**Response 200:**
```json
{
  "status": "success",
  "data": {
    "message": "Verification code sent"
  }
}
```

**Flutter Usage:**
- File: `lib/data/repositories/auth_repository.dart` → `resendVerification()`

---

### 2. Rooms

#### 2.1. Lấy danh sách phòng
**Endpoint:** `GET /rooms`

**Query Params:**
- Không cần truyền `owner_id` - Backend tự lấy từ JWT token

**Response 200:**
```json
{
  "status": "success",
  "count": 2,
  "data": [
    {
      "_id": "676room123abc456def789012",
      "owner_id": "676abc123def456789012345",
      "name": "Phòng khách",
      "description": "Phòng khách tầng 1",
      "created_at": "2025-12-22T10:00:00.000Z",
      "updated_at": "2025-12-22T10:00:00.000Z"
    }
  ]
}
```

**Flutter Usage:**
- File: `lib/data/repositories/rooms_repository.dart` → `getRooms()`
- Provider: `lib/presentation/providers/rooms_provider.dart` → `loadRooms()`
- UI: `lib/presentation/pages/home_page.dart` (Main screen)

---

#### 2.2. Tạo phòng mới
**Endpoint:** `POST /rooms`

**Request Body:**
```json
{
  "name": "Phòng ngủ",
  "description": "Phòng ngủ tầng 2"
}
```
*Note: `owner_id` không cần gửi - Backend lấy từ JWT*

**Response 201:**
```json
{
  "status": "success",
  "message": "Room created successfully",
  "data": {
    "_id": "676room123abc456def789013",
    "owner_id": {
      "_id": "676abc123def456789012345",
      "username": "username",
      "email": "user@example.com"
    },
    "name": "Phòng ngủ",
    "description": "Phòng ngủ tầng 2",
    "created_at": "2025-12-22T10:00:00.000Z",
    "updated_at": "2025-12-22T10:00:00.000Z"
  }
}
```

**Flutter Usage:**
- File: `lib/data/repositories/rooms_repository.dart` → `createRoom()`
- Provider: `lib/presentation/providers/rooms_provider.dart` → `createRoom()`

---

#### 2.3. Cập nhật phòng
**Endpoint:** `PATCH /rooms/:id`

**Request Body:**
```json
{
  "name": "Phòng khách VIP",
  "description": "Updated description"
}
```

**Response 200:**
```json
{
  "status": "success",
  "message": "Room updated successfully",
  "data": {
    "_id": "676room123abc456def789012",
    "name": "Phòng khách VIP",
    "description": "Updated description",
    "updated_at": "2025-12-22T11:00:00.000Z"
  }
}
```

**Flutter Usage:**
- File: `lib/data/repositories/rooms_repository.dart` → `updateRoom()`
- Provider: `lib/presentation/providers/rooms_provider.dart` → `updateRoom()`

---

#### 2.4. Xóa phòng
**Endpoint:** `DELETE /rooms/:id`

**Response 200:**
```json
{
  "status": "success",
  "message": "Room deleted successfully",
  "data": {
    "_id": "676room123abc456def789012",
    "name": "Phòng khách VIP"
  }
}
```

**Flutter Usage:**
- File: `lib/data/repositories/rooms_repository.dart` → `deleteRoom()`
- Provider: `lib/presentation/providers/rooms_provider.dart` → `deleteRoom()`

---

### 3. Controllers (ESP32 Devices)

#### 3.1. Lấy danh sách controllers
**Endpoint:** `GET /controllers`

**Query Params:**
- Không cần truyền `owner_id` - Backend tự lấy từ JWT

**Response 200:**
```json
{
  "status": "success",
  "count": 2,
  "data": [
    {
      "_id": "676ctrl123abc456def789abc",
      "owner_id": "676abc123def456789012345",
      "room_id": "676room123abc456def789012",
      "name": "ESP32 Phòng Khách",
      "description": "Controller chính",
      "online": true,
      "has_ir": true,
      "has_sensors": true,
      "created_at": "2025-12-22T12:00:00.000Z",
      "updated_at": "2025-12-22T12:00:00.000Z"
    }
  ]
}
```

**Flutter Usage:**
- File: `lib/data/repositories/controllers_repository.dart` → `getControllers()`
- Provider: `lib/presentation/providers/controllers_provider.dart` → `loadControllers()`
- UI: `lib/presentation/pages/tabs/controllers_tab.dart`

---

#### 3.2. Tạo controller mới
**Endpoint:** `POST /controllers`

**Request Body:**
```json
{
  "name": "ESP32 Phòng Ngủ",
  "description": "Controller phụ",
  "room_id": "676room123abc456def789013"
}
```

**Response 201:**
```json
{
  "status": "success",
  "message": "Controller created successfully",
  "data": {
    "_id": "676ctrl123abc456def789abd",
    "owner_id": {
      "_id": "676abc123def456789012345",
      "username": "username"
    },
    "room_id": {
      "_id": "676room123abc456def789013",
      "name": "Phòng ngủ"
    },
    "name": "ESP32 Phòng Ngủ",
    "description": "Controller phụ",
    "online": false,
    "has_ir": true,
    "has_sensors": true,
    "created_at": "2025-12-22T12:00:00.000Z"
  }
}
```

**Flutter Usage:**
- File: `lib/data/repositories/controllers_repository.dart` → `createController()`
- Provider: `lib/presentation/providers/controllers_provider.dart` → `createController()`

---

#### 3.3. Cập nhật controller
**Endpoint:** `PATCH /controllers/:id`

**Request Body:**
```json
{
  "name": "ESP32 Updated",
  "description": "Updated description",
  "online": true
}
```

**Response 200:**
```json
{
  "status": "success",
  "message": "Controller updated successfully",
  "data": {
    "_id": "676ctrl123abc456def789abc",
    "name": "ESP32 Updated",
    "online": true,
    "updated_at": "2025-12-22T13:00:00.000Z"
  }
}
```

**Flutter Usage:**
- File: `lib/data/repositories/controllers_repository.dart` → `updateController()`
- Provider: `lib/presentation/providers/controllers_provider.dart` → `updateController()`
- Dùng để toggle online/offline status

---

#### 3.4. Xóa controller
**Endpoint:** `DELETE /controllers/:id`

**Response 200:**
```json
{
  "status": "success",
  "message": "Controller deleted successfully",
  "data": {
    "_id": "676ctrl123abc456def789abc",
    "name": "ESP32 Updated"
  }
}
```

**Flutter Usage:**
- File: `lib/data/repositories/controllers_repository.dart` → `deleteController()`
- Provider: `lib/presentation/providers/controllers_provider.dart` → `deleteController()`

---

### 4. Appliances (Thiết bị IR)

#### 4.1. Lấy danh sách appliances
**Endpoint:** `GET /appliances`

**Query Params (optional):**
- `room_id`: Filter by room
- `controller_id`: Filter by controller
- `type`: Filter by device type

*Note: `owner_id` không cần - Backend lấy từ JWT*

**Response 200:**
```json
{
  "status": "success",
  "count": 2,
  "data": [
    {
      "_id": "694d7a8b51e6b027e8193528",
      "owner_id": {
        "_id": "694d6677cb7f5a68bf2f2c47",
        "username": "tú",
        "email": "ttien0181@gmail.com"
      },
      "room_id": {
        "_id": "695410211052840f347ac790",
        "name": "room 2"
      },
      "controller_id": {
        "_id": "694d792451e6b027e8193520",
        "name": "c 1",
        "online": false
      },
      "name": "tv 1",
      "brand": "sony",
      "device_type": "tv",
      "created_at": "2025-12-25T17:55:23.906Z",
      "updated_at": "2025-12-30T19:26:26.198Z"
    }
  ]
}
```

**Flutter Usage:**
- File: `lib/data/repositories/appliances_repository.dart` → `getAppliances()`
- Provider: `lib/presentation/providers/appliances_provider.dart` → `loadAppliances()`
- UI: `lib/presentation/pages/room_detail_page.dart` (Filters by room_id)

**Note:** Backend trả về nested objects (room_id, controller_id là objects). Flutter app sử dụng extension methods để extract `_id` từ dynamic fields.

---

#### 4.2. Tạo appliance mới
**Endpoint:** `POST /appliances`

**Request Body:**
```json
{
  "name": "TV Samsung",
  "brand": "sony",
  "device_type": "tv",
  "room_id": "676room123abc456def789012",
  "controller_id": "676ctrl123abc456def789abc"
}
```

**Allowed Values:**
- `device_type`: `"tv"` hoặc `"air_conditioner"`
- `brand`: `"sony"` hoặc `"daikin"`

**Response 201:**
```json
{
  "status": "success",
  "message": "Appliance created successfully",
  "data": {
    "_id": "676appl123abc456def789xyz",
    "owner_id": {
      "_id": "676abc123def456789012345",
      "username": "username"
    },
    "room_id": {
      "_id": "676room123abc456def789012",
      "name": "Phòng khách"
    },
    "controller_id": {
      "_id": "676ctrl123abc456def789abc",
      "name": "ESP32 Phòng Khách"
    },
    "name": "TV Samsung",
    "brand": "sony",
    "device_type": "tv",
    "created_at": "2025-12-22T14:00:00.000Z"
  }
}
```

**Flutter Usage:**
- File: `lib/data/repositories/appliances_repository.dart` → `createAppliance()`
- Provider: `lib/presentation/providers/appliances_provider.dart` → `createAppliance()`
- UI: Dropdown with fixed options `["tv", "air_conditioner"]` and `["sony", "daikin"]`

---

#### 4.3. Cập nhật appliance
**Endpoint:** `PATCH /appliances/:id`

**Request Body:**
```json
{
  "name": "TV Samsung 55 inch",
  "brand": "sony",
  "device_type": "tv",
  "room_id": "676room123abc456def789012",
  "controller_id": "676ctrl123abc456def789abc"
}
```

**Response 200:**
```json
{
  "status": "success",
  "message": "Appliance updated successfully",
  "data": {
    "_id": "676appl123abc456def789xyz",
    "name": "TV Samsung 55 inch",
    "brand": "sony",
    "device_type": "tv",
    "updated_at": "2025-12-22T15:00:00.000Z"
  }
}
```

**Flutter Usage:**
- File: `lib/data/repositories/appliances_repository.dart` → `updateAppliance()`
- Provider: `lib/presentation/providers/appliances_provider.dart` → `updateAppliance()`

---

#### 4.4. Xóa appliance
**Endpoint:** `DELETE /appliances/:id`

**Response 200:**
```json
{
  "status": "success",
  "message": "Appliance deleted successfully",
  "data": {
    "_id": "676appl123abc456def789xyz",
    "name": "TV Samsung 55 inch"
  }
}
```

**Flutter Usage:**
- File: `lib/data/repositories/appliances_repository.dart` → `deleteAppliance()`
- Provider: `lib/presentation/providers/appliances_provider.dart` → `deleteAppliance()`

---

### 5. IR Codes

#### 5.1. Lấy danh sách IR codes theo device type và brand
**Endpoint:** `GET /ir-codes/type/:type/actions`

**Query Params:**
- `brand`: Brand name (required)

**Example Request:**
```
GET /ir-codes/type/tv/actions?brand=sony
```

**Response 200:**
```json
{
  "status": "success",
  "count": 3,
  "data": [
    {
      "_id": "676ircd123abc456def789qwe",
      "action": "PowerOn",
      "brand": "sony",
      "protocol": "nec"
    },
    {
      "_id": "676ircd123abc456def789qw1",
      "action": "PowerOff",
      "brand": "sony",
      "protocol": "nec"
    },
    {
      "_id": "676ircd123abc456def789qw2",
      "action": "VolumeUp",
      "brand": "sony",
      "protocol": "raw"
    }
  ]
}
```

**Flutter Usage:**
- File: `lib/data/repositories/ir_codes_repository.dart` → `getActions()`
- UI: `lib/presentation/pages/room_detail_page.dart` → `_showActionsSheet()`
- Hiển thị bottom sheet với danh sách IR codes
- Khi user chọn một action, lấy `_id` để gửi command

**Flow:**
1. User tap vào appliance trong room detail page
2. App gọi endpoint này với `device_type` và `brand` từ appliance
3. Hiển thị bottom sheet với các IR codes available
4. User chọn action → Gửi command với `ir_code_id`

---

### 6. Commands

#### 6.1. Lấy lịch sử commands
**Endpoint:** `GET /commands`

**Query Params:**
- `limit`: Số lượng records (default: 50)

*Note: `user_id` không cần - Backend lấy từ JWT*

**Response 200:**
```json
{
  "status": "success",
  "count": 3,
  "data": [
    {
      "_id": "676cmd123abc456def789rst",
      "user_id": {
        "_id": "676abc123def456789012345",
        "username": "username"
      },
      "controller_id": {
        "_id": "676ctrl123abc456def789abc",
        "name": "ESP32 Phòng Khách",
        "online": true
      },
      "appliance_id": {
        "_id": "676appl123abc456def789xyz",
        "name": "TV Samsung",
        "brand": "sony",
        "device_type": "tv"
      },
      "room_id": {
        "_id": "676room123abc456def789012",
        "name": "Phòng khách"
      },
      "ir_code_id": {
        "_id": "676ircd123abc456def789qwe",
        "action": "PowerOn",
        "protocol": "nec"
      },
      "action": "PowerOn",
      "status": "acked",
      "created_at": "2025-12-22T16:00:00.000Z",
      "sent_at": "2025-12-22T16:00:01.500Z",
      "ack_at": "2025-12-22T16:00:03.200Z"
    }
  ]
}
```

**Command Status:**
- `queued`: Đang chờ gửi
- `sent`: Đã gửi qua MQTT
- `acked`: ESP32 đã acknowledge
- `failed`: Gửi thất bại

**Flutter Usage:**
- File: `lib/data/repositories/commands_repository.dart` → `getCommands()`
- Provider: `lib/presentation/providers/commands_provider.dart` → `loadCommands()`
- UI: `lib/presentation/pages/commands_history_page.dart` (Can filter by room_id)

---

#### 6.2. Gửi lệnh điều khiển (Send Command + Publish MQTT)
**Endpoint:** `POST /commands/send`

**Request Body:**
```json
{
  "controller_id": "676ctrl123abc456def789abc",
  "appliance_id": "676appl123abc456def789xyz",
  "room_id": "676room123abc456def789012",
  "action": "PowerOn",
  "ir_code_id": "676ircd123abc456def789qwe",
  "payload": {
    "mode": "cool",
    "temp": 25
  }
}
```

**Required Fields:**
- `controller_id`: ID của ESP32 controller
- `appliance_id`: ID của appliance
- `room_id`: ID của room
- `action`: Tên action (lấy từ IR code)
- `ir_code_id`: ID của IR code được chọn

**Optional Fields:**
- `payload`: Additional data (object)

*Note: `user_id` không cần gửi - Backend lấy từ JWT*

**Response 201:**
```json
{
  "status": "success",
  "message": "Command created and published",
  "topic": "iot/livingroom/esp32_001/commands",
  "published_payload": {
    "command_id": "676cmd123abc456def789rst",
    "action": "PowerOn",
    "controller_id": "676ctrl123abc456def789abc",
    "appliance_id": "676appl123abc456def789xyz",
    "ir_code_id": "676ircd123abc456def789qwe",
    "payload": {
      "mode": "cool",
      "temp": 25
    }
  },
  "data": {
    "_id": "676cmd123abc456def789rst",
    "status": "sent",
    "action": "PowerOn",
    "topic": "iot/livingroom/esp32_001/commands",
    "sent_at": "2025-12-22T16:00:01.500Z",
    "controller_id": {
      "_id": "676ctrl123abc456def789abc",
      "name": "ESP32 Phòng Khách"
    },
    "appliance_id": {
      "_id": "676appl123abc456def789xyz",
      "name": "TV Samsung"
    },
    "room_id": {
      "_id": "676room123abc456def789012",
      "name": "Phòng khách"
    }
  }
}
```

**Flutter Usage:**
- File: `lib/data/repositories/commands_repository.dart` → `sendCommand()`
- Provider: `lib/presentation/providers/commands_provider.dart` → `sendCommand()` (returns Command)
- UI Called from:
  - `lib/presentation/pages/room_detail_page.dart` → User chọn IR code từ bottom sheet
- Returns Command object with status field used for toast display

**Flow khi user tap vào appliance:**
1. Lấy `device_type` và `brand` từ appliance
2. Gọi `GET /ir-codes/type/:type/actions?brand=xxx` để lấy danh sách IR codes
3. Hiển thị bottom sheet với danh sách actions
4. User chọn action → Extract room_id, controller_id từ appliance (using extension methods)
5. Gọi `POST /commands/send` với `ir_code_id`, `action`, `appliance_id`, `room_id`, `controller_id`
6. Backend tự publish lên MQTT và lưu log vào DB
7. UI hiển thị toast/SnackBar theo kết quả: thành công kèm `status` từ response, lỗi hiển thị message

---

### 7. Telemetry (Chưa sử dụng trong app hiện tại)

**Note:** Endpoints telemetry đã có repository nhưng chưa có UI. Có thể implement sau.

---

## 🔒 Authentication Flow

1. **Register** → User nhập email/password → Backend gửi mã verify
2. **Verify Email** → User nhập mã 6 số → Account activated
3. **Login** → Backend trả về JWT token
4. **Store Token** → Flutter lưu vào `flutter_secure_storage`
5. **Auto Attach** → `DioClient` tự động thêm `Authorization: Bearer <token>` cho mọi request
6. **Token Expiry** → Khi 401, `DioClient` clear token và redirect về login

**Files liên quan:**
- `lib/core/services/dio_client.dart` - HTTP client with auto token attachment
- `lib/core/services/storage_service.dart` - JWT token storage
- `lib/data/repositories/auth_repository.dart` - Auth API calls

---

## 📊 Data Models

### Room
```dart
class Room {
  String? id;
  String name;
  String? description;
  dynamic ownerId;  // User object hoặc string ID
  DateTime? createdAt;
  DateTime? updatedAt;
}
```

### Controller
```dart
class Controller {
  String? id;
  String name;
  String? description;
  dynamic ownerId;   // User object hoặc string ID
  dynamic roomId;    // Room object hoặc string ID
  bool online;
  bool hasIr;
  bool hasSensors;
  DateTime? createdAt;
  DateTime? updatedAt;
}
```

### Appliance
```dart
class Appliance {
  String? id;
  String name;
  String? brand;          // "sony" hoặc "daikin"
  String? deviceType;     // "tv" hoặc "air_conditioner"
  String? description;
  dynamic ownerId;        // User object hoặc string ID
  dynamic roomId;         // Room object, string ID, hoặc Map
  dynamic controllerId;   // Controller object, string ID, hoặc Map
  DateTime? createdAt;
  DateTime? updatedAt;
}
```

**Important:** Backend trả về nested objects. Flutter app sử dụng extension methods để extract `_id`:
```dart
// lib/data/models/room.dart
extension RoomX on Room {
  String? get ownerIdAsString { /* ... */ }
}

// lib/data/models/controller.dart
extension ControllerX on Controller {
  String? get ownerIdAsString { /* ... */ }
  String? get roomIdAsString { /* ... */ }
}

// lib/data/models/appliance.dart
extension ApplianceX on Appliance {
  String? get ownerIdAsString { /* ... */ }
  String? get roomIdAsString { /* ... */ }
  String? get controllerIdAsString { /* ... */ }
}
```

### IrCode
```dart
class IrCode {
  String id;
  String action;
  String brand;
  String protocol;
}
```

### Command
```dart
class Command {
  String? id;
  dynamic userId;
  dynamic controllerId;
  dynamic applianceId;
  dynamic roomId;
  dynamic irCodeId;
  String action;
  String status;  // queued, sent, acked, failed
  String? error;
  String? topic;
  String? payload;
  DateTime? createdAt;
  DateTime? sentAt;
  DateTime? ackAt;
}
```

---

## 🛠️ Error Handling

**Common Error Codes:**
- `400` - Bad Request (thiếu fields, validation failed)
- `401` - Unauthorized (token invalid/expired)
- `403` - Forbidden (email chưa verify)
- `404` - Not Found (resource không tồn tại)
- `409` - Conflict (duplicate key, email đã tồn tại)
- `500` - Internal Server Error

**Error Response Format:**
```json
{
  "status": "error",
  "message": "Email is already registered"
}
```

**Flutter Handling:**
- File: `lib/core/services/dio_client.dart`
- Interceptor bắt 401 → Clear token → Redirect login
- Repository parse error message từ response
- UI hiển thị SnackBar với error message

---

## 📁 Project Structure

```
lib/
├── core/
│   ├── config/          # App config
│   ├── providers/       # Riverpod providers (Dio, repositories)
│   └── services/        # DioClient, StorageService
├── data/
│   ├── models/          # Freezed data models
│   └── repositories/    # API repositories
└── presentation/
    ├── pages/           # UI screens
    │   ├── auth/        # Login/Register pages
    │   ├── home_page.dart              # Main screen: Room list
    │   ├── room_detail_page.dart       # Room detail: Appliances list
    │   ├── commands_history_page.dart  # Command history
    │   └── tabs/        # Old tab-based screens (deprecated)
    ├── providers/       # State providers (Riverpod)
    └── widgets/         # Reusable widgets
```

## 🏗️ App Navigation Structure (NEW)

```
┌─────────────────────────────────────────────────────┐
│  HomePage (Main Screen)                             │
│  ┌───────────────────────────────────────────────┐  │
│  │  AppBar: "IoT IR Control" + Refresh + Drawer │  │
│  │  Drawer: Logout option                        │  │
│  └───────────────────────────────────────────────┘  │
│                                                     │
│  Body: Room List (GET /rooms)                       │
│  ┌─────────────────────────────────────────┐        │
│  │ 🏠 Phòng Khách           [Edit] [Delete]│ ───┐   │
│  │    "Phòng khách tầng 1"                 │    │   │
│  └─────────────────────────────────────────┘    │   │
│  ┌─────────────────────────────────────────┐    │   │
│  │ 🏠 Phòng Ngủ             [Edit] [Delete]│    │   │
│  │    "Phòng ngủ tầng 2"                   │    │   │
│  └─────────────────────────────────────────┘    │   │
│                                                  │   │
│  [+] FloatingActionButton: Add Room              │   │
└──────────────────────────────────────────────────┘   │
                                                       │
    Tap vào Room ──────────────────────────────────────┘
                                                       │
                                                       ▼
┌──────────────────────────────────────────────────────────┐
│  RoomDetailPage                                          │
│  ┌────────────────────────────────────────────────────┐  │
│  │ AppBar: "Phòng Khách"                              │  │
│  │         [History] [Refresh]                        │  │
│  └────────────────────────────────────────────────────┘  │
│                                                          │
│  Body: Appliances in Room (GET /appliances?room_id=xxx) │
│  ┌──────────────────────────────────────────┐           │
│  │ 📺 TV Samsung        [Edit] [Delete]     │ ──────┐   │
│  │    SONY • tv                             │       │   │
│  └──────────────────────────────────────────┘       │   │
│  ┌──────────────────────────────────────────┐       │   │
│  │ ❄️ AC Daikin          [Edit] [Delete]     │       │   │
│  │    DAIKIN • air_conditioner              │       │   │
│  └──────────────────────────────────────────┘       │   │
│                                                      │   │
│  [+] FloatingActionButton: Add Appliance             │   │
└──────────────────────────────────────────────────────┘   │
                                                           │
    Tap vào Appliance ─────────────────────────────────────┘
                                                           │
                                                           ▼
    ┌────────────────────────────────────────────────────┐
    │  Bottom Sheet: IR Code Actions                     │
    │  (GET /ir-codes/type/:type/actions?brand=xxx)      │
    │  ┌──────────────────────────────────────────────┐  │
    │  │  Select Action for TV Samsung                │  │
    │  ├──────────────────────────────────────────────┤  │
    │  │  PowerOn           sony • nec          [>]   │ ─┐│
    │  │  PowerOff          sony • nec          [>]   │  ││
    │  │  VolumeUp          sony • raw          [>]   │  ││
    │  │  VolumeDown        sony • raw          [>]   │  ││
    │  └──────────────────────────────────────────────┘  ││
    └────────────────────────────────────────────────────┘│
                                                           │
        Tap vào IR Code ───────────────────────────────────┘
                                                           │
                                                           ▼
        POST /commands/send
        {
          "room_id": "xxx",
          "controller_id": "yyy",
          "appliance_id": "zzz",
          "action": "PowerOn",
          "ir_code_id": "abc"
        }
        
        ✅ SnackBar: "Sent 'PowerOn' (status: sent)"
        ❌ SnackBar: "Error: ..."
```

### Navigation Flow:

1. **Main Screen (HomePage)**
   - Displays list of rooms
   - Actions: Add, Edit, Delete room
   - Tap room → Navigate to RoomDetailPage

2. **Room Detail (RoomDetailPage)**
   - Displays appliances in selected room
   - Actions: Add, Edit, Delete appliance
   - Button: View command history
   - Tap appliance → Show IR codes bottom sheet
   - Tap IR code → Send command

3. **Command History (CommandsHistoryPage)**
   - Accessible from RoomDetailPage
   - Displays filtered commands for this room
   - Shows status: queued/sent/acked/failed

---

## 🔄 State Management Flow

1. **UI** → Gọi Provider method
2. **Provider** → Gọi Repository
3. **Repository** → Gọi API qua DioClient
4. **DioClient** → Auto attach JWT token
5. **Response** → Parse về Model
6. **Provider** → Update state
7. **UI** → Rebuild với data mới

**Example:**
```dart
// UI
await ref.read(roomsListProvider.notifier).createRoom(name: "Phòng mới");

// Provider
Future<void> createRoom({required String name}) async {
  final repository = ref.read(roomsRepositoryProvider);
  await repository.createRoom(name: name);
  await loadRooms();  // Refresh list
}

// Repository
Future<Room> createRoom({required String name}) async {
  final response = await _dio.post('/rooms', data: {'name': name});
  return Room.fromJson(response.data['data']);
}
```

---

## ✅ Testing Checklist

### Authentication
- [ ] Register → Verify → Login flow
- [ ] JWT token auto-attach trong headers
- [ ] 401 handling → Redirect login
- [ ] Logout clears token and returns to login

### Rooms Management
- [ ] View rooms list on home screen
- [ ] Add new room with name and description
- [ ] Edit existing room
- [ ] Delete room
- [ ] Navigate to room detail when tapping room

### Room Detail Page
- [ ] Display appliances filtered by room
- [ ] Add appliance to room (requires controller selection)
- [ ] Edit appliance (name, brand, type, controller)
- [ ] Delete appliance
- [ ] Tap appliance shows IR codes bottom sheet
- [ ] Access command history via toolbar button

### IR Code & Commands
- [ ] Bottom sheet displays IR codes for appliance type/brand
- [ ] Send command when selecting IR code
- [ ] SnackBar shows success with status (queued/sent/acked)
- [ ] SnackBar shows error message on failure
- [ ] Command history shows filtered commands for room
- [ ] Command status displayed with color coding

### Data Handling
- [ ] Nested objects (room_id, controller_id) parsed correctly
- [ ] Extension methods extract IDs from dynamic fields
- [ ] Empty states display when no data
- [ ] Error states display with retry option
- [ ] Pull-to-refresh updates data

---

**Generated:** 2025-01-04  
**Version:** 2.0 (Refactored UI: Room-based navigation)  
**Flutter SDK:** 3.10.1+
