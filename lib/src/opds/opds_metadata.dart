// Copyright (c) 2021 Mantano. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';

class OpdsMetadata with EquatableMixin {
  final String title;
  final int? numberOfItems;
  final int? itemsPerPage;
  final int? currentPage;
  final DateTime? modified;
  final int? position;
  final String? rdfType;

  OpdsMetadata(
      {required this.title,
      this.numberOfItems,
      this.itemsPerPage,
      this.currentPage,
      this.modified,
      this.position,
      this.rdfType});

  @override
  List<Object?> get props => [
        title,
        numberOfItems,
        itemsPerPage,
        currentPage,
        modified,
        position,
        rdfType,
      ];

  @override
  String toString() =>
      'OpdsMetadata{title: $title, numberOfItems: $numberOfItems, '
      'itemsPerPage: $itemsPerPage, currentPage: $currentPage, '
      'modified: $modified, position: $position, rdfType: $rdfType}';
}
