import 'dart:convert';
import 'dart:io';

void main() async {
  final logPath = r'C:\Users\Lenovo\.gemini\antigravity-ide\brain\68f6a193-9b93-48ab-a714-efd0da8bbd6e\.system_generated\logs\transcript.jsonl';
  final logFile = File(logPath);
  final lines = await logFile.readAsLines();
  final Map<String, String> originalFiles = {};

  for (final line in lines) {
    try {
      final data = jsonDecode(line);
      if (data['type'] == 'VIEW_FILE' && data['status'] == 'DONE') {
        final contentStr = data['content'] ?? '';
        
        if (contentStr.contains('File Path: `file:///')) {
          final pathMatch = RegExp(r'File Path: `file:///(.*?)`').firstMatch(contentStr);
          if (pathMatch != null) {
            final path = pathMatch.group(1)!.replaceAll('/', '\\');
            
            // Only keep the VERY FIRST version of the file we saw
            if (path.endsWith('.dart') && !originalFiles.containsKey(path)) {
              List<String> fileLines = [];
              bool inCode = false;
              
              for (final l in contentStr.split('\n')) {
                if (l.startsWith('The following code has been modified')) {
                  inCode = true;
                  continue;
                }
                if (l.startsWith('The above content shows the entire')) {
                  inCode = false;
                  continue;
                }
                if (inCode) {
                  final match = RegExp(r'^\d+:\s(.*)$').firstMatch(l);
                  if (match != null) {
                    fileLines.add(match.group(1)!);
                  } else {
                    final emptyMatch = RegExp(r'^\d+:$').firstMatch(l);
                    if (emptyMatch != null) {
                      fileLines.add('');
                    } else if (l.trim().isEmpty) {
                      fileLines.add(''); // Handle completely blank lines if they slip through
                    }
                  }
                }
              }
              
              if (fileLines.isNotEmpty) {
                originalFiles[path] = fileLines.join('\n');
              }
            }
          }
        }
      }
    } catch (e) {}
  }

  print('Found ${originalFiles.length} original files in transcript.');
  int restoredCount = 0;
  for (final entry in originalFiles.entries) {
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
