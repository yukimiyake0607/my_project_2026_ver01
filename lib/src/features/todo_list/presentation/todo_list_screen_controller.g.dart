// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodoListScreenController)
final todoListScreenControllerProvider = TodoListScreenControllerProvider._();

final class TodoListScreenControllerProvider
    extends $NotifierProvider<TodoListScreenController, List<Todo>> {
  TodoListScreenControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoListScreenControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoListScreenControllerHash();

  @$internal
  @override
  TodoListScreenController create() => TodoListScreenController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Todo> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Todo>>(value),
    );
  }
}

String _$todoListScreenControllerHash() =>
    r'949cb84d22c6b66c98c78a2da37f305c899c91d2';

abstract class _$TodoListScreenController extends $Notifier<List<Todo>> {
  List<Todo> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Todo>, List<Todo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Todo>, List<Todo>>,
              List<Todo>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
