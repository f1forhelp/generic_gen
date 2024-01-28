// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "../../generic_gen.dart";

class _GenericGenConf {
  List<_Template>? template;
  List<_KeyValueMapping>? extensionMapping;
  List<_KeyValueMapping>? identifierMapping;

  _GenericGenConf.fromJson(Map<String, dynamic> json) {
    if (json['template'] != null) {
      template = <_Template>[];
      json['template'].forEach((v) {
        template!.add(_Template.fromJson(v));
      });
    }
    if (json['extensionMapping'] != null) {
      extensionMapping = <_KeyValueMapping>[];
      json['extensionMapping'].forEach((v) {
        extensionMapping!.add(_KeyValueMapping.fromJson(v));
      });
    }
    if (json['identifierMapping'] != null) {
      identifierMapping = <_KeyValueMapping>[];
      json['identifierMapping'].forEach((v) {
        identifierMapping!.add(_KeyValueMapping.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (template != null) {
      data['template'] = template!.map((v) => v.toJson()).toList();
    }
    if (extensionMapping != null) {
      data['extensionMapping'] =
          extensionMapping!.map((v) => v.toJson()).toList();
    }
    if (identifierMapping != null) {
      data['identifierMapping'] =
          identifierMapping!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class _Template {
  String? templateName;
  String? source;
  String? op;
  List<_KeyValueMapping>? identifierMapping;

  _Template.fromJson(Map<String, dynamic> json) {
    templateName = json['templateName'];
    source = json['source'];
    op = json['op'];
    if (json['identifierMapping'] != null) {
      identifierMapping = <_KeyValueMapping>[];
      json['identifierMapping'].forEach((v) {
        identifierMapping!.add(_KeyValueMapping.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['templateName'] = templateName;
    data['source'] = source;
    data['op'] = op;
    if (identifierMapping != null) {
      data['identifierMapping'] =
          identifierMapping!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class _KeyValueMapping {
  String? name;
  String? replaceWith;

  _KeyValueMapping.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    replaceWith = json['replaceWith'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['replaceWith'] = replaceWith;
    return data;
  }
}

// For reference, here is the generic_gen.json file:
// {
//     "template": [
//         {
//             "templateName": "f1",
//             "source": "custom_generator/f1",
//             "op": "lib/",
//             "identifierMapping": [
//                 {
//                     "name": "org.eclipse.xtend.core.compiler.batch.XtendBatchCompiler",
//                     "replaceWith": "org.eclipse.xtend.core.compiler.batch.XtendBatchCompiler"
//                 }
//             ]
//         }
//     ],
    // "extensionMapping": [
    //     {
    //         "name": "org.eclipse.xtend.core.compiler.batch.XtendBatchCompiler",
    //         "replaceWith": "org.eclipse.xtend.core.compiler.batch.XtendBatchCompiler"
    //     }
    // ]
// }