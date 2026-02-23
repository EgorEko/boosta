import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'form_status_state.dart';

class FormStatusCubit extends Cubit<FormStatusState> {
  FormStatusCubit() : super(FormStatusState());

  void tryOpenForm() {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('https://chantrycorporatefinance.uk/backup-app.php'),
      );

    emit(state.copyWith(controller: controller, shouldOpen: true));
  }

  void formClosed() {
    emit(
      FormStatusState(isLoading: false, shouldOpen: false, controller: null),
    );
  }
}
