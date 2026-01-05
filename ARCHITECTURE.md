# App Architecture Diagram

## Overall Navigation Structure

```
┌─────────────────────────────────────────────────────────────────┐
│                        HomePage                                  │
│  (4-Page Bottom Navigation with TabController)                  │
└──────────────┬──────────────┬──────────────┬────────────────────┘
               │              │              │
      ┌────────▼──┐  ┌────────▼──┐  ┌───────▼───┐  ┌──────────────┐
      │  Rooms    │  │Controllers│  │  History  │  │  Telemetry   │
      │   Page    │  │   Page    │  │   Page    │  │  Page (TODO) │
      └────────┬──┘  └────────┬──┘  └───────────┘  └──────────────┘
               │              │
       ┌───────▼──────┐  ┌────▼──────────┐
       │ Room Detail  │  │ Controller    │
       │ Page         │  │ Detail Page   │
       └───┬──┬───────┘  └───┬──────┬────┘
           │  │              │      │
           │  │              │      └─────────────────┐
           │  │              │                        │
    ┌──────▼──▼──────┬───────▼──────┐    ┌──────────▼──────────┐
    │ Appliance      │ Room Info    │    │ Appliance Detail   │
    │ Detail Page    │ Page         │    │ Page (Shared)      │
    │                │              │    │                    │
    │ • IR Actions   │ • Room Name  │    │ • IR Actions       │
    │ • Send Command │ • Description│    │ • Send Command     │
    │ • Status FB    │ • Created At │    │ • Appliance Info   │
    └────────────────┴──────────────┘    └────────────────────┘
```

---

## Room Navigation Flow

```
RoomsPage
  └─> RoomDetailPage (roomId)
      ├─> RoomInfoPage (room info)
      └─> ApplianceDetailPage (appliance details & send commands)
          └─> SnackBar (command status)
```

### Data Loading in RoomDetailPage
```
FutureBuilder
├─> roomControllersRepository.getControllersByRoom(roomId)
│   │
│   └─> GET /api/controllers/room/:roomId
│       └─> List<Controller>
│
└─> roomAppliancesRepository.getAppliancesByRoom(roomId)
    │
    └─> GET /api/appliances/room/:roomId
        └─> List<Appliance>
```

---

## Controller Navigation Flow

```
ControllersPage
  └─> ControllerDetailPage (controllerId)
      └─> ApplianceDetailPage (appliance details & send commands)
          └─> SnackBar (command status)
```

### Data Loading in ControllerDetailPage
```
FutureBuilder
  └─> controllerAppliancesRepository.getAppliancesByController(controllerId)
      │
      └─> GET /api/appliances/controller/:controllerId
          └─> List<Appliance>
```

---

## Appliance Detail Flow (Shared Between Rooms & Controllers)

```
ApplianceDetailPage (appliance object)
  ├─> FutureBuilder loads IR codes
  │   └─> irCodesRepository.getActions(type, brand)
  │       └─> GET /api/ir-codes/action?type=X&brand=Y
  │           └─> List<IrCode>
  │
  ├─> User selects action
  │   └─> sendCommand(roomId, controllerId, applianceId, action)
  │       └─> POST /api/commands/send
  │           └─> Command (with status)
  │
  └─> SnackBar feedback
      └─> Display status (success/failed/pending)
```

---

## Repository Architecture

```
┌──────────────────────────────────────────────────┐
│          Presentation Layer (Pages)              │
├──────────────────────────────────────────────────┤
│          Repository Layer (Data Access)          │
│                                                  │
│  ┌──────────────────┐  ┌──────────────────┐    │
│  │ RoomControllers  │  │ RoomAppliances   │    │
│  │ Repository       │  │ Repository       │    │
│  │                  │  │                  │    │
│  │ getControllers   │  │ getAppliances    │    │
│  │ (roomId)         │  │ (roomId)         │    │
│  └────────┬─────────┘  └────────┬─────────┘    │
│           │                    │               │
│  ┌────────▼────────────────────▼─────────┐    │
│  │ ControllerAppliances Repository       │    │
│  │                                        │    │
│  │ getAppliances(controllerId)            │    │
│  └────────┬───────────────────────────────┘    │
│           │                                    │
│  ┌────────▼──────────────────────────────┐    │
│  │ Existing Repositories                 │    │
│  │ • CommandsRepository                  │    │
│  │ • IrCodesRepository                   │    │
│  │ • RoomsRepository                     │    │
│  │ • ControllersRepository               │    │
│  │ • AppliancesRepository                │    │
│  └────────┬──────────────────────────────┘    │
├──────────┬┴──────────────────────────────────┤
│          │        Network Layer (Dio)        │
│          └────────────────────────────────────┤
├──────────────────────────────────────────────────┤
│     Backend API (http://localhost:5000)         │
└──────────────────────────────────────────────────┘
```

---

## Provider Dependency Injection

```
providers.dart
│
├─ roomControllersRepositoryProvider
│  └─ RoomControllersRepository(dio)
│
├─ roomAppliancesRepositoryProvider
│  └─ RoomAppliancesRepository(dio)
│
├─ controllerAppliancesRepositoryProvider
│  └─ ControllerAppliancesRepository(dio)
│
├─ commandsRepositoryProvider
│  └─ CommandsRepository(dio)
│
├─ irCodesRepositoryProvider
│  └─ IrCodesRepository(dio)
│
├─ roomsRepositoryProvider
│  └─ RoomsRepository(dio)
│
├─ controllersRepositoryProvider
│  └─ ControllersRepository(dio)
│
└─ appliancesRepositoryProvider
   └─ AppliancesRepository(dio)
```

---

## State Management with ConsumerStatefulWidget

```
ConsumerStatefulWidget (each page)
  │
  ├─> ref.read(repositoryProvider)
  │   └─> Access repository synchronously
  │
  ├─> ref.watch(provider)
  │   └─> Watch provider changes
  │
  └─> FutureBuilder<T>
      ├─> connectionState.waiting
      │   └─> LoadingWidget()
      │
      ├─> hasError
      │   └─> ErrorStateWidget(onRetry)
      │
      └─> data
          └─> UI with data
```

---

## Error Handling Chain

```
ApplianceDetailPage
  │
  ├─> Try: irCodesRepository.getActions()
  │   └─> Catch: DioException
  │       └─> ErrorStateWidget with Retry button
  │
  └─> Try: commandsRepository.sendCommand()
      └─> Catch: Any Exception
          └─> SnackBar with error message
```

---

## API Endpoint Organization

### New Endpoints (v1.1 of API)
```
GET /api/controllers/room/:roomId
    ↑
    └─ Returns: List<Controller>
    └─ Called by: RoomDetailPage

GET /api/appliances/room/:roomId
    ↑
    └─ Returns: List<Appliance>
    └─ Called by: RoomDetailPage

GET /api/appliances/controller/:controllerId
    ↑
    └─ Returns: List<Appliance>
    └─ Called by: ControllerDetailPage
```

### Existing Endpoints (reused)
```
GET /api/rooms
    ↑ RoomsPage, RoomsListProvider
    
GET /api/controllers
    ↑ ControllersPage, ControllersRepository
    
GET /api/ir-codes/action?type=X&brand=Y
    ↑ ApplianceDetailPage, IrCodesRepository
    
POST /api/commands/send
    ↑ ApplianceDetailPage, CommandsRepository
    
GET /api/commands
    ↑ HistoryPage, CommandsRepository
```

---

## UI Component Hierarchy

```
Scaffold
  ├─ AppBar
  │  ├─ Title (page name)
  │  └─ Actions (refresh, info buttons)
  │
  └─ Body
     └─ FutureBuilder / ListView / SingleChildScrollView
        ├─ Card (info cards with counts)
        │
        ├─ ListView / Column (lists)
        │  └─ Card (list items)
        │     ├─ CircleAvatar (icon)
        │     ├─ ListTile (title, subtitle)
        │     └─ Icon (chevron_right)
        │
        └─ Dialog (for CRUD operations)
           └─ TextField / DropdownButton
```

---

## Command Sending Flow

```
ApplianceDetailPage
  │
  1. Show FutureBuilder with IR codes
  │  └─> GET /api/ir-codes/action?type=X&brand=Y
  │
  2. User taps action
  │  └─> _sendCommand(action, irCodeId)
  │
  3. Extract IDs from nested objects
  │  ├─> roomId = _resolveId(appliance.roomId)
  │  └─> controllerId = _resolveId(appliance.controllerId)
  │
  4. Call commandsRepository.sendCommand()
  │  └─> POST /api/commands/send
  │       {
  │         "room_id": roomId,
  │         "controller_id": controllerId,
  │         "appliance_id": applianceId,
  │         "action": action,
  │         "ir_code_id": irCodeId
  │       }
  │
  5. Receive Command object with status
  │  └─> Command(status: "success"|"failed"|"pending")
  │
  6. Display SnackBar with feedback
  │  └─> SnackBar(content: "Sent 'action' (status: success)")
```

---

## Dynamic Object Resolution

```
Backend API Response
  │
  ├─ List Endpoints (/rooms, /controllers, /appliances)
  │  └─ Nested objects are IDs only (strings)
  │     Example: appliance.roomId = "room_123"
  │
  └─ Detail Endpoints (/rooms/:id, /controllers/:id)
     └─ Nested objects are full objects (maps)
        Example: appliance.roomId = {_id: "room_123", name: "Living Room", ...}

Helper Method:
  _resolveId(dynamic value)
    ├─ if null → return null
    ├─ if String → return value
    ├─ if Map → return value['_id'] or value['id']
    └─ else → return null

Helper Method:
  _getRoomName(dynamic roomId)
    ├─ if null → return "Unknown"
    ├─ if String → return "Unknown" (can't get name from ID alone)
    └─ if Map → return roomId['name']
```

---

## Performance Optimizations

1. **Concurrent Loading in RoomDetailPage**
   ```dart
   Future.wait([
     controllersRepo.getControllersByRoom(roomId),
     appliancesRepo.getAppliancesByRoom(roomId),
   ])
   ```

2. **FutureBuilder Caching**
   - Store future in `_roomDataFuture` variable
   - Prevents rebuilding when parent rebuilds

3. **List Sorting (HistoryPage)**
   - Sort in Dart instead of API
   - More efficient for small datasets

4. **Lazy Loading**
   - Detail pages only load when navigated to
   - Main pages load lists on entry

---

## Testing Paths

### Room Flow
```
HomePage (Rooms tab)
  → RoomsPage (shows list)
  → Tap room #1
  → RoomDetailPage (shows counts & appliances)
  → Tap appliance "Living Room TV"
  → ApplianceDetailPage (shows actions)
  → Tap action "Power On"
  → Command sent, SnackBar shows status
  → Back arrow → RoomDetailPage
  → Info button → RoomInfoPage (shows details)
  → Back arrow → RoomDetailPage
  → Back arrow → RoomsPage
```

### Controller Flow
```
HomePage (Controllers tab)
  → ControllersPage (shows list with room names)
  → Tap controller
  → ControllerDetailPage (shows info & appliances)
  → Tap appliance
  → ApplianceDetailPage (shows actions)
  → Tap action "Power On"
  → Command sent, SnackBar shows status
  → Back arrow → ControllerDetailPage
  → Back arrow → ControllersPage
```

### History Flow
```
HomePage (History tab)
  → HistoryPage (shows command history)
  → Lists latest commands first
  → Each shows status badge and icon
  → Pull to refresh → reloads list
```

---

This completes the 4-page navigation architecture for the Flutter IoT IR Control application! 🎉
