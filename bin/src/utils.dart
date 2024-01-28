part of "../generic_gen.dart";

class _Utils {
  _Utils._();

  static Future<_GenericGenConf> parseSourceGen() async {
    final File sourceGenFile = File('${path.current}/generic_gen.json');
    if (!await sourceGenFile.exists()) {
      throw Exception('generic_gen.json not found');
    }
    final String sourceGenJson = await sourceGenFile.readAsString();
    final Map<String, dynamic> sourceGenMap =
        jsonDecode(sourceGenJson) as Map<String, dynamic>;
    return _GenericGenConf.fromJson(sourceGenMap);
  }
}
