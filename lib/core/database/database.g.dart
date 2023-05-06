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
  static const VerificationMeta _cinMeta = const VerificationMeta('cin');
  @override
  late final GeneratedColumn<String> cin = GeneratedColumn<String>(
      'cin', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _numTvaMeta = const VerificationMeta('numTva');
  @override
  late final GeneratedColumn<String> numTva = GeneratedColumn<String>(
      'num_tva', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted =
      GeneratedColumn<bool>('is_deleted', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_deleted" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, ville, rue, phone, cin, numTva, createdAt, isDeleted];
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
    if (data.containsKey('cin')) {
      context.handle(
          _cinMeta, cin.isAcceptableOrUnknown(data['cin']!, _cinMeta));
    } else if (isInserting) {
      context.missing(_cinMeta);
    }
    if (data.containsKey('num_tva')) {
      context.handle(_numTvaMeta,
          numTva.isAcceptableOrUnknown(data['num_tva']!, _numTvaMeta));
    } else if (isInserting) {
      context.missing(_numTvaMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
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
      cin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cin'])!,
      numTva: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}num_tva'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
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
  final String cin;
  final String numTva;
  final DateTime createdAt;
  final bool isDeleted;
  const Client(
      {required this.id,
      required this.name,
      required this.ville,
      required this.rue,
      required this.phone,
      required this.cin,
      required this.numTva,
      required this.createdAt,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['ville'] = Variable<String>(ville);
    map['rue'] = Variable<String>(rue);
    map['phone'] = Variable<String>(phone);
    map['cin'] = Variable<String>(cin);
    map['num_tva'] = Variable<String>(numTva);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  ClientsCompanion toCompanion(bool nullToAbsent) {
    return ClientsCompanion(
      id: Value(id),
      name: Value(name),
      ville: Value(ville),
      rue: Value(rue),
      phone: Value(phone),
      cin: Value(cin),
      numTva: Value(numTva),
      createdAt: Value(createdAt),
      isDeleted: Value(isDeleted),
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
      cin: serializer.fromJson<String>(json['cin']),
      numTva: serializer.fromJson<String>(json['numTva']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
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
      'cin': serializer.toJson<String>(cin),
      'numTva': serializer.toJson<String>(numTva),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  Client copyWith(
          {int? id,
          String? name,
          String? ville,
          String? rue,
          String? phone,
          String? cin,
          String? numTva,
          DateTime? createdAt,
          bool? isDeleted}) =>
      Client(
        id: id ?? this.id,
        name: name ?? this.name,
        ville: ville ?? this.ville,
        rue: rue ?? this.rue,
        phone: phone ?? this.phone,
        cin: cin ?? this.cin,
        numTva: numTva ?? this.numTva,
        createdAt: createdAt ?? this.createdAt,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  @override
  String toString() {
    return (StringBuffer('Client(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ville: $ville, ')
          ..write('rue: $rue, ')
          ..write('phone: $phone, ')
          ..write('cin: $cin, ')
          ..write('numTva: $numTva, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, ville, rue, phone, cin, numTva, createdAt, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Client &&
          other.id == this.id &&
          other.name == this.name &&
          other.ville == this.ville &&
          other.rue == this.rue &&
          other.phone == this.phone &&
          other.cin == this.cin &&
          other.numTva == this.numTva &&
          other.createdAt == this.createdAt &&
          other.isDeleted == this.isDeleted);
}

class ClientsCompanion extends UpdateCompanion<Client> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> ville;
  final Value<String> rue;
  final Value<String> phone;
  final Value<String> cin;
  final Value<String> numTva;
  final Value<DateTime> createdAt;
  final Value<bool> isDeleted;
  const ClientsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.ville = const Value.absent(),
    this.rue = const Value.absent(),
    this.phone = const Value.absent(),
    this.cin = const Value.absent(),
    this.numTva = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  ClientsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String ville,
    required String rue,
    required String phone,
    required String cin,
    required String numTva,
    this.createdAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
  })  : name = Value(name),
        ville = Value(ville),
        rue = Value(rue),
        phone = Value(phone),
        cin = Value(cin),
        numTva = Value(numTva);
  static Insertable<Client> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? ville,
    Expression<String>? rue,
    Expression<String>? phone,
    Expression<String>? cin,
    Expression<String>? numTva,
    Expression<DateTime>? createdAt,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (ville != null) 'ville': ville,
      if (rue != null) 'rue': rue,
      if (phone != null) 'phone': phone,
      if (cin != null) 'cin': cin,
      if (numTva != null) 'num_tva': numTva,
      if (createdAt != null) 'created_at': createdAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  ClientsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? ville,
      Value<String>? rue,
      Value<String>? phone,
      Value<String>? cin,
      Value<String>? numTva,
      Value<DateTime>? createdAt,
      Value<bool>? isDeleted}) {
    return ClientsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      ville: ville ?? this.ville,
      rue: rue ?? this.rue,
      phone: phone ?? this.phone,
      cin: cin ?? this.cin,
      numTva: numTva ?? this.numTva,
      createdAt: createdAt ?? this.createdAt,
      isDeleted: isDeleted ?? this.isDeleted,
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
    if (cin.present) {
      map['cin'] = Variable<String>(cin.value);
    }
    if (numTva.present) {
      map['num_tva'] = Variable<String>(numTva.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
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
          ..write('cin: $cin, ')
          ..write('numTva: $numTva, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productPriceMeta =
      const VerificationMeta('productPrice');
  @override
  late final GeneratedColumn<double> productPrice = GeneratedColumn<double>(
      'product_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _libelleMeta =
      const VerificationMeta('libelle');
  @override
  late final GeneratedColumn<String> libelle = GeneratedColumn<String>(
      'libelle', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categorieMeta =
      const VerificationMeta('categorie');
  @override
  late final GeneratedColumn<String> categorie = GeneratedColumn<String>(
      'categorie', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tvaMeta = const VerificationMeta('tva');
  @override
  late final GeneratedColumn<double> tva = GeneratedColumn<double>(
      'tva', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _nbrePieceMeta =
      const VerificationMeta('nbrePiece');
  @override
  late final GeneratedColumn<int> nbrePiece = GeneratedColumn<int>(
      'nbre_piece', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fournisserMeta =
      const VerificationMeta('fournisser');
  @override
  late final GeneratedColumn<String> fournisser = GeneratedColumn<String>(
      'fournisser', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _prixOrTaxMeta =
      const VerificationMeta('prixOrTax');
  @override
  late final GeneratedColumn<double> prixOrTax = GeneratedColumn<double>(
      'prix_or_tax', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted =
      GeneratedColumn<bool>('is_deleted', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_deleted" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        productPrice,
        libelle,
        categorie,
        description,
        tva,
        nbrePiece,
        fournisser,
        prixOrTax,
        createdAt,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? 'products';
  @override
  String get actualTableName => 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_price')) {
      context.handle(
          _productPriceMeta,
          productPrice.isAcceptableOrUnknown(
              data['product_price']!, _productPriceMeta));
    } else if (isInserting) {
      context.missing(_productPriceMeta);
    }
    if (data.containsKey('libelle')) {
      context.handle(_libelleMeta,
          libelle.isAcceptableOrUnknown(data['libelle']!, _libelleMeta));
    } else if (isInserting) {
      context.missing(_libelleMeta);
    }
    if (data.containsKey('categorie')) {
      context.handle(_categorieMeta,
          categorie.isAcceptableOrUnknown(data['categorie']!, _categorieMeta));
    } else if (isInserting) {
      context.missing(_categorieMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('tva')) {
      context.handle(
          _tvaMeta, tva.isAcceptableOrUnknown(data['tva']!, _tvaMeta));
    } else if (isInserting) {
      context.missing(_tvaMeta);
    }
    if (data.containsKey('nbre_piece')) {
      context.handle(_nbrePieceMeta,
          nbrePiece.isAcceptableOrUnknown(data['nbre_piece']!, _nbrePieceMeta));
    } else if (isInserting) {
      context.missing(_nbrePieceMeta);
    }
    if (data.containsKey('fournisser')) {
      context.handle(
          _fournisserMeta,
          fournisser.isAcceptableOrUnknown(
              data['fournisser']!, _fournisserMeta));
    } else if (isInserting) {
      context.missing(_fournisserMeta);
    }
    if (data.containsKey('prix_or_tax')) {
      context.handle(
          _prixOrTaxMeta,
          prixOrTax.isAcceptableOrUnknown(
              data['prix_or_tax']!, _prixOrTaxMeta));
    } else if (isInserting) {
      context.missing(_prixOrTaxMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}product_price'])!,
      libelle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}libelle'])!,
      categorie: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}categorie'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      tva: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tva'])!,
      nbrePiece: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}nbre_piece'])!,
      fournisser: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fournisser'])!,
      prixOrTax: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}prix_or_tax'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final double productPrice;
  final String libelle;
  final String categorie;
  final String? description;
  final double tva;
  final int nbrePiece;
  final String fournisser;
  final double prixOrTax;
  final DateTime createdAt;
  final bool isDeleted;
  const Product(
      {required this.id,
      required this.productPrice,
      required this.libelle,
      required this.categorie,
      this.description,
      required this.tva,
      required this.nbrePiece,
      required this.fournisser,
      required this.prixOrTax,
      required this.createdAt,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_price'] = Variable<double>(productPrice);
    map['libelle'] = Variable<String>(libelle);
    map['categorie'] = Variable<String>(categorie);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['tva'] = Variable<double>(tva);
    map['nbre_piece'] = Variable<int>(nbrePiece);
    map['fournisser'] = Variable<String>(fournisser);
    map['prix_or_tax'] = Variable<double>(prixOrTax);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      productPrice: Value(productPrice),
      libelle: Value(libelle),
      categorie: Value(categorie),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      tva: Value(tva),
      nbrePiece: Value(nbrePiece),
      fournisser: Value(fournisser),
      prixOrTax: Value(prixOrTax),
      createdAt: Value(createdAt),
      isDeleted: Value(isDeleted),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      productPrice: serializer.fromJson<double>(json['productPrice']),
      libelle: serializer.fromJson<String>(json['libelle']),
      categorie: serializer.fromJson<String>(json['categorie']),
      description: serializer.fromJson<String?>(json['description']),
      tva: serializer.fromJson<double>(json['tva']),
      nbrePiece: serializer.fromJson<int>(json['nbrePiece']),
      fournisser: serializer.fromJson<String>(json['fournisser']),
      prixOrTax: serializer.fromJson<double>(json['prixOrTax']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productPrice': serializer.toJson<double>(productPrice),
      'libelle': serializer.toJson<String>(libelle),
      'categorie': serializer.toJson<String>(categorie),
      'description': serializer.toJson<String?>(description),
      'tva': serializer.toJson<double>(tva),
      'nbrePiece': serializer.toJson<int>(nbrePiece),
      'fournisser': serializer.toJson<String>(fournisser),
      'prixOrTax': serializer.toJson<double>(prixOrTax),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  Product copyWith(
          {int? id,
          double? productPrice,
          String? libelle,
          String? categorie,
          Value<String?> description = const Value.absent(),
          double? tva,
          int? nbrePiece,
          String? fournisser,
          double? prixOrTax,
          DateTime? createdAt,
          bool? isDeleted}) =>
      Product(
        id: id ?? this.id,
        productPrice: productPrice ?? this.productPrice,
        libelle: libelle ?? this.libelle,
        categorie: categorie ?? this.categorie,
        description: description.present ? description.value : this.description,
        tva: tva ?? this.tva,
        nbrePiece: nbrePiece ?? this.nbrePiece,
        fournisser: fournisser ?? this.fournisser,
        prixOrTax: prixOrTax ?? this.prixOrTax,
        createdAt: createdAt ?? this.createdAt,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('productPrice: $productPrice, ')
          ..write('libelle: $libelle, ')
          ..write('categorie: $categorie, ')
          ..write('description: $description, ')
          ..write('tva: $tva, ')
          ..write('nbrePiece: $nbrePiece, ')
          ..write('fournisser: $fournisser, ')
          ..write('prixOrTax: $prixOrTax, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productPrice, libelle, categorie,
      description, tva, nbrePiece, fournisser, prixOrTax, createdAt, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.productPrice == this.productPrice &&
          other.libelle == this.libelle &&
          other.categorie == this.categorie &&
          other.description == this.description &&
          other.tva == this.tva &&
          other.nbrePiece == this.nbrePiece &&
          other.fournisser == this.fournisser &&
          other.prixOrTax == this.prixOrTax &&
          other.createdAt == this.createdAt &&
          other.isDeleted == this.isDeleted);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<double> productPrice;
  final Value<String> libelle;
  final Value<String> categorie;
  final Value<String?> description;
  final Value<double> tva;
  final Value<int> nbrePiece;
  final Value<String> fournisser;
  final Value<double> prixOrTax;
  final Value<DateTime> createdAt;
  final Value<bool> isDeleted;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.productPrice = const Value.absent(),
    this.libelle = const Value.absent(),
    this.categorie = const Value.absent(),
    this.description = const Value.absent(),
    this.tva = const Value.absent(),
    this.nbrePiece = const Value.absent(),
    this.fournisser = const Value.absent(),
    this.prixOrTax = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required double productPrice,
    required String libelle,
    required String categorie,
    this.description = const Value.absent(),
    required double tva,
    required int nbrePiece,
    required String fournisser,
    required double prixOrTax,
    this.createdAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
  })  : productPrice = Value(productPrice),
        libelle = Value(libelle),
        categorie = Value(categorie),
        tva = Value(tva),
        nbrePiece = Value(nbrePiece),
        fournisser = Value(fournisser),
        prixOrTax = Value(prixOrTax);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<double>? productPrice,
    Expression<String>? libelle,
    Expression<String>? categorie,
    Expression<String>? description,
    Expression<double>? tva,
    Expression<int>? nbrePiece,
    Expression<String>? fournisser,
    Expression<double>? prixOrTax,
    Expression<DateTime>? createdAt,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productPrice != null) 'product_price': productPrice,
      if (libelle != null) 'libelle': libelle,
      if (categorie != null) 'categorie': categorie,
      if (description != null) 'description': description,
      if (tva != null) 'tva': tva,
      if (nbrePiece != null) 'nbre_piece': nbrePiece,
      if (fournisser != null) 'fournisser': fournisser,
      if (prixOrTax != null) 'prix_or_tax': prixOrTax,
      if (createdAt != null) 'created_at': createdAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<double>? productPrice,
      Value<String>? libelle,
      Value<String>? categorie,
      Value<String?>? description,
      Value<double>? tva,
      Value<int>? nbrePiece,
      Value<String>? fournisser,
      Value<double>? prixOrTax,
      Value<DateTime>? createdAt,
      Value<bool>? isDeleted}) {
    return ProductsCompanion(
      id: id ?? this.id,
      productPrice: productPrice ?? this.productPrice,
      libelle: libelle ?? this.libelle,
      categorie: categorie ?? this.categorie,
      description: description ?? this.description,
      tva: tva ?? this.tva,
      nbrePiece: nbrePiece ?? this.nbrePiece,
      fournisser: fournisser ?? this.fournisser,
      prixOrTax: prixOrTax ?? this.prixOrTax,
      createdAt: createdAt ?? this.createdAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productPrice.present) {
      map['product_price'] = Variable<double>(productPrice.value);
    }
    if (libelle.present) {
      map['libelle'] = Variable<String>(libelle.value);
    }
    if (categorie.present) {
      map['categorie'] = Variable<String>(categorie.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (tva.present) {
      map['tva'] = Variable<double>(tva.value);
    }
    if (nbrePiece.present) {
      map['nbre_piece'] = Variable<int>(nbrePiece.value);
    }
    if (fournisser.present) {
      map['fournisser'] = Variable<String>(fournisser.value);
    }
    if (prixOrTax.present) {
      map['prix_or_tax'] = Variable<double>(prixOrTax.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('productPrice: $productPrice, ')
          ..write('libelle: $libelle, ')
          ..write('categorie: $categorie, ')
          ..write('description: $description, ')
          ..write('tva: $tva, ')
          ..write('nbrePiece: $nbrePiece, ')
          ..write('fournisser: $fournisser, ')
          ..write('prixOrTax: $prixOrTax, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDeleted: $isDeleted')
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
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tvaMeta = const VerificationMeta('tva');
  @override
  late final GeneratedColumn<String> tva = GeneratedColumn<String>(
      'tva', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted =
      GeneratedColumn<bool>('is_deleted', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_deleted" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, ville, rue, phone, tva, createdAt, isDeleted];
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
    if (data.containsKey('tva')) {
      context.handle(
          _tvaMeta, tva.isAcceptableOrUnknown(data['tva']!, _tvaMeta));
    } else if (isInserting) {
      context.missing(_tvaMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
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
      tva: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tva'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
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
  final String tva;
  final DateTime createdAt;
  final bool isDeleted;
  const Fournisser(
      {required this.id,
      required this.name,
      required this.ville,
      required this.rue,
      required this.phone,
      required this.tva,
      required this.createdAt,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['ville'] = Variable<String>(ville);
    map['rue'] = Variable<String>(rue);
    map['phone'] = Variable<String>(phone);
    map['tva'] = Variable<String>(tva);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  FournissersCompanion toCompanion(bool nullToAbsent) {
    return FournissersCompanion(
      id: Value(id),
      name: Value(name),
      ville: Value(ville),
      rue: Value(rue),
      phone: Value(phone),
      tva: Value(tva),
      createdAt: Value(createdAt),
      isDeleted: Value(isDeleted),
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
      tva: serializer.fromJson<String>(json['tva']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
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
      'tva': serializer.toJson<String>(tva),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  Fournisser copyWith(
          {int? id,
          String? name,
          String? ville,
          String? rue,
          String? phone,
          String? tva,
          DateTime? createdAt,
          bool? isDeleted}) =>
      Fournisser(
        id: id ?? this.id,
        name: name ?? this.name,
        ville: ville ?? this.ville,
        rue: rue ?? this.rue,
        phone: phone ?? this.phone,
        tva: tva ?? this.tva,
        createdAt: createdAt ?? this.createdAt,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  @override
  String toString() {
    return (StringBuffer('Fournisser(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ville: $ville, ')
          ..write('rue: $rue, ')
          ..write('phone: $phone, ')
          ..write('tva: $tva, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, ville, rue, phone, tva, createdAt, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Fournisser &&
          other.id == this.id &&
          other.name == this.name &&
          other.ville == this.ville &&
          other.rue == this.rue &&
          other.phone == this.phone &&
          other.tva == this.tva &&
          other.createdAt == this.createdAt &&
          other.isDeleted == this.isDeleted);
}

class FournissersCompanion extends UpdateCompanion<Fournisser> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> ville;
  final Value<String> rue;
  final Value<String> phone;
  final Value<String> tva;
  final Value<DateTime> createdAt;
  final Value<bool> isDeleted;
  const FournissersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.ville = const Value.absent(),
    this.rue = const Value.absent(),
    this.phone = const Value.absent(),
    this.tva = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  FournissersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String ville,
    required String rue,
    required String phone,
    required String tva,
    this.createdAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
  })  : name = Value(name),
        ville = Value(ville),
        rue = Value(rue),
        phone = Value(phone),
        tva = Value(tva);
  static Insertable<Fournisser> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? ville,
    Expression<String>? rue,
    Expression<String>? phone,
    Expression<String>? tva,
    Expression<DateTime>? createdAt,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (ville != null) 'ville': ville,
      if (rue != null) 'rue': rue,
      if (phone != null) 'phone': phone,
      if (tva != null) 'tva': tva,
      if (createdAt != null) 'created_at': createdAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  FournissersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? ville,
      Value<String>? rue,
      Value<String>? phone,
      Value<String>? tva,
      Value<DateTime>? createdAt,
      Value<bool>? isDeleted}) {
    return FournissersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      ville: ville ?? this.ville,
      rue: rue ?? this.rue,
      phone: phone ?? this.phone,
      tva: tva ?? this.tva,
      createdAt: createdAt ?? this.createdAt,
      isDeleted: isDeleted ?? this.isDeleted,
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
    if (tva.present) {
      map['tva'] = Variable<String>(tva.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
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
          ..write('tva: $tva, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $BonLivraisonsTable extends BonLivraisons
    with TableInfo<$BonLivraisonsTable, BonLivraison> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BonLivraisonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _factureIdMeta =
      const VerificationMeta('factureId');
  @override
  late final GeneratedColumn<String> factureId = GeneratedColumn<String>(
      'facture_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
      'client_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES clients (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, factureId, clientId, createdAt];
  @override
  String get aliasedName => _alias ?? 'bon_livraisons';
  @override
  String get actualTableName => 'bon_livraisons';
  @override
  VerificationContext validateIntegrity(Insertable<BonLivraison> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('facture_id')) {
      context.handle(_factureIdMeta,
          factureId.isAcceptableOrUnknown(data['facture_id']!, _factureIdMeta));
    } else if (isInserting) {
      context.missing(_factureIdMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    } else if (isInserting) {
      context.missing(_clientIdMeta);
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
  BonLivraison map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BonLivraison(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      factureId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}facture_id'])!,
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}client_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $BonLivraisonsTable createAlias(String alias) {
    return $BonLivraisonsTable(attachedDatabase, alias);
  }
}

class BonLivraison extends DataClass implements Insertable<BonLivraison> {
  final int id;
  final String factureId;
  final int clientId;
  final DateTime createdAt;
  const BonLivraison(
      {required this.id,
      required this.factureId,
      required this.clientId,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['facture_id'] = Variable<String>(factureId);
    map['client_id'] = Variable<int>(clientId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BonLivraisonsCompanion toCompanion(bool nullToAbsent) {
    return BonLivraisonsCompanion(
      id: Value(id),
      factureId: Value(factureId),
      clientId: Value(clientId),
      createdAt: Value(createdAt),
    );
  }

  factory BonLivraison.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BonLivraison(
      id: serializer.fromJson<int>(json['id']),
      factureId: serializer.fromJson<String>(json['factureId']),
      clientId: serializer.fromJson<int>(json['clientId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'factureId': serializer.toJson<String>(factureId),
      'clientId': serializer.toJson<int>(clientId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BonLivraison copyWith(
          {int? id, String? factureId, int? clientId, DateTime? createdAt}) =>
      BonLivraison(
        id: id ?? this.id,
        factureId: factureId ?? this.factureId,
        clientId: clientId ?? this.clientId,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('BonLivraison(')
          ..write('id: $id, ')
          ..write('factureId: $factureId, ')
          ..write('clientId: $clientId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, factureId, clientId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BonLivraison &&
          other.id == this.id &&
          other.factureId == this.factureId &&
          other.clientId == this.clientId &&
          other.createdAt == this.createdAt);
}

class BonLivraisonsCompanion extends UpdateCompanion<BonLivraison> {
  final Value<int> id;
  final Value<String> factureId;
  final Value<int> clientId;
  final Value<DateTime> createdAt;
  const BonLivraisonsCompanion({
    this.id = const Value.absent(),
    this.factureId = const Value.absent(),
    this.clientId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  BonLivraisonsCompanion.insert({
    this.id = const Value.absent(),
    required String factureId,
    required int clientId,
    this.createdAt = const Value.absent(),
  })  : factureId = Value(factureId),
        clientId = Value(clientId);
  static Insertable<BonLivraison> custom({
    Expression<int>? id,
    Expression<String>? factureId,
    Expression<int>? clientId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (factureId != null) 'facture_id': factureId,
      if (clientId != null) 'client_id': clientId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  BonLivraisonsCompanion copyWith(
      {Value<int>? id,
      Value<String>? factureId,
      Value<int>? clientId,
      Value<DateTime>? createdAt}) {
    return BonLivraisonsCompanion(
      id: id ?? this.id,
      factureId: factureId ?? this.factureId,
      clientId: clientId ?? this.clientId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (factureId.present) {
      map['facture_id'] = Variable<String>(factureId.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BonLivraisonsCompanion(')
          ..write('id: $id, ')
          ..write('factureId: $factureId, ')
          ..write('clientId: $clientId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $BonLivraisonsProdTable extends BonLivraisonsProd
    with TableInfo<$BonLivraisonsProdTable, BonLivraisonsProdData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BonLivraisonsProdTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _bonLivraisonIdMeta =
      const VerificationMeta('bonLivraisonId');
  @override
  late final GeneratedColumn<int> bonLivraisonId = GeneratedColumn<int>(
      'bon_livraison_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES bon_livraisons (id) ON DELETE CASCADE'));
  static const VerificationMeta _nbrColMeta = const VerificationMeta('nbrCol');
  @override
  late final GeneratedColumn<int> nbrCol = GeneratedColumn<int>(
      'nbr_col', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _newProductPriceMeta =
      const VerificationMeta('newProductPrice');
  @override
  late final GeneratedColumn<double> newProductPrice = GeneratedColumn<double>(
      'new_product_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, productId, bonLivraisonId, nbrCol, newProductPrice];
  @override
  String get aliasedName => _alias ?? 'bon_livraisons_prod';
  @override
  String get actualTableName => 'bon_livraisons_prod';
  @override
  VerificationContext validateIntegrity(
      Insertable<BonLivraisonsProdData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('bon_livraison_id')) {
      context.handle(
          _bonLivraisonIdMeta,
          bonLivraisonId.isAcceptableOrUnknown(
              data['bon_livraison_id']!, _bonLivraisonIdMeta));
    } else if (isInserting) {
      context.missing(_bonLivraisonIdMeta);
    }
    if (data.containsKey('nbr_col')) {
      context.handle(_nbrColMeta,
          nbrCol.isAcceptableOrUnknown(data['nbr_col']!, _nbrColMeta));
    } else if (isInserting) {
      context.missing(_nbrColMeta);
    }
    if (data.containsKey('new_product_price')) {
      context.handle(
          _newProductPriceMeta,
          newProductPrice.isAcceptableOrUnknown(
              data['new_product_price']!, _newProductPriceMeta));
    } else if (isInserting) {
      context.missing(_newProductPriceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BonLivraisonsProdData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BonLivraisonsProdData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      bonLivraisonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bon_livraison_id'])!,
      nbrCol: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}nbr_col'])!,
      newProductPrice: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}new_product_price'])!,
    );
  }

  @override
  $BonLivraisonsProdTable createAlias(String alias) {
    return $BonLivraisonsProdTable(attachedDatabase, alias);
  }
}

class BonLivraisonsProdData extends DataClass
    implements Insertable<BonLivraisonsProdData> {
  final int id;
  final int productId;
  final int bonLivraisonId;
  final int nbrCol;
  final double newProductPrice;
  const BonLivraisonsProdData(
      {required this.id,
      required this.productId,
      required this.bonLivraisonId,
      required this.nbrCol,
      required this.newProductPrice});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['bon_livraison_id'] = Variable<int>(bonLivraisonId);
    map['nbr_col'] = Variable<int>(nbrCol);
    map['new_product_price'] = Variable<double>(newProductPrice);
    return map;
  }

  BonLivraisonsProdCompanion toCompanion(bool nullToAbsent) {
    return BonLivraisonsProdCompanion(
      id: Value(id),
      productId: Value(productId),
      bonLivraisonId: Value(bonLivraisonId),
      nbrCol: Value(nbrCol),
      newProductPrice: Value(newProductPrice),
    );
  }

  factory BonLivraisonsProdData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BonLivraisonsProdData(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      bonLivraisonId: serializer.fromJson<int>(json['bonLivraisonId']),
      nbrCol: serializer.fromJson<int>(json['nbrCol']),
      newProductPrice: serializer.fromJson<double>(json['newProductPrice']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'bonLivraisonId': serializer.toJson<int>(bonLivraisonId),
      'nbrCol': serializer.toJson<int>(nbrCol),
      'newProductPrice': serializer.toJson<double>(newProductPrice),
    };
  }

  BonLivraisonsProdData copyWith(
          {int? id,
          int? productId,
          int? bonLivraisonId,
          int? nbrCol,
          double? newProductPrice}) =>
      BonLivraisonsProdData(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        bonLivraisonId: bonLivraisonId ?? this.bonLivraisonId,
        nbrCol: nbrCol ?? this.nbrCol,
        newProductPrice: newProductPrice ?? this.newProductPrice,
      );
  @override
  String toString() {
    return (StringBuffer('BonLivraisonsProdData(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('bonLivraisonId: $bonLivraisonId, ')
          ..write('nbrCol: $nbrCol, ')
          ..write('newProductPrice: $newProductPrice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, productId, bonLivraisonId, nbrCol, newProductPrice);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BonLivraisonsProdData &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.bonLivraisonId == this.bonLivraisonId &&
          other.nbrCol == this.nbrCol &&
          other.newProductPrice == this.newProductPrice);
}

class BonLivraisonsProdCompanion
    extends UpdateCompanion<BonLivraisonsProdData> {
  final Value<int> id;
  final Value<int> productId;
  final Value<int> bonLivraisonId;
  final Value<int> nbrCol;
  final Value<double> newProductPrice;
  const BonLivraisonsProdCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.bonLivraisonId = const Value.absent(),
    this.nbrCol = const Value.absent(),
    this.newProductPrice = const Value.absent(),
  });
  BonLivraisonsProdCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    required int bonLivraisonId,
    required int nbrCol,
    required double newProductPrice,
  })  : productId = Value(productId),
        bonLivraisonId = Value(bonLivraisonId),
        nbrCol = Value(nbrCol),
        newProductPrice = Value(newProductPrice);
  static Insertable<BonLivraisonsProdData> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<int>? bonLivraisonId,
    Expression<int>? nbrCol,
    Expression<double>? newProductPrice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (bonLivraisonId != null) 'bon_livraison_id': bonLivraisonId,
      if (nbrCol != null) 'nbr_col': nbrCol,
      if (newProductPrice != null) 'new_product_price': newProductPrice,
    });
  }

  BonLivraisonsProdCompanion copyWith(
      {Value<int>? id,
      Value<int>? productId,
      Value<int>? bonLivraisonId,
      Value<int>? nbrCol,
      Value<double>? newProductPrice}) {
    return BonLivraisonsProdCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      bonLivraisonId: bonLivraisonId ?? this.bonLivraisonId,
      nbrCol: nbrCol ?? this.nbrCol,
      newProductPrice: newProductPrice ?? this.newProductPrice,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (bonLivraisonId.present) {
      map['bon_livraison_id'] = Variable<int>(bonLivraisonId.value);
    }
    if (nbrCol.present) {
      map['nbr_col'] = Variable<int>(nbrCol.value);
    }
    if (newProductPrice.present) {
      map['new_product_price'] = Variable<double>(newProductPrice.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BonLivraisonsProdCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('bonLivraisonId: $bonLivraisonId, ')
          ..write('nbrCol: $nbrCol, ')
          ..write('newProductPrice: $newProductPrice')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $ClientsTable clients = $ClientsTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $FournissersTable fournissers = $FournissersTable(this);
  late final $BonLivraisonsTable bonLivraisons = $BonLivraisonsTable(this);
  late final $BonLivraisonsProdTable bonLivraisonsProd =
      $BonLivraisonsProdTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [clients, products, fournissers, bonLivraisons, bonLivraisonsProd];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('bon_livraisons',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('bon_livraisons_prod', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}
