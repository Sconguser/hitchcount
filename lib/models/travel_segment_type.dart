import 'package:flutter/material.dart';

enum TravelSegmentType {
  start('starting point', Icons.pin_drop),
  hitchhike('hitchhiking', Icons.thumb_up),
  car('car', Icons.car_crash),
  train('train', Icons.train),
  walk('walking', Icons.directions_walk),
  plane('plane', Icons.airplanemode_active),
  bike('bike', Icons.pedal_bike);

  const TravelSegmentType(this.name, this.icon);
  final String name;
  final IconData icon;
}
