part of 'form_status_cubit.dart';

class FormStatusState extends Equatable {
  const FormStatusState({
    this.isLoading = false,
    this.shouldOpen = false,
    this.controller,
  });

  final bool isLoading;
  final bool shouldOpen;
  final WebViewController? controller;

  @override
  List<Object?> get props => [isLoading, shouldOpen, controller];

  FormStatusState copyWith({
    bool? isLoading,
    bool? shouldOpen,
    WebViewController? controller,
  }) {
    return FormStatusState(
      isLoading: isLoading ?? this.isLoading,
      shouldOpen: shouldOpen ?? this.shouldOpen,
      controller: controller ?? this.controller,
    );
  }
}
