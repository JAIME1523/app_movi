// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movi_shema_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMoviShemaModelCollection on Isar {
  IsarCollection<MoviShemaModel> get moviShemaModels => this.collection();
}

const MoviShemaModelSchema = CollectionSchema(
  name: r'MoviShemaModel',
  id: -4463776975910046022,
  properties: {
    r'page': PropertySchema(
      id: 0,
      name: r'page',
      type: IsarType.long,
    )
  },
  estimateSize: _moviShemaModelEstimateSize,
  serialize: _moviShemaModelSerialize,
  deserialize: _moviShemaModelDeserialize,
  deserializeProp: _moviShemaModelDeserializeProp,
  idName: r'idIra',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _moviShemaModelGetId,
  getLinks: _moviShemaModelGetLinks,
  attach: _moviShemaModelAttach,
  version: '3.1.0+1',
);

int _moviShemaModelEstimateSize(
  MoviShemaModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _moviShemaModelSerialize(
  MoviShemaModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.page);
}

MoviShemaModel _moviShemaModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoviShemaModel(
    page: reader.readLong(offsets[0]),
  );
  object.idIra = id;
  return object;
}

P _moviShemaModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _moviShemaModelGetId(MoviShemaModel object) {
  return object.idIra;
}

List<IsarLinkBase<dynamic>> _moviShemaModelGetLinks(MoviShemaModel object) {
  return [];
}

void _moviShemaModelAttach(
    IsarCollection<dynamic> col, Id id, MoviShemaModel object) {
  object.idIra = id;
}

extension MoviShemaModelQueryWhereSort
    on QueryBuilder<MoviShemaModel, MoviShemaModel, QWhere> {
  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterWhere> anyIdIra() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MoviShemaModelQueryWhere
    on QueryBuilder<MoviShemaModel, MoviShemaModel, QWhereClause> {
  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterWhereClause> idIraEqualTo(
      Id idIra) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: idIra,
        upper: idIra,
      ));
    });
  }

  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterWhereClause>
      idIraNotEqualTo(Id idIra) {
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

  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterWhereClause>
      idIraGreaterThan(Id idIra, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: idIra, includeLower: include),
      );
    });
  }

  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterWhereClause> idIraLessThan(
      Id idIra,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: idIra, includeUpper: include),
      );
    });
  }

  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterWhereClause> idIraBetween(
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

extension MoviShemaModelQueryFilter
    on QueryBuilder<MoviShemaModel, MoviShemaModel, QFilterCondition> {
  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterFilterCondition>
      idIraEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idIra',
        value: value,
      ));
    });
  }

  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterFilterCondition>
      idIraGreaterThan(
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

  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterFilterCondition>
      idIraLessThan(
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

  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterFilterCondition>
      idIraBetween(
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

  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterFilterCondition>
      pageEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'page',
        value: value,
      ));
    });
  }

  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterFilterCondition>
      pageGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'page',
        value: value,
      ));
    });
  }

  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterFilterCondition>
      pageLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'page',
        value: value,
      ));
    });
  }

  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterFilterCondition>
      pageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'page',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MoviShemaModelQueryObject
    on QueryBuilder<MoviShemaModel, MoviShemaModel, QFilterCondition> {}

extension MoviShemaModelQueryLinks
    on QueryBuilder<MoviShemaModel, MoviShemaModel, QFilterCondition> {}

extension MoviShemaModelQuerySortBy
    on QueryBuilder<MoviShemaModel, MoviShemaModel, QSortBy> {
  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterSortBy> sortByPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'page', Sort.asc);
    });
  }

  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterSortBy> sortByPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'page', Sort.desc);
    });
  }
}

extension MoviShemaModelQuerySortThenBy
    on QueryBuilder<MoviShemaModel, MoviShemaModel, QSortThenBy> {
  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterSortBy> thenByIdIra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idIra', Sort.asc);
    });
  }

  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterSortBy> thenByIdIraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idIra', Sort.desc);
    });
  }

  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterSortBy> thenByPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'page', Sort.asc);
    });
  }

  QueryBuilder<MoviShemaModel, MoviShemaModel, QAfterSortBy> thenByPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'page', Sort.desc);
    });
  }
}

extension MoviShemaModelQueryWhereDistinct
    on QueryBuilder<MoviShemaModel, MoviShemaModel, QDistinct> {
  QueryBuilder<MoviShemaModel, MoviShemaModel, QDistinct> distinctByPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'page');
    });
  }
}

extension MoviShemaModelQueryProperty
    on QueryBuilder<MoviShemaModel, MoviShemaModel, QQueryProperty> {
  QueryBuilder<MoviShemaModel, int, QQueryOperations> idIraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idIra');
    });
  }

  QueryBuilder<MoviShemaModel, int, QQueryOperations> pageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'page');
    });
  }
}
