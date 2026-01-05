# Quick Reference Guide - 4 Page Navigation

## 🚀 Quick Start

### Running the App
```bash
cd d:\Dart\flutter_application_1
flutter pub get          # Already done
flutter run              # Start on connected device
```

### File Locations
```
lib/
├── presentation/pages/
│   ├── home_page.dart                      # Main entry point (4 pages)
│   ├── rooms_page.dart                     # Rooms list
│   ├── room_detail_page.dart               # Room details
│   ├── room_info_page.dart                 # Room info
│   ├── controllers_page.dart               # Controllers list
│   ├── controller_detail_page.dart         # Controller details
│   ├── appliance_detail_page.dart          # Appliance IR actions
│   └── history_page.dart                   # Command history
│
├── data/repositories/
│   ├── room_controllers_repository.dart    # NEW
│   ├── room_appliances_repository.dart     # NEW
│   └── controller_appliances_repository.dart # NEW
│
└── core/providers/
    └── providers.dart                      # UPDATED (3 new providers)
```

---

## 🧭 Navigation Map

### Page 1: Rooms Tab
```
RoomsPage
├── List all rooms
├── Add/Edit/Delete rooms
└── Tap room → RoomDetailPage
    ├── Show controllers count
    ├── Show appliances count
    ├── List appliances (with controller names)
    ├── Info button → RoomInfoPage
    └── Tap appliance → ApplianceDetailPage
        ├── List IR actions
        ├── Tap action → Send command
        └── SnackBar feedback
```

### Page 2: Controllers Tab
```
ControllersPage
├── List all controllers (with room names)
└── Tap controller → ControllerDetailPage
    ├── Show controller info
    ├── Show appliances count
    ├── List appliances
    └── Tap appliance → ApplianceDetailPage
        ├── List IR actions
        ├── Tap action → Send command
        └── SnackBar feedback
```

### Page 3: History Tab
```
HistoryPage
├── List command history (newest first)
├── Show status badges (success/failed/pending)
├── Show formatted dates
└── Pull-to-refresh
```

### Page 4: Telemetry Tab
```
TelemetryPagePlaceholder
└── (Coming soon)
```

---

## 🔗 API Endpoints Quick Reference

### New Endpoints
| Method | Endpoint | Returns | Used By |
|--------|----------|---------|---------|
| GET | `/api/controllers/room/:roomId` | `List<Controller>` | RoomDetailPage |
| GET | `/api/appliances/room/:roomId` | `List<Appliance>` | RoomDetailPage |
| GET | `/api/appliances/controller/:controllerId` | `List<Appliance>` | ControllerDetailPage |

### Existing Endpoints (Reused)
| Method | Endpoint | Returns | Used By |
|--------|----------|---------|---------|
| GET | `/api/rooms` | `List<Room>` | RoomsPage |
| GET | `/api/controllers` | `List<Controller>` | ControllersPage |
| GET | `/api/ir-codes/action?type=X&brand=Y` | `List<IrCode>` | ApplianceDetailPage |
| POST | `/api/commands/send` | `Command` | ApplianceDetailPage |
| GET | `/api/commands` | `List<Command>` | HistoryPage |

---

## 💡 Code Snippets

### Loading Data from Repository
```dart
// In a page
final controllersRepo = ref.read(roomControllersRepositoryProvider);
final controllers = await controllersRepo.getControllersByRoom(roomId: widget.room.id!);
```

### FutureBuilder Pattern
```dart
FutureBuilder<List>(
  future: _futureData,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return LoadingWidget();
    }
    if (snapshot.hasError) {
      return ErrorStateWidget(
        message: snapshot.error.toString(),
        onRetry: () { setState(() => _load()); }
      );
    }
    return ListView(...);
  },
)
```

### Resolving Dynamic IDs
```dart
String? _resolveId(dynamic value) {
  if (value == null) return null;
  if (value is String) return value;
  if (value is Map<String, dynamic>) {
    return value['_id'] as String? ?? value['id'] as String?;
  }
  return null;
}

// Usage
final roomId = _resolveId(appliance.roomId);
```

### Extracting Nested Object Names
```dart
String _getRoomName(dynamic roomId) {
  if (roomId is Map<String, dynamic>) {
    return roomId['name'] ?? 'Unknown';
  }
  return 'Unknown';
}

// Usage
final roomName = _getRoomName(controller.roomId);
```

### Sending Commands
```dart
final command = await ref.read(commandsRepositoryProvider).sendCommand(
  roomId: roomId,
  controllerId: controllerId,
  applianceId: applianceId,
  action: action,
  irCodeId: irCodeId,
);

ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('Sent "$action" (status: ${command.status})'),
    backgroundColor: Colors.green,
  ),
);
```

---

## 🎯 Common Tasks

### Adding a New List Item Type
1. Create a repository method in the appropriate repository
2. Update the provider in `providers.dart`
3. Call it in a FutureBuilder
4. Handle loading/error/empty states

### Adding Navigation Between Pages
1. Import the target page
2. Call `Navigator.push()`
3. Pass necessary data via constructor
4. Ensure back button works (automatic with Navigator)

### Adding New Data Fields
1. Update model class if needed
2. Update repository method if API changes
3. Update UI to display new field

### Fixing a Data Loading Issue
1. Check FutureBuilder error state (print stack trace)
2. Verify API endpoint is correct
3. Check repository method implementation
4. Verify model parsing is correct

---

## 🧪 Testing Checklist

### Functional Testing
- [ ] Rooms page loads and displays rooms
- [ ] Tap room → RoomDetailPage works
- [ ] Controllers count shows correctly
- [ ] Appliances count shows correctly
- [ ] Room info button → RoomInfoPage works
- [ ] Appliance tap → ApplianceDetailPage works
- [ ] Controllers page loads all controllers
- [ ] Controller tap → ControllerDetailPage works
- [ ] Appliance actions load in ApplianceDetailPage
- [ ] Command sending works and shows SnackBar
- [ ] History page shows commands sorted correctly
- [ ] Status badges display correctly

### UI/UX Testing
- [ ] Bottom navigation tabs switch correctly
- [ ] Back buttons work on all pages
- [ ] Loading spinners appear during data fetch
- [ ] Empty states show when no data
- [ ] Error states show with retry button
- [ ] Refresh buttons work (F5 icon)
- [ ] Pull-to-refresh works on list pages
- [ ] SnackBar feedback is readable
- [ ] No layout overflow issues
- [ ] Icons display correctly

### Data Testing
- [ ] Nested object names extracted correctly
- [ ] IDs resolved properly
- [ ] Concurrent loading works (multiple data sources)
- [ ] Date/time formatting correct
- [ ] Status values correct (success/failed/pending)
- [ ] Filtering working (room appliances, controller appliances)

---

## 🐛 Troubleshooting

### Problem: "Page not found" error
**Solution**: 
- Check that page file exists in lib/presentation/pages/
- Verify import statement in source file
- Check class name matches file name

### Problem: "Provider not found" error
**Solution**:
- Check provider is declared in lib/core/providers/providers.dart
- Verify import of providers in the page
- Check provider name spelling

### Problem: Data not loading (blank page)
**Solution**:
- Check FutureBuilder error state (add print in error branch)
- Verify API endpoint returns data (test in Postman)
- Check repository method implementation
- Verify model parsing (JsonKey annotations)

### Problem: Navigation not working
**Solution**:
- Check Navigator.push() call has context
- Verify target page imported
- Check target page constructor parameters
- Ensure MaterialPageRoute wraps page correctly

### Problem: SnackBar not showing
**Solution**:
- Check ScaffoldMessenger is in context
- Verify SnackBar duration is not 0
- Check no other SnackBar blocking it
- Try longer message for visibility

---

## 📈 Performance Tips

### For Large Lists
- Use `ListView.builder()` (done in history_page)
- Implement list pagination if needed
- Consider lazy loading

### For API Calls
- Use concurrent loading where possible (room detail page)
- Cache results if data doesn't change often
- Consider pagination for large datasets

### For UI Responsiveness
- Use FutureBuilder for async operations
- Avoid blocking operations on main thread
- Show loading state to user

---

## 📚 Key Classes & Methods

### Repositories
```dart
class RoomControllersRepository {
  Future<List<Controller>> getControllersByRoom({required String roomId})
}

class RoomAppliancesRepository {
  Future<List<Appliance>> getAppliancesByRoom({required String roomId})
}

class ControllerAppliancesRepository {
  Future<List<Appliance>> getAppliancesByController({required String controllerId})
}
```

### Pages
```dart
class RoomsPage extends ConsumerStatefulWidget
class RoomDetailPage extends ConsumerStatefulWidget
class RoomInfoPage extends StatelessWidget
class ApplianceDetailPage extends ConsumerStatefulWidget
class ControllersPage extends ConsumerStatefulWidget
class ControllerDetailPage extends ConsumerStatefulWidget
class HistoryPage extends ConsumerStatefulWidget
class HomePage extends ConsumerStatefulWidget
```

### Helper Methods
```dart
String? _resolveId(dynamic value)        // Convert ID/object to ID string
String _getRoomName(dynamic roomId)      // Extract room name from object
String _getControllerName(dynamic id)    // Extract controller name from object
String _getApplianceName(dynamic id)     // Extract appliance name from object
```

---

## 🔑 Key Points to Remember

1. **Always use helper methods** for dynamic object resolution
2. **Always handle errors** in FutureBuilder
3. **Always show loading state** during async operations
4. **Always validate data** before displaying
5. **Always provide feedback** for user actions (SnackBar)
6. **Always test navigation** between pages
7. **Always check imports** when adding new pages
8. **Always run `flutter analyze`** before committing

---

## 📞 Quick Support

### Where to Find Things
- Pages: `lib/presentation/pages/`
- Models: `lib/data/models/`
- Repositories: `lib/data/repositories/`
- Providers: `lib/core/providers/providers.dart`
- Widgets: `lib/presentation/widgets/`

### Documentation
- UI Summary: `UI_REFACTOR_SUMMARY.md`
- Architecture: `ARCHITECTURE.md`
- Changelog: `CHANGELOG.md`
- This File: `QUICK_REFERENCE.md`

---

## 🎉 You're Ready to Use!

The 4-page navigation refactor is complete and ready for use. Start with the HomePage and explore all the pages. For questions, refer to the architecture documentation or check the code comments.

Happy coding! 🚀
