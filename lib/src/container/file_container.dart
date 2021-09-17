// Copyright (c) 2021 Mantano. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:universal_io/io.dart';

import '../streams/file_stream.dart';
import '../streams/stream.dart';
import 'container.dart';

/// [Container] providing ad-hoc access to standalone files (eg. single video file).
class FileContainer extends Container {
  FileContainer(this.identifier, this.files);

  /// Unique identifier representing the served contents.
  @override
  final String identifier;

  /// Maps between container relative paths, and the matching absolute path to serve.
  final Map<String, String> files;

  @override
  Future<bool> existsAt(String path) => Future.value(files[path] != null);

  @override
  Future<DataStream> streamAt(String path) async {
    String? filePath = files[path];
    if (filePath == null) {
      throw ContainerException.resourceNotFound(path);
    }
    File file = File(filePath);
    if (!await file.exists()) {
      throw ContainerException.fileNotFound(path);
    }

    return FileStream.fromFile(file);
  }

  @override
  Future<int> resourceLength(String path) async {
    String? filePath = files[path];
    if (filePath == null) {
      throw ContainerException.resourceNotFound(path);
    }
    File file = File(filePath);
    if (!await file.exists()) {
      throw ContainerException.fileNotFound(path);
    }

    return file.length();
  }
}
