import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../data/models/complaint_model.dart';
import '../../bloc/complaint/complaint_bloc.dart';

/// Form screen for submitting a new complaint.
class CreateComplaintScreen extends StatefulWidget {
  const CreateComplaintScreen({Key? key}) : super(key: key);

  @override
  State<CreateComplaintScreen> createState() => _CreateComplaintScreenState();
}

class _CreateComplaintScreenState extends State<CreateComplaintScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final complaint = ComplaintModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        status: 'Đang xử lý',
        createdAt: DateTime.now(),
      );
      context.read<ComplaintBloc>().add(CreateComplaint(complaint));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo khiếu nại'),
      ),
      body: BlocListener<ComplaintBloc, ComplaintState>(
        listener: (context, state) {
          if (state is ComplaintsLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Đã gửi khiếu nại')),);
            Navigator.of(context).pop();
          } else if (state is ComplaintError) {
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
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Tiêu đề',
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return 'Tiêu đề không được để trống';
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