class ScriptureResponse {
  ScriptureData data;
  ScriptureMeta meta;

  ScriptureResponse({
    required this.data,
    required this.meta,
  });

  factory ScriptureResponse.fromJson(Map<String, dynamic> json) {
    return ScriptureResponse(
      data: ScriptureData.fromJson(json['data']),
      meta: ScriptureMeta.fromJson(json['meta']),
    );
  }
}

class ScriptureData {
  String id;
  String bibleId;
  String number;
  String bookId;
  String reference;
  String copyright;
  int verseCount;
  List<ParagraphResponse> content;
  ScriptureReference? next;
  ScriptureReference? previous;

  ScriptureData({
    required this.id,
    required this.bibleId,
    required this.number,
    required this.bookId,
    required this.reference,
    required this.copyright,
    required this.verseCount,
    required this.content,
    this.next,
    this.previous,
  });

  factory ScriptureData.fromJson(Map<String, dynamic> json) {
    return ScriptureData(
      id: json['id'],
      bibleId: json['bibleId'],
      number: json['number'],
      bookId: json['bookId'],
      reference: json['reference'],
      copyright: json['copyright'],
      verseCount: json['verseCount'],
      content: List<ParagraphResponse>.from(
          json['content'].map((item) => ParagraphResponse.fromJson(item))),
      next: json['next'] != null
          ? ScriptureReference.fromJson(json['next'])
          : null,
      previous: json['previous'] != null
          ? ScriptureReference.fromJson(json['previous'])
          : null,
    );
  }
}

class ScriptureMeta {
  String fums;
  String fumsId;
  String fumsJsInclude;
  String fumsJs;
  String fumsNoScript;

  ScriptureMeta({
    required this.fums,
    required this.fumsId,
    required this.fumsJsInclude,
    required this.fumsJs,
    required this.fumsNoScript,
  });

  factory ScriptureMeta.fromJson(Map<String, dynamic> json) {
    return ScriptureMeta(
      fums: json['fums'],
      fumsId: json['fumsId'],
      fumsJsInclude: json['fumsJsInclude'],
      fumsJs: json['fumsJs'],
      fumsNoScript: json['fumsNoScript'],
    );
  }
}

class ParagraphResponse {
  String name;
  String type;
  ParagraphAttrs attrs;
  List<ParagraphItem> items;

  ParagraphResponse({
    required this.name,
    required this.type,
    required this.attrs,
    required this.items,
  });

  factory ParagraphResponse.fromJson(Map<String, dynamic> json) {
    return ParagraphResponse(
      name: json['name'],
      type: json['type'],
      attrs: ParagraphAttrs.fromJson(json['attrs']),
      items: List<ParagraphItem>.from(
          json['items'].map((item) => ParagraphItem.fromJson(item))),
    );
  }
}

class ParagraphAttrs {
  String style;

  ParagraphAttrs({
    required this.style,
  });

  factory ParagraphAttrs.fromJson(Map<String, dynamic> json) {
    return ParagraphAttrs(
      style: json['style'],
    );
  }
}

class ParagraphItem {
  String text;
  String type;
  ParagraphAttrs attrs;
  List<ParagraphItem> items;

  ParagraphItem({
    required this.text,
    required this.type,
    required this.attrs,
    required this.items,
  });

  factory ParagraphItem.fromJson(Map<String, dynamic> json) {
    return ParagraphItem(
      text: json['text'],
      type: json['type'],
      attrs: ParagraphAttrs.fromJson(json['attrs']),
      items: json['items'] != null
          ? List<ParagraphItem>.from(
          json['items'].map((item) => ParagraphItem.fromJson(item)))
          : [],
    );
  }
}

class ScriptureReference {
  String id;
  String number;
  String bookId;

  ScriptureReference({
    required this.id,
    required this.number,
    required this.bookId,
  });

  factory ScriptureReference.fromJson(Map<String, dynamic> json) {
    return ScriptureReference(
      id: json['id'],
      number: json['number'],
      bookId: json['bookId'],
    );
  }
}
