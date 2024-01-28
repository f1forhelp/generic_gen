// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "../../generic_gen.dart";

class _GenericGenConf {
  late List<_Template> template;
  late List<_KeyValueMapping> extensionMapping;
  // late List<_KeyValueMapping> identifierMapping;

  _GenericGenConf.fromJson(Map<String, dynamic> json) {
    if (json['template'] != null) {
      template = <_Template>[];
      json['template'].forEach((v) {
        template.add(_Template.fromJson(v));
      });
    } else {
      throw Exception('template is required');
    }
    if (json['extensionMapping'] != null) {
      extensionMapping = <_KeyValueMapping>[];
      json['extensionMapping'].forEach((v) {
        extensionMapping.add(_KeyValueMapping.fromJson(v));
      });
    } else {
      throw Exception('extensionMapping is required');
    }

    // if (json['identifierMapping'] != null) {
    //   identifierMapping = <_KeyValueMapping>[];
    //   json['identifierMapping'].forEach((v) {
    //     identifierMapping.add(_KeyValueMapping.fromJson(v));
    //   });
    // } else {
    //   throw Exception('identifierMapping is required');
    // }
  }
}

class _Template {
  late String templateName;
  late String source;
  late String op;
  late List<_KeyValueMapping> identifierMapping;

  _Template.fromJson(Map<String, dynamic> json) {
    if (json['templateName'] == null) {
      throw Exception('templateName is required');
    } else if (json['source'] == null) {
      throw Exception('source is required');
    } else if (json['op'] == null) {
      throw Exception('op is required');
    } else if (json['identifierMapping'] == null) {
      throw Exception('identifierMapping is required');
    }

    templateName = json['templateName'];
    source = json['source'];
    op = json['op'];
    if (json['identifierMapping'] != null) {
      identifierMapping = <_KeyValueMapping>[];
      json['identifierMapping'].forEach((v) {
        identifierMapping.add(_KeyValueMapping.fromJson(v));
      });
    }
  }
}

class _KeyValueMapping {
  late String name;
  late String replaceWith;

  _KeyValueMapping.fromJson(Map<String, dynamic> json) {
    if (json['name'] == null) {
      throw Exception('name is required');
    } else if (json['replaceWith'] == null) {
      throw Exception('replaceWith is required');
    }

    name = json['name'];
    replaceWith = json['replaceWith'];
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