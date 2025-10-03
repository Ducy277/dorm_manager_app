import 'dart:async';

import '../data/models/user_model.dart';
import '../data/models/contract_model.dart';
import '../data/models/room_model.dart';
import '../data/models/request_model.dart';
import '../data/models/complaint_model.dart';
import '../data/models/notification_model.dart';
import '../data/models/utility_price_model.dart';

/// A simple in‑memory data service used to simulate network calls.
///
/// All methods return futures with slight artificial delays to mimic
/// asynchronous operations. When the backend becomes available, these
/// methods can be replaced with real HTTP or database calls.
class MockDataService {
  MockDataService() {
    _initializeData();
  }

  late UserModel _user;
  late ContractModel _currentContract;
  late List<ContractModel> _contracts;
  late RoomModel _room;
  late List<UtilityPriceModel> _utilityPrices;
  late List<RequestModel> _requests;
  late List<ComplaintModel> _complaints;
  late List<NotificationModel> _notifications;

  void _initializeData() {
    // Initialize the user
    _user = const UserModel(
      id: 'u1',
      name: 'Nguyễn Văn A',
      email: 'nguyenvana@example.com',
      avatarUrl: '',
      dormName: 'Ký túc xá ABC',
    );

    // Initialize contracts
    final now = DateTime.now();
    _currentContract = ContractModel(
      id: 'c1',
      name: 'Hợp đồng 2024-2025',
      status: 'Đang hiệu lực',
      price: 1000000,
      startDate: now.subtract(const Duration(days: 30)),
      endDate: now.add(const Duration(days: 335)),
    );
    final oldContract = ContractModel(
      id: 'c0',
      name: 'Hợp đồng 2023-2024',
      status: 'Đã kết thúc',
      price: 900000,
      startDate: now.subtract(const Duration(days: 395)),
      endDate: now.subtract(const Duration(days: 30)),
    );
    _contracts = [_currentContract, oldContract];

    // Initialize utilities
    _utilityPrices = const [
      UtilityPriceModel(name: 'Giá phòng', price: 1000000),
      UtilityPriceModel(name: 'Điện', price: 3000),
      UtilityPriceModel(name: 'Nước', price: 5000),
      UtilityPriceModel(name: 'Wifi', price: 200000),
    ];

    // Initialize room
    _room = RoomModel(
      id: 'r1',
      name: 'A101',
      type: 'Phòng 4 người',
      roommates: ['Nguyễn Văn A', 'Lê Thị B', 'Trần Văn C', 'Vũ Thị D'],
      facilities: const [
        FacilityItem(name: 'Giường'),
        FacilityItem(name: 'Tủ quần áo'),
        FacilityItem(name: 'Máy lạnh', model: 'AC-123'),
        FacilityItem(name: 'Máy giặt', model: 'WM-456'),
      ],
    );

    // Initialize requests
    _requests = [
      RequestModel(
        id: 'req1',
        type: RequestType.changeRoom,
        description: 'Mong muốn đổi sang phòng yên tĩnh hơn.',
        status: 'Đang xử lý',
        createdAt: now.subtract(const Duration(days: 15)),
      ),
      RequestModel(
        id: 'req2',
        type: RequestType.repair,
        description: 'Sửa chữa quạt trần không hoạt động.',
        status: 'Đã duyệt',
        createdAt: now.subtract(const Duration(days: 7)),
      ),
      RequestModel(
        id: 'req3',
        type: RequestType.other,
        description: 'Đề nghị bổ sung ổ cắm điện.',
        status: 'Từ chối',
        createdAt: now.subtract(const Duration(days: 3)),
      ),
    ];

    // Initialize complaints
    _complaints = [
      ComplaintModel(
        id: 'cmp1',
        title: 'Ồn ào',
        description: 'Phòng bên cạnh quá ồn vào ban đêm.',
        status: 'Đang xử lý',
        createdAt: now.subtract(const Duration(days: 10)),
      ),
      ComplaintModel(
        id: 'cmp2',
        title: 'Vệ sinh',
        description: 'Khu vực nhà tắm không được vệ sinh thường xuyên.',
        status: 'Đã giải quyết',
        createdAt: now.subtract(const Duration(days: 25)),
      ),
    ];

    // Initialize notifications
    _notifications = [
      NotificationModel(
        id: 'noti1',
        title: 'Yêu cầu đã được duyệt',
        body: 'Yêu cầu sửa chữa quạt của bạn đã được duyệt.',
        type: NotificationType.request,
        date: now.subtract(const Duration(days: 2)),
      ),
      NotificationModel(
        id: 'noti2',
        title: 'Hợp đồng sắp hết hạn',
        body: 'Hợp đồng hiện tại của bạn sẽ hết hạn sau 30 ngày.',
        type: NotificationType.system,
        date: now.subtract(const Duration(days: 5)),
      ),
      NotificationModel(
        id: 'noti3',
        title: 'Khiếu nại đã phản hồi',
        body: 'Khiếu nại về tiếng ồn đã được phản hồi.',
        type: NotificationType.complaint,
        date: now.subtract(const Duration(days: 1)),
      ),
      NotificationModel(
        id: 'noti4',
        title: 'Thông báo hệ thống',
        body: 'KTX sẽ cắt nước từ 8h đến 10h ngày mai để bảo trì.',
        type: NotificationType.system,
        date: now.subtract(const Duration(days: 1)),
      ),
      NotificationModel(
        id: 'noti5',
        title: 'Chúc mừng năm mới',
        body: 'Chúc mừng năm mới 2025! Chúc bạn một năm học thành công.',
        type: NotificationType.other,
        date: now.subtract(const Duration(days: 200)),
      ),
    ];
  }

  // User operations
  Future<UserModel> getUser() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _user;
  }

  // Contract operations
  Future<ContractModel> getCurrentContract() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _currentContract;
  }

  Future<List<ContractModel>> getContracts() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List<ContractModel>.from(_contracts);
  }

  Future<ContractModel> getContractById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _contracts.firstWhere((c) => c.id == id);
  }

  Future<List<UtilityPriceModel>> getUtilityPrices() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List<UtilityPriceModel>.from(_utilityPrices);
  }

  Future<ContractModel> renewContract(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _contracts.indexWhere((c) => c.id == id);
    if (index != -1) {
      final now = DateTime.now();
      final updated = ContractModel(
        id: id,
        name: '${_contracts[index].name} (Gia hạn)',
        status: 'Đang hiệu lực',
        price: _contracts[index].price,
        startDate: now,
        endDate: now.add(const Duration(days: 365)),
      );
      _contracts[index] = updated;
      _currentContract = updated;
      return updated;
    }
    throw Exception('Contract not found');
  }

  Future<ContractModel> cancelContract(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _contracts.indexWhere((c) => c.id == id);
    if (index != -1) {
      final canceled = ContractModel(
        id: id,
        name: _contracts[index].name,
        status: 'Đã huỷ',
        price: _contracts[index].price,
        startDate: _contracts[index].startDate,
        endDate: _contracts[index].endDate,
      );
      _contracts[index] = canceled;
      if (_currentContract.id == id) {
        _currentContract = canceled;
      }
      return canceled;
    }
    throw Exception('Contract not found');
  }

  // Room operations
  Future<RoomModel> getRoom() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _room;
  }

  // Request operations
  Future<List<RequestModel>> getRequests() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List<RequestModel>.from(_requests);
  }

  Future<void> addRequest(RequestModel request) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _requests.insert(0, request);
  }

  // Complaint operations
  Future<List<ComplaintModel>> getComplaints() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List<ComplaintModel>.from(_complaints);
  }

  Future<void> addComplaint(ComplaintModel complaint) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _complaints.insert(0, complaint);
  }

  // Notification operations
  Future<List<NotificationModel>> getNotifications({NotificationType? type}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (type == null) {
      return List<NotificationModel>.from(_notifications);
    }
    return _notifications.where((n) => n.type == type).toList();
  }
}