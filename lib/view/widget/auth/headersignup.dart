import 'package:flutter/material.dart';
import 'package:project/core/constant/app_colors.dart';

class Headersignup extends StatelessWidget {
  final String title;
  final String subtitle;
  final int currentStep;
  final int totalSteps;
  final List<String> stepLabels;

  const Headersignup({
    super.key,
    required this.title,
    required this.subtitle,
    this.currentStep = 1,
    this.totalSteps = 2,
    this.stepLabels = const ["الأساسية", "التحقق"],
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.only(top: 60, bottom: 30),
      decoration: const BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalSteps * 2 - 1, (index) {
              if (index.isOdd) {
                return const _HeaderStepLine();
              }

              final stepIndex = index ~/ 2;
              final stepNumber = stepIndex + 1;

              return _HeaderStepItem(
                number: stepNumber.toString(),
                label: stepLabels.length > stepIndex
                    ? stepLabels[stepIndex]
                    : "",
                isActive: stepNumber == currentStep,
              );
            }),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class _HeaderStepItem extends StatelessWidget {
  final String number;
  final String label;
  final bool isActive;

  const _HeaderStepItem({
    required this.number,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: isActive ? AppColors.white : Colors.white38,
          child: Text(
            number,
            style: TextStyle(
              color: isActive ? AppColors.primaryGreen : AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.white, fontSize: 12),
        ),
      ],
    );
  }
}

class _HeaderStepLine extends StatelessWidget {
  const _HeaderStepLine();

  @override
  Widget build(BuildContext context) {
    return Container(width: 40, height: 2, color: AppColors.white);
  }
}
