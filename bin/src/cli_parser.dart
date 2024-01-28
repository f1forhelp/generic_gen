part of "../generic_gen.dart";

class _CliParser {
  final String version = '0.0.1';
  final ArgParser _argParser = ArgParser()
    ..addOption(
      "template",
      abbr: 't',
      help: 'Generate a template with the given name',
      valueHelp: 'templateName',
    )
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Print this usage information.',
    );

  void printUsage() {
    print('Usage: dart run generic_gen <flags> [arguments]');
    print(_argParser.usage);
  }

  void parse(List<String> arguments, {required _Generator generator}) {
    try {
      final ArgResults results = _argParser.parse(arguments);

      // Process the parsed arguments.
      if (results.wasParsed('template')) {
        print(results.arguments);
        generator.generate("f1");
        return;
      }
      if (results.wasParsed('help')) {
        printUsage();
        return;
      }

      // Act on the arguments provided.
      print('Positional arguments: ${results.rest}');
    } on FormatException catch (e) {
      // Print usage information if an invalid argument was provided.
      print(e.message);
      print('');
      printUsage();
    }
  }
}
