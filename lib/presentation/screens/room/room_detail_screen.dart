import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/loading_indicator.dart';
import '../../bloc/room/room_bloc.dart';
//import '../../bloc/room/room_state.dart';
import 'widgets/bed_list.dart';
import 'widgets/facility_list.dart';

/// Displays details about the user's current room including roommates and facilities.
class RoomDetailScreen extends StatelessWidget {
  const RoomDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phòng của tôi'),
      ),
      body: BlocBuilder<RoomBloc, RoomState>(
        builder: (context, state) {
          if (state is RoomLoading || state is RoomInitial) {
            return const LoadingIndicator();
          } else if (state is RoomLoaded) {
            final room = state.room;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.m),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    room.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text('Loại phòng: ${room.type}'),
                  const SizedBox(height: AppSizes.m),
                  Text(
                    'Danh sách thành viên',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSizes.s),
                  BedList(roommates: room.roommates),
                  const SizedBox(height: AppSizes.l),
                  Text(
                    'Cơ sở vật chất',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSizes.s),
                  FacilityList(facilities: room.facilities),
                ],
              ),
            );
          } else if (state is RoomError) {
            return Center(child: Text('Lỗi: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}