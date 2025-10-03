import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../data/models/request_model.dart';
import '../../bloc/request/request_bloc.dart';

/// Form for creating a new request.
class CreateRequestScreen extends StatefulWidget {
  const CreateRequestScreen({Key? key}) : super(key: key);

  @override
  State<CreateRequestScreen> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<CreateRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  RequestType? _selectedType;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final request = RequestModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: _selectedType ?? RequestType.other,
        description: _descriptionController.text.trim(),
        status: 'Đang xử lý',
        createdAt: DateTime.now(),
      );
      context.read<RequestBloc>().add(CreateRequest(request));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo yêu cầu'),
      ),
      body: BlocListener<RequestBloc, RequestState>(
        listener: (context, state) {
          if (state is RequestsLoaded) {
            // Show a success message and pop back to the list.
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Đã gửi yêu cầu')),);
            Navigator.of(context).pop();
          } else if (state is RequestError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Lỗi: ${state.message}')),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.m),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<RequestType>(
                  decoration: const InputDecoration(
                    labelText: AppStrings.type,
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedType,
                  items: const [
                    DropdownMenuItem(
                      value: RequestType.changeRoom,
                      child: Text('Đổi phòng'),
                    ),
                    DropdownMenuItem(
                      value: RequestType.repair,
                      child: Text('Sửa chữa'),
                    ),
                    DropdownMenuItem(
                      value: RequestType.checkout,
                      child: Text('Trả phòng'),
                    ),
                    DropdownMenuItem(
                      value: RequestType.other,
                      child: Text('Khác'),
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _selectedType = val;
                    });
                  },
                  validator: (val) {
                    if (val == null) {
                      return 'Vui lòng chọn loại';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSizes.m),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: AppStrings.description,
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return 'Mô tả không được để trống';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSizes.l),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: const Text(AppStrings.submit),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}