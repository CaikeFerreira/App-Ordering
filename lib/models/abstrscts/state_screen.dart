import 'package:flutter/material.dart';

@immutable
abstract class ScreenState {
  const ScreenState();
}

@immutable
class InitScreenState extends ScreenState {
  const InitScreenState();
}

@immutable
class LoadingScreenState extends ScreenState {
  const LoadingScreenState();
}

@immutable
class LoadedScreenState extends ScreenState {
  const LoadedScreenState();
}

@immutable
class UploadScreenState extends ScreenState {
  const UploadScreenState();
}
