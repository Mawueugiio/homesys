
import 'package:flutter/material.dart';

/// Base class for all records
abstract class SceneEntity {
  final String title;
  final IconData icon;

  const SceneEntity(this.title, this.icon);
}
