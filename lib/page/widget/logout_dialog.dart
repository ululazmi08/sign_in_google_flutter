import 'package:flutter/material.dart';
import 'package:test_hi_bank/constant/colors.dart';
import 'package:test_hi_bank/constant/typography.dart';

class LogoutDialog extends StatelessWidget {
  LogoutDialog({
    Key? key,
    required this.tapYes,
    required this.tapBack,
  }) : super(key: key);

  VoidCallback tapYes;
  VoidCallback tapBack;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 8),
      backgroundColor: kColorWhite,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Yakin Ingin Keluar ?',
                style: TStyle.title.copyWith(fontSize: 16)),
            const SizedBox(height: 26),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    color: kColorBlue,
                    onPressed: tapYes,
                    child: Text(
                      'Ya',
                      style: TStyle.title.copyWith(color: kColorWhite),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: MaterialButton(
                    color: kColorRed,
                    onPressed: tapBack,
                    child: Text(
                      'Tidak',
                      style: TStyle.title.copyWith(color: kColorWhite),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
