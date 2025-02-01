// Mocks generated by Mockito 5.4.5 from annotations
// in hotel_booking_app/test/core/connection/presentation/widgets/no_connection_home_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:connectivity_plus/connectivity_plus.dart' as _i2;
import 'package:flutter_bloc/flutter_bloc.dart' as _i6;
import 'package:hotel_booking_app/core/connection/presentation/logic/cubit/internet_cubit.dart'
    as _i5;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeConnectivity_0 extends _i1.SmartFake implements _i2.Connectivity {
  _FakeConnectivity_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeInternetConnectionChecker_1 extends _i1.SmartFake
    implements _i3.InternetConnectionChecker {
  _FakeInternetConnectionChecker_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeStreamSubscription_2<T> extends _i1.SmartFake
    implements _i4.StreamSubscription<T> {
  _FakeStreamSubscription_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeInternetState_3 extends _i1.SmartFake implements _i5.InternetState {
  _FakeInternetState_3(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [InternetCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockInternetCubit extends _i1.Mock implements _i5.InternetCubit {
  MockInternetCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Connectivity get connectivity =>
      (super.noSuchMethod(
            Invocation.getter(#connectivity),
            returnValue: _FakeConnectivity_0(
              this,
              Invocation.getter(#connectivity),
            ),
          )
          as _i2.Connectivity);

  @override
  _i3.InternetConnectionChecker get connectionChecker =>
      (super.noSuchMethod(
            Invocation.getter(#connectionChecker),
            returnValue: _FakeInternetConnectionChecker_1(
              this,
              Invocation.getter(#connectionChecker),
            ),
          )
          as _i3.InternetConnectionChecker);

  @override
  _i4.StreamSubscription<dynamic> get connectivityStreamSubscription =>
      (super.noSuchMethod(
            Invocation.getter(#connectivityStreamSubscription),
            returnValue: _FakeStreamSubscription_2<dynamic>(
              this,
              Invocation.getter(#connectivityStreamSubscription),
            ),
          )
          as _i4.StreamSubscription<dynamic>);

  @override
  set connectivityStreamSubscription(
    _i4.StreamSubscription<dynamic>? _connectivityStreamSubscription,
  ) => super.noSuchMethod(
    Invocation.setter(
      #connectivityStreamSubscription,
      _connectivityStreamSubscription,
    ),
    returnValueForMissingStub: null,
  );

  @override
  _i4.StreamSubscription<dynamic> get internetCheckerSubscription =>
      (super.noSuchMethod(
            Invocation.getter(#internetCheckerSubscription),
            returnValue: _FakeStreamSubscription_2<dynamic>(
              this,
              Invocation.getter(#internetCheckerSubscription),
            ),
          )
          as _i4.StreamSubscription<dynamic>);

  @override
  set internetCheckerSubscription(
    _i4.StreamSubscription<dynamic>? _internetCheckerSubscription,
  ) => super.noSuchMethod(
    Invocation.setter(
      #internetCheckerSubscription,
      _internetCheckerSubscription,
    ),
    returnValueForMissingStub: null,
  );

  @override
  _i5.InternetState get state =>
      (super.noSuchMethod(
            Invocation.getter(#state),
            returnValue: _FakeInternetState_3(this, Invocation.getter(#state)),
          )
          as _i5.InternetState);

  @override
  _i4.Stream<_i5.InternetState> get stream =>
      (super.noSuchMethod(
            Invocation.getter(#stream),
            returnValue: _i4.Stream<_i5.InternetState>.empty(),
          )
          as _i4.Stream<_i5.InternetState>);

  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);

  @override
  void connectivityResultAction(
    List<_i2.ConnectivityResult>? connectivityResult,
  ) => super.noSuchMethod(
    Invocation.method(#connectivityResultAction, [connectivityResult]),
    returnValueForMissingStub: null,
  );

  @override
  void emitInternetDisconnected() => super.noSuchMethod(
    Invocation.method(#emitInternetDisconnected, []),
    returnValueForMissingStub: null,
  );

  @override
  void emitInternetConnected() => super.noSuchMethod(
    Invocation.method(#emitInternetConnected, []),
    returnValueForMissingStub: null,
  );

  @override
  _i4.Future<void> close() =>
      (super.noSuchMethod(
            Invocation.method(#close, []),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);

  @override
  void emit(_i5.InternetState? state) => super.noSuchMethod(
    Invocation.method(#emit, [state]),
    returnValueForMissingStub: null,
  );

  @override
  void onChange(_i6.Change<_i5.InternetState>? change) => super.noSuchMethod(
    Invocation.method(#onChange, [change]),
    returnValueForMissingStub: null,
  );

  @override
  void addError(Object? error, [StackTrace? stackTrace]) => super.noSuchMethod(
    Invocation.method(#addError, [error, stackTrace]),
    returnValueForMissingStub: null,
  );

  @override
  void onError(Object? error, StackTrace? stackTrace) => super.noSuchMethod(
    Invocation.method(#onError, [error, stackTrace]),
    returnValueForMissingStub: null,
  );
}
