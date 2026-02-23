import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

import '../../theme/app_text_styles.dart';

class RichTextUtils {
  static final Map<String, List<String>> privacyPolicyTags = {
    '0': [
      'Device Details',
      'Approximate Location',
      'Identifiers',
      'User-Provided Data',
    ],
    '2': ['We do not sell'],
    '3': ['their own'],
  };

  static final Map<String, List<String>> structurePrivacyPolicyTags = {
    '0': ['Device ', 'Approximate', 'Identifiers', 'User-Provided'],
    '1': ['Displaying', 'Verifying', 'Communicating', 'Enhancing'],
    '2': ['We do not sell', 'The App', 'We do not'],
    '5': [
      'The right to access',
      'The right to request',
      'The right to opt-out ',
      'To exercise',
    ],
  };

  static final Map<String, List<String>> termsOfServiceTags = {
    '0': ['We do not issue loans'],
    '1': ['Note'],
    '2': ['do not guarantee', 'are not financial advisors'],
    '3': ['Privacy Policy'],
    '6': ['"as is"'],
    '7': [
      'Maximum Rate (APR)',
      'Term',
      'Example',
      '\$5,000',
      '24 months',
      'APR of 25%',
      '\$6,404.88',
      '\$1,404.88',
    ],
    '8': ['Updates', 'Governing Law'],
  };

  static final Map<String, List<String>> structureTermsOfServiceTags = {
    '0': ['We do not issue loans', 'Our goal is to provide'],
    '1': ['Be of legal age', 'Use the app only', 'Provide', 'Note'],
    '2': [
      'We do not guarantee loan',
      'We do not claim that the',
      'We are not financial advisors.',
    ],
    '6': ['We do not guarantee', 'We are not liable for any '],
    '7': ['Maximum Rate (APR)', 'Term: from', 'Example'],
    '8': ['Updates', 'Governing Law'],
  };

  static Widget buildPrivacyPolicyRichText(
    BuildContext context,
    String text,
    String index,
  ) {
    final keyWords = privacyPolicyTags[index] ?? [];
    final List<String> structureKeywords =
        structurePrivacyPolicyTags[index] ?? [];
    return _getStyledText(text, keyWords, structureKeywords);
  }

  static Widget buildTermsOfServiceRichText(
    BuildContext context,
    String text,
    String index,
  ) {
    final keyWords = termsOfServiceTags[index] ?? [];
    final List<String> structureKeywords =
        structureTermsOfServiceTags[index] ?? [];
    return _getStyledText(text, keyWords, structureKeywords);
  }

  static Widget _getStyledText(
    String text,
    List<String> keywords,
    List<String> structureKeywords,
  ) {
    String processedText = text.replaceAll('\r\n', '\n');

    const plainBreakLine =
        'Please borrow responsibly and ensure you can meet the repayment schedule.';

    processedText = processedText.replaceAllMapped(
      RegExp(RegExp.escape(plainBreakLine)),
      (match) => '\n${match.group(0)}',
    );

    for (final word in structureKeywords.toSet()) {
      final pattern = RegExp(r'(?<!\n• )' + RegExp.escape(word));

      processedText = processedText.replaceAllMapped(
        pattern,
        (match) => '\n• ${match.group(0)}',
      );
    }

    final Map<String, StyledTextTag> tags = {};

    final sortedHighlights = List<String>.from(keywords)
      ..sort((a, b) => b.length.compareTo(a.length));

    for (final word in sortedHighlights) {
      final safeTagName = 'k_${word.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_')}';

      processedText = processedText.replaceAllMapped(
        RegExp(RegExp.escape(word)),
        (match) => '<$safeTagName>${match.group(0)}</$safeTagName>',
      );

      tags[safeTagName] = StyledTextTag(
        style: AppTextStyles.serviceTextFont.copyWith(
          fontWeight: FontWeight.bold,
        ),
      );
    }

    return StyledText(
      text: processedText.trim(),
      style: AppTextStyles.serviceTextFont,
      tags: tags,
    );
  }
}
