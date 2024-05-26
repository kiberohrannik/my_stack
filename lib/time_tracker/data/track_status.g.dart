// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrackStatusAdapter extends TypeAdapter<TrackStatus> {
  @override
  final int typeId = 1;

  @override
  TrackStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TrackStatus.STOPPED;
      case 1:
        return TrackStatus.RUNNING;
      case 2:
        return TrackStatus.PAUSED;
      case 3:
        return TrackStatus.FINISHED;
      case 4:
        return TrackStatus.RUNNING_CLOSED;
      default:
        return TrackStatus.STOPPED;
    }
  }

  @override
  void write(BinaryWriter writer, TrackStatus obj) {
    switch (obj) {
      case TrackStatus.STOPPED:
        writer.writeByte(0);
        break;
      case TrackStatus.RUNNING:
        writer.writeByte(1);
        break;
      case TrackStatus.PAUSED:
        writer.writeByte(2);
        break;
      case TrackStatus.FINISHED:
        writer.writeByte(3);
        break;
      case TrackStatus.RUNNING_CLOSED:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrackStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
