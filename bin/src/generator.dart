part of "../generic_gen.dart";

class _Generator {
  final _GenericGenConf sourceGenConf;

  _Generator(this.sourceGenConf);

  void generate(String templateName) {
    final _Template? template = sourceGenConf.template
        ?.firstWhere((element) => element.templateName == templateName);
    if (template == null) {
      throw Exception('Template $templateName not found');
    }

    copyDirectory(template.source!, template.op!);
    // templateDir.
  }

  void generateWithName(String templateName) {
    final _Template? template = sourceGenConf.template
        ?.firstWhere((element) => element.templateName == templateName);
    if (template == null) {
      throw Exception('Template $templateName not found');
    }

    final Directory templateDir = Directory(template.source!);
    // templateDir.
  }

  void copyDirectory(String sourcePath, String destinationPath) {
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
          copyDirectory(element.path,
              '${destinationDir.path}/${element.uri.pathSegments[element.uri.pathSegments.length - 2]}');
        }
      }
    }
  }
}
