import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

MarkdownStyleSheet customMarkdownStyle(ColorScheme theme) {
    return MarkdownStyleSheet(
                      textAlign: WrapAlignment.spaceAround,
                      blockSpacing: 15,
                      textScaleFactor: 1.1,
                      h1: TextStyle(
                        color: theme.onSurface,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      h2: TextStyle(
                        color: theme.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      h3: TextStyle(
                        color: theme.onSurface,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
  }