import 'package:flutter/material.dart';
import 'package:flutter_application/src/providers/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    LocaleProvider localeProvider =
        Provider.of<LocaleProvider>(context, listen: true);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://via.placeholder.com/150"),
            ),
            const SizedBox(height: 16),
            const Text(
              "mika",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "wangmikayi@gmail.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                localeProvider.locale.languageCode == 'en'
                    ? localeProvider.setLocale(const Locale('zh'))
                    : localeProvider.setLocale(const Locale('en'));
              },
              child: Text(localizations?.changeLanguage ?? ''),
            ),
          ],
        ),
      ),
    ));
  }
}
