part of "../generic_gen.dart";

class _Generator {
  final _GenericGenConf sourceGenConf;

  _Generator(this.sourceGenConf);

  void generate(String templateName) {
    final _Template? template = sourceGenConf.template
        ?.firstWhereOrNull((element) => element.templateName == templateName);
    if (template == null) {
      throw Exception('Template $templateName not found');
    }

    _copyContent(template.source!, template.op!);

    _extensionMapping(
        path: template.op!, extensions: sourceGenConf.extensionMapping!);
    _identifierMapping(
        path: template.op!, identifiers: template.identifierMapping!);
  }

  void _copyContent(String sourcePath, String destinationPath) {
    // Create a Directory object for the source directory
    Directory sourceDir = Directory(sourcePath);

    // Create a Directory object for the destination directory
    Directory destinationDir = Directory(destinationPath);

    // Create the destination directory if it doesn't exist
    if (!destinationDir.existsSync()) {
      destinationDir.createSync(recursive: true);
    }

    // List all files and directories in the source directory
    List<FileSystemEntity> entities = sourceDir.listSync(recursive: false);

    // Iterate through each file or directory and copy to the destination
    for (var element in entities) {
      if (element is File) {
        File(element.path).copySync(
            '${destinationDir.path}/${element.uri.pathSegments.last}');
      } else if (element is Directory) {
        if (element.uri.pathSegments.length >= 2) {
          _copyContent(element.path,
              '${destinationDir.path}/${element.uri.pathSegments[element.uri.pathSegments.length - 2]}');
        }
      }
    }
  }

  void _extensionMapping(
      {required String path, required List<_KeyValueMapping> extensions}) {
    Directory sourceDir = Directory(path);

    // List all files and directories in the source directory
    List<FileSystemEntity> entities = sourceDir.listSync(recursive: false);

    for (var fs in entities) {
      if (fs is File) {
        String extension = fs.uri.pathSegments.last.split('.').last;
        _KeyValueMapping? mapping = extensions.firstWhereOrNull(
          (element) => element.name == extension,
        );
        if (mapping != null) {
          fs.rename(
              '${fs.parent.path}/${fs.uri.pathSegments.last.replaceAll('.${extension}', '.${mapping.replaceWith}')}');
        }
      } else {
        _extensionMapping(path: fs.path, extensions: extensions);
      }
    }
  }

  void _identifierMapping(
      {required String path, required List<_KeyValueMapping> identifiers}) {
    Directory sourceDir = Directory(path);

    // List all files and directories in the source directory
    List<FileSystemEntity> entities = sourceDir.listSync(recursive: false);

    for (var fs in entities) {
      // _Utils.logInfo(fs.statSync().type == FileSystemEntityType.file
      //     ? 'File: ${fs.uri.pathSegments.last}'
      //     : 'Directory: ${fs.uri.pathSegments.last}');
      if (fs is File) {
        String content = fs.readAsStringSync();
        for (var identifier in identifiers) {
          content =
              content.replaceAll(identifier.name!, identifier.replaceWith!);
        }
        fs.writeAsStringSync(content);
      } else {
        _identifierMapping(path: fs.path, identifiers: identifiers);

        _Utils.logSuccess(fs.uri.pathSegments.toString());
        if (fs.uri.pathSegments.length >= 2) {
          String folderName =
              fs.uri.pathSegments[fs.uri.pathSegments.length - 2];
          _Utils.logError(folderName);
          for (var identi in identifiers) {
            if (folderName == identi.name) {
              _Utils.logError(identi.replaceWith!);
              fs.rename('${fs.parent.path}/${identi.replaceWith}');
              break;
            }
          }

          // fs.rename(
          //     '${fs.parent.path}/${fs.uri.pathSegments[fs.uri.pathSegments.length - 2]}');
        }

        // for (var identifier in identifiers) {
        //   if (fs.uri.pathSegments.last == identifier.name) {
        //     fs.renameSync(identifier.replaceWith!);
        //   }
        // }
      }
    }
  }
}
