part of "../../generic_gen.dart";

class SourceGenConf {
  final String sourceDir;
  final List<String> sourceGenDirs;

  SourceGenConf({required this.sourceDir, required this.sourceGenDirs});

  SourceGenConf.fromJson(Map<String, dynamic> json)
      : sourceDir = json['sourceDir'],
        sourceGenDirs = json['sourceGenDirs'].cast<String>();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sourceDir'] = sourceDir;
    data['sourceGenDirs'] = sourceGenDirs;
    return data;
  }
}
