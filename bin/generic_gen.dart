import 'package:args/args.dart';
import 'package:collection/collection.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

part 'src/cli_parser.dart';
part 'src/generator.dart';
part 'src/utils.dart';
part 'src/models/generic_gen.dart';

void main(List<String> arguments) async {
  final _CliParser argParser = _CliParser();

  _GenericGenConf genericGenConf = await _Utils.parseSourceGen();
  final _Generator generator = _Generator(genericGenConf);
  argParser.parse(arguments, generator: generator);
}
