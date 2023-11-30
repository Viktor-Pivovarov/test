import 'package:cli_dialog/cli_dialog.dart';
import 'package:process_run/shell.dart';

void main() async {
  await _buildApp();
}

Future<void> _buildApp() async {
// execute an action on each entry
  final shell = Shell();

  final dialog = CLI_Dialog(
    booleanQuestions: [
      ['Delete conflicts?', 'delete_conflict'],
    ],
  );

  final answer = dialog.ask();

  final deleteConflictParams =
      answer['delete_conflict'] == true ? '--delete-conflicting-outputs' : '';

//   await shell.run('''
//     dart run build_runner build -v $deleteConflictParams ./packages/jojo_menu
// ''');

  await shell.run('''
./packages/jojo_menu dart run build_runner build -v $deleteConflictParams
''');
}
