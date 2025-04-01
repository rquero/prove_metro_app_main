import 'package:flutter_test/flutter_test.dart';
import 'package:prove_metro_app_main/shared/models/member.dart';

final Map<String, dynamic> memberJson = {
  "id": 12345,
  "name": 'Maria',
  "lastNames": 'Alvarez',
  "dni": '123456',
};

void main() {
  group('Member', () {
    group('fromJson', () {
      test('returns correct Member object', () {
        expect(
          Member.fromJson(memberJson),
          isA<Member>()
              .having((w) => w.id, 'id', memberJson['id'])
              .having((w) => w.name, 'name', memberJson['name'])
              .having((w) => w.lastNames, 'lastNames', memberJson['lastNames'])
              .having((w) => w.dni, 'dni', memberJson['dni']));
      });
    });
  });
}