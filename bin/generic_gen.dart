import 'package:args/args.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;

part 'src/cli_parser.dart';
part 'src/generator.dart';
part 'src/utils.dart';
part 'src/models/generic_gen.dart';

void main(List<String> arguments) async {
  final _CliParser argParser = _CliParser();

  SourceGenConf sourceGenConf = await _Utils.parseSourceGen();
  print("======Source Gen Conf======");
  print("${sourceGenConf.toJson()}");
  print("===========================");
  final _Generator generator = _Generator(sourceGenConf);
  argParser.parse(arguments, generator: generator);
}
