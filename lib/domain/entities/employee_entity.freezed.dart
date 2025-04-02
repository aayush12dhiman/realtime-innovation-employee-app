// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmployeeEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  DateTime get fromDate => throw _privateConstructorUsedError;
  DateTime? get toDate => throw _privateConstructorUsedError;
  EmployeeType? get employeeType => throw _privateConstructorUsedError;

  /// Create a copy of EmployeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmployeeEntityCopyWith<EmployeeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeEntityCopyWith<$Res> {
  factory $EmployeeEntityCopyWith(
          EmployeeEntity value, $Res Function(EmployeeEntity) then) =
      _$EmployeeEntityCopyWithImpl<$Res, EmployeeEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String role,
      DateTime fromDate,
      DateTime? toDate,
      EmployeeType? employeeType});
}

/// @nodoc
class _$EmployeeEntityCopyWithImpl<$Res, $Val extends EmployeeEntity>
    implements $EmployeeEntityCopyWith<$Res> {
  _$EmployeeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmployeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? fromDate = null,
    Object? toDate = freezed,
    Object? employeeType = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      employeeType: freezed == employeeType
          ? _value.employeeType
          : employeeType // ignore: cast_nullable_to_non_nullable
              as EmployeeType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeEntityImplCopyWith<$Res>
    implements $EmployeeEntityCopyWith<$Res> {
  factory _$$EmployeeEntityImplCopyWith(_$EmployeeEntityImpl value,
          $Res Function(_$EmployeeEntityImpl) then) =
      __$$EmployeeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String role,
      DateTime fromDate,
      DateTime? toDate,
      EmployeeType? employeeType});
}

/// @nodoc
class __$$EmployeeEntityImplCopyWithImpl<$Res>
    extends _$EmployeeEntityCopyWithImpl<$Res, _$EmployeeEntityImpl>
    implements _$$EmployeeEntityImplCopyWith<$Res> {
  __$$EmployeeEntityImplCopyWithImpl(
      _$EmployeeEntityImpl _value, $Res Function(_$EmployeeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmployeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? fromDate = null,
    Object? toDate = freezed,
    Object? employeeType = freezed,
  }) {
    return _then(_$EmployeeEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      employeeType: freezed == employeeType
          ? _value.employeeType
          : employeeType // ignore: cast_nullable_to_non_nullable
              as EmployeeType?,
    ));
  }
}

/// @nodoc

class _$EmployeeEntityImpl extends _EmployeeEntity {
  const _$EmployeeEntityImpl(
      {required this.id,
      required this.name,
      required this.role,
      required this.fromDate,
      this.toDate,
      this.employeeType})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String role;
  @override
  final DateTime fromDate;
  @override
  final DateTime? toDate;
  @override
  final EmployeeType? employeeType;

  @override
  String toString() {
    return 'EmployeeEntity(id: $id, name: $name, role: $role, fromDate: $fromDate, toDate: $toDate, employeeType: $employeeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.employeeType, employeeType) ||
                other.employeeType == employeeType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, role, fromDate, toDate, employeeType);

  /// Create a copy of EmployeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeEntityImplCopyWith<_$EmployeeEntityImpl> get copyWith =>
      __$$EmployeeEntityImplCopyWithImpl<_$EmployeeEntityImpl>(
          this, _$identity);
}

abstract class _EmployeeEntity extends EmployeeEntity {
  const factory _EmployeeEntity(
      {required final String id,
      required final String name,
      required final String role,
      required final DateTime fromDate,
      final DateTime? toDate,
      final EmployeeType? employeeType}) = _$EmployeeEntityImpl;
  const _EmployeeEntity._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String get role;
  @override
  DateTime get fromDate;
  @override
  DateTime? get toDate;
  @override
  EmployeeType? get employeeType;

  /// Create a copy of EmployeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmployeeEntityImplCopyWith<_$EmployeeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
