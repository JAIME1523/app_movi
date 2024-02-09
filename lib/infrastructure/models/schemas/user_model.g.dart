// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserModelCollection on Isar {
  IsarCollection<UserModel> get userModels => this.collection();
}

const UserModelSchema = CollectionSchema(
  name: r'UserModel',
  id: 7195426469378571114,
  properties: {
    r'imaUrl': PropertySchema(
      id: 0,
      name: r'imaUrl',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _userModelEstimateSize,
  serialize: _userModelSerialize,
  deserialize: _userModelDeserialize,
  deserializeProp: _userModelDeserializeProp,
  idName: r'idIra',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userModelGetId,
  getLinks: _userModelGetLinks,
  attach: _userModelAttach,
  version: '3.1.0+1',
);

int _userModelEstimateSize(
  UserModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.imaUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userModelSerialize(
  UserModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.imaUrl);
  writer.writeString(offsets[1], object.name);
}

UserModel _userModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserModel(
    imaUrl: reader.readStringOrNull(offsets[0]),
    name: reader.readStringOrNull(offsets[1]),
  );
  object.idIra = id;
  return object;
}

P _userModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userModelGetId(UserModel object) {
  return object.idIra;
}

List<IsarLinkBase<dynamic>> _userModelGetLinks(UserModel object) {
  return [];
}

void _userModelAttach(IsarCollection<dynamic> col, Id id, UserModel object) {
  object.idIra = id;
}

extension UserModelQueryWhereSort
    on QueryBuilder<UserModel, UserModel, QWhere> {
  QueryBuilder<UserModel, UserModel, QAfterWhere> anyIdIra() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserModelQueryWhere
    on QueryBuilder<UserModel, UserModel, QWhereClause> {
  QueryBuilder<UserModel, UserModel, QAfterWhereClause> idIraEqualTo(Id idIra) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: idIra,
        upper: idIra,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterWhereClause> idIraNotEqualTo(
      Id idIra) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: idIra, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: idIra, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: idIra, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: idIra, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterWhereClause> idIraGreaterThan(
      Id idIra,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: idIra, includeLower: include),
      );
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterWhereClause> idIraLessThan(Id idIra,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: idIra, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterWhereClause> idIraBetween(
    Id lowerIdIra,
    Id upperIdIra, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIdIra,
        includeLower: includeLower,
        upper: upperIdIra,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserModelQueryFilter
    on QueryBuilder<UserModel, UserModel, QFilterCondition> {
  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> idIraEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idIra',
        value: value,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> idIraGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idIra',
        value: value,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> idIraLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idIra',
        value: value,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> idIraBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idIra',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> imaUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imaUrl',
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> imaUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imaUrl',
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> imaUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> imaUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> imaUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> imaUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imaUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> imaUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> imaUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> imaUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> imaUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imaUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> imaUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imaUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> imaUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imaUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension UserModelQueryObject
    on QueryBuilder<UserModel, UserModel, QFilterCondition> {}

extension UserModelQueryLinks
    on QueryBuilder<UserModel, UserModel, QFilterCondition> {}

extension UserModelQuerySortBy on QueryBuilder<UserModel, UserModel, QSortBy> {
  QueryBuilder<UserModel, UserModel, QAfterSortBy> sortByImaUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imaUrl', Sort.asc);
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterSortBy> sortByImaUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imaUrl', Sort.desc);
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension UserModelQuerySortThenBy
    on QueryBuilder<UserModel, UserModel, QSortThenBy> {
  QueryBuilder<UserModel, UserModel, QAfterSortBy> thenByIdIra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idIra', Sort.asc);
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterSortBy> thenByIdIraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idIra', Sort.desc);
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterSortBy> thenByImaUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imaUrl', Sort.asc);
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterSortBy> thenByImaUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imaUrl', Sort.desc);
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<UserModel, UserModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension UserModelQueryWhereDistinct
    on QueryBuilder<UserModel, UserModel, QDistinct> {
  QueryBuilder<UserModel, UserModel, QDistinct> distinctByImaUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imaUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserModel, UserModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension UserModelQueryProperty
    on QueryBuilder<UserModel, UserModel, QQueryProperty> {
  QueryBuilder<UserModel, int, QQueryOperations> idIraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idIra');
    });
  }

  QueryBuilder<UserModel, String?, QQueryOperations> imaUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imaUrl');
    });
  }

  QueryBuilder<UserModel, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
