import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/loading_indicator.dart';
import '../../bloc/complaint/complaint_bloc.dart';
import '../../../data/repositories/complaint_repository.dart';
import 'widgets/complaint_card.dart';

/// Screen displaying a list of complaints sent by the user.
class ComplaintListScreen extends StatelessWidget {
  const ComplaintListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khiếu nại'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/complaints/create');
        },
        child: const Icon(Icons.add),
      ),
      body: BlocProvider(
        create: (context) => ComplaintBloc(
          complaintRepository: context.read<ComplaintRepository>(),
        )..add(const LoadComplaints()),
        child: BlocBuilder<ComplaintBloc, ComplaintState>(
          builder: (context, state) {
            if (state is ComplaintLoading || state is ComplaintInitial) {
              return const LoadingIndicator();
            } else if (state is ComplaintsLoaded) {
              final complaints = state.complaints;
              return ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  final complaint = complaints[index];
                  return ComplaintCard(complaint: complaint);
                },
                separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                itemCount: complaints.length,
              );
            } else if (state is ComplaintError) {
              return Center(child: Text('Lỗi: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}