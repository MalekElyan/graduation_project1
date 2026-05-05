import 'package:flutter/material.dart';
import 'package:project/cloude_page/application_stat_model.dart';
import 'package:project/view/widget/profile/profile_stat_card.dart';

class ApplicationsStatsSection extends StatelessWidget {
  final List<ApplicationStatModel> stats;

  const ApplicationsStatsSection({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      child: Row(
        children: [
          for (int i = 0; i < stats.length; i++) ...[
            Expanded(
              child: ProfileStatCard(
                value: stats[i].count.toString(),
                label: stats[i].label,
              ),
            ),
            if (i < stats.length - 1) const SizedBox(width: 10),
          ],
        ],
      ),
    );
  }
}
