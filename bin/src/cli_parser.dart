part of "../generic_gen.dart";

class _CliParser {
  final String version = '0.0.1';
  final ArgParser _argParser = ArgParser()
    ..addMultiOption(
      "template",
      abbr: 't',
      help: 'Generate a template with the given name.',
      valueHelp: 'templateName',
    )
    // ..addFlag(
    //   'template',
    //   negatable: false,
    //   help: 'Generate a template with the given name.',
    // )
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Print this usage information.',
    );

  void printUsage() {
    print('Usage: dart generic_gen.dart <flags> [arguments]');
    print(_argParser.usage);
  }

  void parse(List<String> arguments, {required _Generator generator}) {
    try {
      final ArgResults results = _argParser.parse(arguments);

      // Process the parsed arguments.
      if (results.wasParsed('template')) {
        dev.log(results.rest.toString());
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
