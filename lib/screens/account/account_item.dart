import 'package:flutter/material.dart';
import 'package:grocery_app/screens/account/legal_about/about_us.dart';
import 'package:grocery_app/screens/account/legal_about/legal_about_page.dart';

import 'legal_about/faq_page.dart';

class AccountItem {
  final String label;
  final String iconPath;
  final Widget page;

  AccountItem(this.label, this.iconPath, this.page);
}

List<AccountItem> accountItems = [
  AccountItem(
      "Orders", "assets/icons/account_icons/orders_icon.svg", FaqPage()),
  // AccountItem(
  //     "My Details", "assets/icons/account_icons/details_icon.svg", FaqPage()),
  AccountItem("Delivery Access", "assets/icons/account_icons/delivery_icon.svg",
      FaqPage()),
  // AccountItem("Payment Methods", "assets/icons/account_icons/payment_icon.svg",
  //     FaqPage()),
  // AccountItem(
  //     "Promo Card", "assets/icons/account_icons/promo_icon.svg", FaqPage()),
  AccountItem("notification",
      "assets/icons/account_icons/notification_icon.svg", LegalAboutPage()),
  AccountItem("legal", "assets/icons/account_icons/notification_icon.svg",
      LegalAboutPage()),
  AccountItem("Help", "assets/icons/account_icons/help_icon.svg", FaqPage()),
  AccountItem(
      "About", "assets/icons/account_icons/about_icon.svg", AboutPage()),
];
