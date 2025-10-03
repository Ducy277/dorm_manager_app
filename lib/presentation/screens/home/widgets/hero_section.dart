import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/models/user_model.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';

/// A gradient hero section displaying a greeting, dorm and room name
/// along with quick access buttons to common features.
class HeroSection extends StatelessWidget {
  final UserModel user;
  final String roomName;

  const HeroSection({Key? key, required this.user, required this.roomName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      ),
      padding: const EdgeInsets.all(AppSizes.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppStrings.welcome},\n${user.name}',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: AppSizes.s),
          Text(
            user.dormName,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white70),
          ),
          Text(
            'Phòng: $roomName',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: AppSizes.l),

          // 🔹 4 icon luôn cùng 1 hàng
          Row(
            children: [
              Expanded(
                child: _HeroActionItem(
                  icon: Icons.description_outlined,
                  label: AppStrings.contract,
                  onTap: () => context.push('/contracts'),
                ),
              ),
              Expanded(
                child: _HeroActionItem(
                  icon: Icons.send_outlined,
                  label: AppStrings.request,
                  onTap: () => context.push('/requests'),
                ),
              ),
              Expanded(
                child: _HeroActionItem(
                  icon: Icons.report_problem_outlined,
                  label: AppStrings.complaint,
                  onTap: () => context.push('/complaints'),
                ),
              ),
              Expanded(
                child: _HeroActionItem(
                  icon: Icons.pedal_bike_outlined,
                  label: AppStrings.parking,
                  onTap: () => context.push('/parking'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 🔹 Widget item gọn gàng (icon trên + text dưới)
class _HeroActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _HeroActionItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5), // 🔹 tạo khoảng cách giữa các ô
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 22, color: Colors.white),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
