import 'package:flutter/cupertino.dart';
import '../models/country_code.dart';

/// Default view for country code list item
class DefaultCountryCodeListItemView extends StatelessWidget {
  final TextStyle nameStyle;
  final double flagSize;
  final VoidCallback? onCountryCodeTap;
  final String? locale;
  final TextStyle dialCodeStyle;
  final CountryCode code;

  const DefaultCountryCodeListItemView({
    super.key,
    this.locale,
    this.onCountryCodeTap,
    required this.code,
    this.nameStyle = const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.visible),
    this.flagSize = 30,
    this.dialCodeStyle = const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.visible),
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onCountryCodeTap,
      child: Row(
        children: [
          Text(
            code.flag,
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              locale != null ? code.localizedName(locale!) : code.name,
              style: nameStyle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            code.dialCode,
            style: dialCodeStyle,
          ),
        ],
      ),
    );
  }
}
