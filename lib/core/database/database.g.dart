// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ClientsTable extends Clients with TableInfo<$ClientsTable, Client> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _villeMeta = const VerificationMeta('ville');
  @override
  late final GeneratedColumn<String> ville = GeneratedColumn<String>(
      'ville', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _rueMeta = const VerificationMeta('rue');
  @override
  late final GeneratedColumn<String> rue = GeneratedColumn<String>(
      'rue', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, ville, rue, phone, createdAt];
  @override
  String get aliasedName => _alias ?? 'clients';
  @override
  String get actualTableName => 'clients';
  @override
  VerificationContext validateIntegrity(Insertable<Client> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('ville')) {
      context.handle(
          _villeMeta, ville.isAcceptableOrUnknown(data['ville']!, _villeMeta));
    } else if (isInserting) {
      context.missing(_villeMeta);
    }
    if (data.containsKey('rue')) {
      context.handle(
          _rueMeta, rue.isAcceptableOrUnknown(data['rue']!, _rueMeta));
    } else if (isInserting) {
      context.missing(_rueMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Client map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Client(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      ville: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ville'])!,
      rue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rue'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ClientsTable createAlias(String alias) {
    return $ClientsTable(attachedDatabase, alias);
  }
}

class Client extends DataClass implements Insertable<Client> {
  final int id;
  final String name;
  final String ville;
  final String rue;
  final String phone;
  final DateTime createdAt;
  const Client(
      {required this.id,
      required this.name,
      required this.ville,
      required this.rue,
      required this.phone,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['ville'] = Variable<String>(ville);
    map['rue'] = Variable<String>(rue);
    map['phone'] = Variable<String>(phone);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ClientsCompanion toCompanion(bool nullToAbsent) {
    return ClientsCompanion(
      id: Value(id),
      name: Value(name),
      ville: Value(ville),
      rue: Value(rue),
      phone: Value(phone),
      createdAt: Value(createdAt),
    );
  }

  factory Client.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Client(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      ville: serializer.fromJson<String>(json['ville']),
      rue: serializer.fromJson<String>(json['rue']),
      phone: serializer.fromJson<String>(json['phone']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'ville': serializer.toJson<String>(ville),
      'rue': serializer.toJson<String>(rue),
      'phone': serializer.toJson<String>(phone),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Client copyWith(
          {int? id,
          String? name,
          String? ville,
          String? rue,
          String? phone,
          DateTime? createdAt}) =>
      Client(
        id: id ?? this.id,
        name: name ?? this.name,
        ville: ville ?? this.ville,
        rue: rue ?? this.rue,
        phone: phone ?? this.phone,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Client(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ville: $ville, ')
          ..write('rue: $rue, ')
          ..write('phone: $phone, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, ville, rue, phone, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Client &&
          other.id == this.id &&
          other.name == this.name &&
          other.ville == this.ville &&
          other.rue == this.rue &&
          other.phone == this.phone &&
          other.createdAt == this.createdAt);
}

class ClientsCompanion extends UpdateCompanion<Client> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> ville;
  final Value<String> rue;
  final Value<String> phone;
  final Value<DateTime> createdAt;
  const ClientsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.ville = const Value.absent(),
    this.rue = const Value.absent(),
    this.phone = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ClientsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String ville,
    required String rue,
    required String phone,
    this.createdAt = const Value.absent(),
  })  : name = Value(name),
        ville = Value(ville),
        rue = Value(rue),
        phone = Value(phone);
  static Insertable<Client> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? ville,
    Expression<String>? rue,
    Expression<String>? phone,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (ville != null) 'ville': ville,
      if (rue != null) 'rue': rue,
      if (phone != null) 'phone': phone,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ClientsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? ville,
      Value<String>? rue,
      Value<String>? phone,
      Value<DateTime>? createdAt}) {
    return ClientsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      ville: ville ?? this.ville,
      rue: rue ?? this.rue,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (ville.present) {
      map['ville'] = Variable<String>(ville.value);
    }
    if (rue.present) {
      map['rue'] = Variable<String>(rue.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ville: $ville, ')
          ..write('rue: $rue, ')
          ..write('phone: $phone, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ProduitsTable extends Produits with TableInfo<$ProduitsTable, Produit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProduitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tvaMeta = const VerificationMeta('tva');
  @override
  late final GeneratedColumn<int> tva = GeneratedColumn<int>(
      'tva', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _prixMeta = const VerificationMeta('prix');
  @override
  late final GeneratedColumn<int> prix = GeneratedColumn<int>(
      'prix', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, tva, prix];
  @override
  String get aliasedName => _alias ?? 'produits';
  @override
  String get actualTableName => 'produits';
  @override
  VerificationContext validateIntegrity(Insertable<Produit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('tva')) {
      context.handle(
          _tvaMeta, tva.isAcceptableOrUnknown(data['tva']!, _tvaMeta));
    } else if (isInserting) {
      context.missing(_tvaMeta);
    }
    if (data.containsKey('prix')) {
      context.handle(
          _prixMeta, prix.isAcceptableOrUnknown(data['prix']!, _prixMeta));
    } else if (isInserting) {
      context.missing(_prixMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Produit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Produit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      tva: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tva'])!,
      prix: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}prix'])!,
    );
  }

  @override
  $ProduitsTable createAlias(String alias) {
    return $ProduitsTable(attachedDatabase, alias);
  }
}

class Produit extends DataClass implements Insertable<Produit> {
  final int id;
  final String name;
  final int tva;
  final int prix;
  const Produit(
      {required this.id,
      required this.name,
      required this.tva,
      required this.prix});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['tva'] = Variable<int>(tva);
    map['prix'] = Variable<int>(prix);
    return map;
  }

  ProduitsCompanion toCompanion(bool nullToAbsent) {
    return ProduitsCompanion(
      id: Value(id),
      name: Value(name),
      tva: Value(tva),
      prix: Value(prix),
    );
  }

  factory Produit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Produit(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      tva: serializer.fromJson<int>(json['tva']),
      prix: serializer.fromJson<int>(json['prix']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'tva': serializer.toJson<int>(tva),
      'prix': serializer.toJson<int>(prix),
    };
  }

  Produit copyWith({int? id, String? name, int? tva, int? prix}) => Produit(
        id: id ?? this.id,
        name: name ?? this.name,
        tva: tva ?? this.tva,
        prix: prix ?? this.prix,
      );
  @override
  String toString() {
    return (StringBuffer('Produit(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('tva: $tva, ')
          ..write('prix: $prix')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, tva, prix);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Produit &&
          other.id == this.id &&
          other.name == this.name &&
          other.tva == this.tva &&
          other.prix == this.prix);
}

class ProduitsCompanion extends UpdateCompanion<Produit> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> tva;
  final Value<int> prix;
  const ProduitsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.tva = const Value.absent(),
    this.prix = const Value.absent(),
  });
  ProduitsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int tva,
    required int prix,
  })  : name = Value(name),
        tva = Value(tva),
        prix = Value(prix);
  static Insertable<Produit> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? tva,
    Expression<int>? prix,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (tva != null) 'tva': tva,
      if (prix != null) 'prix': prix,
    });
  }

  ProduitsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? tva,
      Value<int>? prix}) {
    return ProduitsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      tva: tva ?? this.tva,
      prix: prix ?? this.prix,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (tva.present) {
      map['tva'] = Variable<int>(tva.value);
    }
    if (prix.present) {
      map['prix'] = Variable<int>(prix.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProduitsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('tva: $tva, ')
          ..write('prix: $prix')
          ..write(')'))
        .toString();
  }
}

class $FournissersTable extends Fournissers
    with TableInfo<$FournissersTable, Fournisser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FournissersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _villeMeta = const VerificationMeta('ville');
  @override
  late final GeneratedColumn<String> ville = GeneratedColumn<String>(
      'ville', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _rueMeta = const VerificationMeta('rue');
  @override
  late final GeneratedColumn<String> rue = GeneratedColumn<String>(
      'rue', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, ville, rue, phone, createdAt];
  @override
  String get aliasedName => _alias ?? 'fournissers';
  @override
  String get actualTableName => 'fournissers';
  @override
  VerificationContext validateIntegrity(Insertable<Fournisser> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('ville')) {
      context.handle(
          _villeMeta, ville.isAcceptableOrUnknown(data['ville']!, _villeMeta));
    } else if (isInserting) {
      context.missing(_villeMeta);
    }
    if (data.containsKey('rue')) {
      context.handle(
          _rueMeta, rue.isAcceptableOrUnknown(data['rue']!, _rueMeta));
    } else if (isInserting) {
      context.missing(_rueMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Fournisser map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Fournisser(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      ville: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ville'])!,
      rue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rue'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $FournissersTable createAlias(String alias) {
    return $FournissersTable(attachedDatabase, alias);
  }
}

class Fournisser extends DataClass implements Insertable<Fournisser> {
  final int id;
  final String name;
  final String ville;
  final String rue;
  final String phone;
  final DateTime createdAt;
  const Fournisser(
      {required this.id,
      required this.name,
      required this.ville,
      required this.rue,
      required this.phone,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['ville'] = Variable<String>(ville);
    map['rue'] = Variable<String>(rue);
    map['phone'] = Variable<String>(phone);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FournissersCompanion toCompanion(bool nullToAbsent) {
    return FournissersCompanion(
      id: Value(id),
      name: Value(name),
      ville: Value(ville),
      rue: Value(rue),
      phone: Value(phone),
      createdAt: Value(createdAt),
    );
  }

  factory Fournisser.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Fournisser(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      ville: serializer.fromJson<String>(json['ville']),
      rue: serializer.fromJson<String>(json['rue']),
      phone: serializer.fromJson<String>(json['phone']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'ville': serializer.toJson<String>(ville),
      'rue': serializer.toJson<String>(rue),
      'phone': serializer.toJson<String>(phone),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Fournisser copyWith(
          {int? id,
          String? name,
          String? ville,
          String? rue,
          String? phone,
          DateTime? createdAt}) =>
      Fournisser(
        id: id ?? this.id,
        name: name ?? this.name,
        ville: ville ?? this.ville,
        rue: rue ?? this.rue,
        phone: phone ?? this.phone,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Fournisser(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ville: $ville, ')
          ..write('rue: $rue, ')
          ..write('phone: $phone, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, ville, rue, phone, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Fournisser &&
          other.id == this.id &&
          other.name == this.name &&
          other.ville == this.ville &&
          other.rue == this.rue &&
          other.phone == this.phone &&
          other.createdAt == this.createdAt);
}

class FournissersCompanion extends UpdateCompanion<Fournisser> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> ville;
  final Value<String> rue;
  final Value<String> phone;
  final Value<DateTime> createdAt;
  const FournissersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.ville = const Value.absent(),
    this.rue = const Value.absent(),
    this.phone = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FournissersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String ville,
    required String rue,
    required String phone,
    this.createdAt = const Value.absent(),
  })  : name = Value(name),
        ville = Value(ville),
        rue = Value(rue),
        phone = Value(phone);
  static Insertable<Fournisser> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? ville,
    Expression<String>? rue,
    Expression<String>? phone,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (ville != null) 'ville': ville,
      if (rue != null) 'rue': rue,
      if (phone != null) 'phone': phone,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FournissersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? ville,
      Value<String>? rue,
      Value<String>? phone,
      Value<DateTime>? createdAt}) {
    return FournissersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      ville: ville ?? this.ville,
      rue: rue ?? this.rue,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (ville.present) {
      map['ville'] = Variable<String>(ville.value);
    }
    if (rue.present) {
      map['rue'] = Variable<String>(rue.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FournissersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ville: $ville, ')
          ..write('rue: $rue, ')
          ..write('phone: $phone, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $ClientsTable clients = $ClientsTable(this);
  late final $ProduitsTable produits = $ProduitsTable(this);
  late final $FournissersTable fournissers = $FournissersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [clients, produits, fournissers];
}
