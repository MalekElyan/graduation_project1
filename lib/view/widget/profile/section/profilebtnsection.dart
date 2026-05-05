import 'package:flutter/material.dart';

import 'package:project/view/widget/common/actionbtn.dart';

class ProfileBtnSection extends StatelessWidget {
  const ProfileBtnSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: AuthPrimaryButton(
              title: 'رسالة',
              isFilled: false,
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: AuthPrimaryButton(
              title: 'تعديل الملف',
              isFilled: true,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
