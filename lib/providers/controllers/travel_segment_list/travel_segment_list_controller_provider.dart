import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import 'package:hitchcount/providers/controllers/map_controller_provider/open_route_service.dart';
import '../../../models/travel_segment_model.dart';
import '../../../models/travel_segment_type.dart';

class TravelSegmentListNotifier extends StateNotifier<List<TravelSegment>> {
  TravelSegmentListNotifier(List<TravelSegment> state, this.ref) : super(state);
  final Ref ref;

  void add(double startLat, double startLon, TravelSegmentType type) {
    if (state.isEmpty) {
      // override type selection if first segment is added
      type = TravelSegmentType.start;
    }
    final newSegment = TravelSegment(
        id: state.length + 1, lat: startLat, lng: startLon, type: type);

    final updatedState = List<TravelSegment>.from(state);
    final last = _findLast();

    if (last != null) {
      last.next = newSegment;
    }
    newSegment.prev = last;

    updatedState.add(newSegment);

    state = updatedState;
  }

  void remove(TravelSegment travelSegment) {
    final updatedState = List<TravelSegment>.from(state);

    final previousTravelSegment = travelSegment.prev;
    final nextTravelSegment = travelSegment.next;
    if (previousTravelSegment != null) {
      previousTravelSegment.next = nextTravelSegment;
    }
    if (nextTravelSegment != null) {
      nextTravelSegment.prev = previousTravelSegment;
    }
    updatedState.removeWhere((segment) => segment.id == travelSegment.id);

    state = updatedState;
  }

  void movePlaces(int oldIndex, int newIndex) {
    if (oldIndex == newIndex) {
      return;
    }

    List<TravelSegment> segments = getOrderedSegments();
    TravelSegment oldSegment = segments.elementAt(oldIndex);
    TravelSegment newSegment = segments.elementAt(newIndex);
    if (oldSegment.id == newSegment.id) {
      return;
    }
    TravelSegment? oldPrev = oldSegment.prev;
    TravelSegment? oldNext = oldSegment.next;
    TravelSegment? newPrev = newSegment.prev;
    TravelSegment? newNext = newSegment.next;
    bool areAdjacent = oldNext == newSegment ||
        oldPrev == newSegment ||
        newNext == oldSegment ||
        newPrev == oldSegment;

    if (areAdjacent) {
      if (newIndex > oldIndex) {
        oldSegment.next = newNext;
        oldSegment.prev = newSegment;
        newSegment.next = oldSegment;
        newSegment.prev = oldPrev;

        newNext?.prev = oldSegment;
        // newPrev?.next = oldSegment;
        // oldNext?.prev = newSegment;
        oldPrev?.next = newSegment;
      } else {
        newSegment.next = oldNext;
        newSegment.prev = oldSegment;
        oldSegment.next = newSegment;
        oldSegment.prev = newPrev;

        newPrev?.next = oldSegment;
        oldNext?.prev = newSegment;
      }
    } else if (newIndex > oldIndex) {
      oldNext?.prev = oldPrev;
      oldPrev?.next = oldNext;

      newNext?.prev = oldSegment;
      oldSegment.next = newNext;

      oldSegment.prev = newSegment;
      newSegment.next = oldSegment;
    } else if (oldIndex > newIndex) {
      oldNext?.prev = oldPrev;
      oldPrev?.next = oldNext;

      oldSegment.prev = newPrev;
      oldSegment.next = newSegment;

      newSegment.prev = oldSegment;
      newPrev?.next = oldSegment;
    }
    if (newSegment.prev == null) {
      oldSegment.type = newSegment.type ?? TravelSegmentType.hitchhike;
      newSegment.type = TravelSegmentType.start;
    }
    if (oldSegment.prev == null) {
      newSegment.type = oldSegment.type ?? TravelSegmentType.hitchhike;
      oldSegment.type = TravelSegmentType.start;
    }
    state = getOrderedSegments();

    // ref.read(travelSegmentListChangeNotifierProvider.notifier).trigger();
  }

  void switchPlaces(int firstId, int secondId) {
    TravelSegment? first = _findById(firstId);
    TravelSegment? second = _findById(secondId);

    if (first == null || second == null) {
      throw Exception(
          'One or more of the elements were not found in the list, this should not happen');
    }

    // If the two segments are the same, there's no need to switch
    if (first == second) return;

    TravelSegment? firstPrev = first.prev;
    TravelSegment? firstNext = first.next;
    TravelSegment? secondPrev = second.prev;
    TravelSegment? secondNext = second.next;

    // Check if first and second are adjacent
    bool areAdjacent = firstNext == second || secondNext == first;

    // Switch prev and next pointers between first and second
    if (!areAdjacent) {
      // Non-adjacent case
      first.prev = secondPrev;
      first.next = secondNext;
      second.prev = firstPrev;
      second.next = firstNext;

      if (firstPrev != null) {
        firstPrev.next = second;
      }
      if (firstNext != null) {
        firstNext.prev = second;
      }
      if (secondPrev != null) {
        secondPrev.next = first;
      }
      if (secondNext != null) {
        secondNext.prev = first;
      }
    } else {
      // Adjacent case, where first is directly before second
      if (firstNext == second) {
        // First is directly before second
        first.prev = second;
        first.next = secondNext;
        second.prev = firstPrev;
        second.next = first;

        if (firstPrev != null) {
          firstPrev.next = second;
        }
        if (secondNext != null) {
          secondNext.prev = first;
        }
      } else {
        // Second is directly before first
        second.prev = first;
        second.next = firstNext;
        first.prev = secondPrev;
        first.next = second;

        if (secondPrev != null) {
          secondPrev.next = first;
        }
        if (firstNext != null) {
          firstNext.prev = second;
        }
      }
    }
    // ref.read(travelSegmentListChangeNotifierProvider.notifier).trigger();
  }

  List<TravelSegment> getOrderedSegments() {
    List<TravelSegment> orderedSegments = [];
    TravelSegment? currentSegment =
        state.firstWhereOrNull((segment) => segment.prev == null);

    // Traverse the linked list from the first element
    while (currentSegment != null) {
      orderedSegments.add(currentSegment);
      currentSegment = currentSegment.next;
    }

    return orderedSegments;
  }

  TravelSegment? _findLast() {
    if (state.isEmpty) {
      return null;
    }
    return state.firstWhere((travelSegment) => travelSegment.next == null);
  }

  TravelSegment? _findFirst() {
    if (state.isEmpty) {
      return null;
    }
    return state.firstWhere((travelSegment) => travelSegment.prev == null);
  }

  TravelSegment? _findById(int id) {
    if (state.isEmpty) {
      return null;
    }
    return state.firstWhereOrNull((travelSegment) => travelSegment.id == id);
  }

  Future<void> calculateEveryDistance() async {
    OpenRouteService openRouteService = OpenRouteService();
    // calculateSegmentDistance(openRouteService, state[0]);
    List<Future<double?>> futures = state
        .map((TravelSegment travelSegment) {
          return calculateSegmentDistance(openRouteService, travelSegment);
        })
        .nonNulls
        .toList();
    await Future.wait(futures);
    notifyListeners();
  }

  void notifyListeners() {
    ref.read(travelSegmentListChangeNotifierProvider.notifier).trigger();
  }

  Future<double?>? calculateSegmentDistance(
      OpenRouteService openRouteService, TravelSegment travelSegment) {
    if (travelSegment.next == null) {
      return null;
    }
    return openRouteService
        .getDistance(
            startLat: travelSegment.lat,
            startLng: travelSegment.lng,
            endLat: travelSegment.next!.lat,
            endLng: travelSegment.next!.lng)
        .then((distance) => travelSegment.distance = distance);
  }
}

final travelSegmentNotifier =
    StateNotifierProvider<TravelSegmentListNotifier, List<TravelSegment>>(
        (ref) {
  // TravelSegment last = TravelSegment(
  //   id: 5,
  //   lat: 0.0,
  //   lng: 0.0,
  //   type: TravelSegmentType.train,
  //   next: null,
  // );
  // TravelSegment fourth = TravelSegment(
  //   id: 4,
  //   lat: 1.0,
  //   lng: 2.0,
  //   type: TravelSegmentType.hitchhike,
  //   next: last,
  // );
  // last.prev = fourth;
  // TravelSegment third = TravelSegment(
  //   id: 3,
  //   lat: 4.0,
  //   lng: 6.0,
  //   type: TravelSegmentType.plane,
  //   next: fourth,
  // );
  // fourth.prev = third;
  // TravelSegment second = TravelSegment(
  //   id: 2,
  //   lat: 2.0,
  //   lng: 1.0,
  //   type: TravelSegmentType.bike,
  //   next: third,
  // );
  // third.prev = second;
  // TravelSegment first = TravelSegment(
  //     id: 1,
  //     lat: 50.311948,
  //     lng: 18.546321,
  //     type: TravelSegmentType.walk,
  //     next: second);
  // second.prev = first;
  // TravelSegment zero = TravelSegment(
  //     id: 0,
  //     lat: 50.740249,
  //     lng: 17.673989,
  //     type: TravelSegmentType.car,
  //     next: first);
  // first.prev = zero;
  // List<TravelSegment> travelSegments = [
  //   zero,
  //   first,
  //   second,
  //   third,
  //   fourth,
  //   last
  // ];
  List<TravelSegment> travelSegments = [];
  return TravelSegmentListNotifier(travelSegments, ref);
});

class TravelSegmentListChangeNotifier extends StateNotifier<bool> {
  TravelSegmentListChangeNotifier() : super(true);

  void trigger() {
    state = !state;
  }
}

final travelSegmentListChangeNotifierProvider =
    StateNotifierProvider<TravelSegmentListChangeNotifier, bool>(
        (ref) => TravelSegmentListChangeNotifier());
