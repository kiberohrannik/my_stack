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
      fields[3] as TrackStatus,
    )
      ..stop = fields[1] as DateTime
      ..duration = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, TimeShot obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.start)
      ..writeByte(1)
      ..write(obj.stop)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
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
