part of "../generic_gen.dart";

class _CliParser {
  final String version = '0.0.1';
  final ArgParser _argParser = ArgParser()
    ..addOption(
      "template",
      abbr: 't',
      valueHelp: 'templateName',
    );

  void printUsage() {
    _Utils.logInfo('Usage: dart run generic_gen <flags> [arguments]');
    _Utils.logInfo(_argParser.usage);
  }

  void parse(List<String> arguments, {required _Generator generator}) {
    try {
      final ArgResults results = _argParser.parse(arguments);
      // Process the parsed arguments.
      if (results.wasParsed('template')) {
        // get the template name
        final String? templateName = results['template'];
        if (templateName == null) {
          _Utils.logError('Template name is required');
          return;
        }
        generator.generate(templateName);
        return;
      }
    } on FormatException catch (e) {
      // Print usage information if an invalid argument was provided.
      _Utils.logError(e.message);
      print('');
      printUsage();
    }
  }
}
