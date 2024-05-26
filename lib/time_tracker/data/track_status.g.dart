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
        return TrackStatus.stopped;
      case 1:
        return TrackStatus.running;
      case 2:
        return TrackStatus.paused;
      case 3:
        return TrackStatus.finished;
      default:
        return TrackStatus.stopped;
    }
  }

  @override
  void write(BinaryWriter writer, TrackStatus obj) {
    switch (obj) {
      case TrackStatus.stopped:
        writer.writeByte(0);
        break;
      case TrackStatus.running:
        writer.writeByte(1);
        break;
      case TrackStatus.paused:
        writer.writeByte(2);
        break;
      case TrackStatus.finished:
        writer.writeByte(3);
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
