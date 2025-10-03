import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/custom_filter_chips_slider.dart';
import '../../../core/widgets/loading_indicator.dart';
import '../../bloc/request/request_bloc.dart';
import '../../../data/models/request_model.dart';
import '../../../data/repositories/request_repository.dart';
import 'widgets/request_card.dart';

/// Screen displaying the list of user requests with filtering.
class RequestListScreen extends StatefulWidget {
  const RequestListScreen({Key? key}) : super(key: key);

  @override
  State<RequestListScreen> createState() => _RequestListScreenState();
}

class _RequestListScreenState extends State<RequestListScreen> {
  RequestType? _selectedType;

  void _onFilterSelected(BuildContext context, RequestType? type) {
    setState(() {
      _selectedType = type;
    });
    context.read<RequestBloc>().add(LoadRequests(type: type));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yêu cầu'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Pass the existing RequestBloc so the create screen can
          // dispatch events on the same instance and update the list.
          final bloc = context.read<RequestBloc>();
          context.push('/requests/create', extra: bloc);
        },
        child: const Icon(Icons.add),
      ),
      body: BlocProvider(
        create: (context) => RequestBloc(
          requestRepository: context.read<RequestRepository>(),
        )..add(const LoadRequests()),
        child: BlocBuilder<RequestBloc, RequestState>(
          builder: (context, state) {
            if (state is RequestLoading || state is RequestInitial) {
              return const LoadingIndicator();
            } else if (state is RequestsLoaded) {
              var requests = state.requests;
              if (_selectedType != null) {
                requests = requests
                    .where((r) => r.type == _selectedType)
                    .toList();
              }
              return Column(
                children: [
                  // Filter buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomFilterChipsSlider<RequestType>(
                      selectedValue: _selectedType,
                      onSelected: (type) => _onFilterSelected(context, type), // truyền context đúng scope
                      items: const [
                        FilterChipItem('Tất cả', null),
                        FilterChipItem('Đổi phòng', RequestType.changeRoom),
                        FilterChipItem('Sửa chữa', RequestType.repair),
                        FilterChipItem('Trả phòng', RequestType.checkout),
                        FilterChipItem('Khác', RequestType.other),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16.0),
                      itemBuilder: (context, index) {
                        final request = requests[index];
                        return RequestCard(request: request);
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                      itemCount: requests.length,
                    ),
                  ),
                ],
              );
            } else if (state is RequestError) {
              return Center(child: Text('Lỗi: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}