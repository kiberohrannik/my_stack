// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_shot.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeShotAdapter extends TypeAdapter<TimeShot> {
  @override
  final int typeId = 0;

  @override
  TimeShot read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeShot(
      fields[0] as DateTime,
      fields[2] as TrackStatus,
    )..duration = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, TimeShot obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.start)
      ..writeByte(1)
      ..write(obj.duration)
      ..writeByte(2)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeShotAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
