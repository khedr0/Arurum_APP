import 'dart:convert';
import 'dart:io';

void main() async {
  final logPath = r'C:\Users\Lenovo\.gemini\antigravity-ide\brain\68f6a193-9b93-48ab-a714-efd0da8bbd6e\.system_generated\logs\transcript.jsonl';
  final logFile = File(logPath);
  final lines = await logFile.readAsLines();
  final Map<String, String> latestFiles = {};

  for (final line in lines) {
    try {
      final data = jsonDecode(line);
      if (data['type'] == 'TOOL_CALL') {
        final toolCalls = data['tool_calls'] ?? [];
        for (final call in toolCalls) {
          if (call['function'] == 'default_api:write_to_file') {
            final argsStr = call['arguments'];
            if (argsStr != null) {
              final args = jsonDecode(argsStr);
              final targetFile = args['TargetFile']?.toString().replaceAll('/', '\\');
              final codeContent = args['CodeContent']?.toString();
              if (targetFile != null && codeContent != null) {
                latestFiles[targetFile] = codeContent;
              }
            }
          }
        }
      }
    } catch (e) {}
  }

  print('Found ${latestFiles.length} files written by write_to_file.');
  int restoredCount = 0;
  for (final entry in latestFiles.entries) {
    final path = entry.key;
    final content = entry.value;
    
    if (path.contains('Lemo_APP')) {
      final file = File(path);
      if (await file.exists()) {
        await file.writeAsString(content);
        print('Restored: $path');
        restoredCount++;
      }
    }
  }
  print('Restored $restoredCount files successfully.');
}
