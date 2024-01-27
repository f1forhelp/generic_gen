part of "../generic_gen.dart";

class _CliParser {
  final String version = '0.0.1';
  final ArgParser _argParser = ArgParser()
    ..addFlag(
      'gen',
      abbr: 'g',
      negatable: false,
      help: 'Show additional command output.',
    )
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Print this usage information.',
    )
    ..addFlag(
      'verbose',
      abbr: 'v',
      negatable: false,
      help: 'Show additional command output.',
    )
    ..addFlag(
      'version',
      negatable: false,
      help: 'Print the tool version.',
    );

  void printUsage() {
    print('Usage: dart generic_gen.dart <flags> [arguments]');
    print(_argParser.usage);
  }

  void parse(List<String> arguments, {required _Generator generator}) {
    try {
      final ArgResults results = _argParser.parse(arguments);
      bool verbose = false;

      // Process the parsed arguments.
      if (results.wasParsed('gen')) {
        generator.generate();
        return;
      }
      if (results.wasParsed('help')) {
        printUsage();
        return;
      }
      if (results.wasParsed('version')) {
        print('generic_gen version: $version');
        return;
      }
      if (results.wasParsed('verbose')) {
        verbose = true;
      }

      // Act on the arguments provided.
      print('Positional arguments: ${results.rest}');
      if (verbose) {
        print('[VERBOSE] All arguments: ${results.arguments}');
      }
    } on FormatException catch (e) {
      // Print usage information if an invalid argument was provided.
      print(e.message);
      print('');
      printUsage();
    }
  }
}
