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
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, ville, rue, phone, cin, numTva, createdAt];
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
  const Client(
      {required this.id,
      required this.name,
      required this.ville,
      required this.rue,
      required this.phone,
      required this.cin,
      required this.numTva,
      required this.createdAt});
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
          DateTime? createdAt}) =>
      Client(
        id: id ?? this.id,
        name: name ?? this.name,
        ville: ville ?? this.ville,
        rue: rue ?? this.rue,
        phone: phone ?? this.phone,
        cin: cin ?? this.cin,
        numTva: numTva ?? this.numTva,
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
          ..write('cin: $cin, ')
          ..write('numTva: $numTva, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, ville, rue, phone, cin, numTva, createdAt);
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
          other.createdAt == this.createdAt);
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
  const ClientsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.ville = const Value.absent(),
    this.rue = const Value.absent(),
    this.phone = const Value.absent(),
    this.cin = const Value.absent(),
    this.numTva = const Value.absent(),
    this.createdAt = const Value.absent(),
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
      Value<DateTime>? createdAt}) {
    return ClientsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      ville: ville ?? this.ville,
      rue: rue ?? this.rue,
      phone: phone ?? this.phone,
      cin: cin ?? this.cin,
      numTva: numTva ?? this.numTva,
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
    if (cin.present) {
      map['cin'] = Variable<String>(cin.value);
    }
    if (numTva.present) {
      map['num_tva'] = Variable<String>(numTva.value);
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
          ..write('cin: $cin, ')
          ..write('numTva: $numTva, ')
          ..write('createdAt: $createdAt')
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
  static const VerificationMeta _prixMeta = const VerificationMeta('prix');
  @override
  late final GeneratedColumn<String> prix = GeneratedColumn<String>(
      'prix', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
  late final GeneratedColumn<String> tva = GeneratedColumn<String>(
      'tva', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nbrePieceMeta =
      const VerificationMeta('nbrePiece');
  @override
  late final GeneratedColumn<String> nbrePiece = GeneratedColumn<String>(
      'nbre_piece', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fournisserMeta =
      const VerificationMeta('fournisser');
  @override
  late final GeneratedColumn<String> fournisser = GeneratedColumn<String>(
      'fournisser', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _prixOrTaxMeta =
      const VerificationMeta('prixOrTax');
  @override
  late final GeneratedColumn<String> prixOrTax = GeneratedColumn<String>(
      'prix_or_tax', aliasedName, false,
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
  List<GeneratedColumn> get $columns => [
        id,
        prix,
        libelle,
        categorie,
        description,
        tva,
        nbrePiece,
        fournisser,
        prixOrTax,
        createdAt
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
    if (data.containsKey('prix')) {
      context.handle(
          _prixMeta, prix.isAcceptableOrUnknown(data['prix']!, _prixMeta));
    } else if (isInserting) {
      context.missing(_prixMeta);
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
      prix: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}prix'])!,
      libelle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}libelle'])!,
      categorie: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}categorie'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      tva: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tva'])!,
      nbrePiece: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nbre_piece'])!,
      fournisser: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fournisser'])!,
      prixOrTax: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}prix_or_tax'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String prix;
  final String libelle;
  final String categorie;
  final String? description;
  final String tva;
  final String nbrePiece;
  final String fournisser;
  final String prixOrTax;
  final DateTime createdAt;
  const Product(
      {required this.id,
      required this.prix,
      required this.libelle,
      required this.categorie,
      this.description,
      required this.tva,
      required this.nbrePiece,
      required this.fournisser,
      required this.prixOrTax,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['prix'] = Variable<String>(prix);
    map['libelle'] = Variable<String>(libelle);
    map['categorie'] = Variable<String>(categorie);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['tva'] = Variable<String>(tva);
    map['nbre_piece'] = Variable<String>(nbrePiece);
    map['fournisser'] = Variable<String>(fournisser);
    map['prix_or_tax'] = Variable<String>(prixOrTax);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      prix: Value(prix),
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
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      prix: serializer.fromJson<String>(json['prix']),
      libelle: serializer.fromJson<String>(json['libelle']),
      categorie: serializer.fromJson<String>(json['categorie']),
      description: serializer.fromJson<String?>(json['description']),
      tva: serializer.fromJson<String>(json['tva']),
      nbrePiece: serializer.fromJson<String>(json['nbrePiece']),
      fournisser: serializer.fromJson<String>(json['fournisser']),
      prixOrTax: serializer.fromJson<String>(json['prixOrTax']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'prix': serializer.toJson<String>(prix),
      'libelle': serializer.toJson<String>(libelle),
      'categorie': serializer.toJson<String>(categorie),
      'description': serializer.toJson<String?>(description),
      'tva': serializer.toJson<String>(tva),
      'nbrePiece': serializer.toJson<String>(nbrePiece),
      'fournisser': serializer.toJson<String>(fournisser),
      'prixOrTax': serializer.toJson<String>(prixOrTax),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Product copyWith(
          {int? id,
          String? prix,
          String? libelle,
          String? categorie,
          Value<String?> description = const Value.absent(),
          String? tva,
          String? nbrePiece,
          String? fournisser,
          String? prixOrTax,
          DateTime? createdAt}) =>
      Product(
        id: id ?? this.id,
        prix: prix ?? this.prix,
        libelle: libelle ?? this.libelle,
        categorie: categorie ?? this.categorie,
        description: description.present ? description.value : this.description,
        tva: tva ?? this.tva,
        nbrePiece: nbrePiece ?? this.nbrePiece,
        fournisser: fournisser ?? this.fournisser,
        prixOrTax: prixOrTax ?? this.prixOrTax,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('prix: $prix, ')
          ..write('libelle: $libelle, ')
          ..write('categorie: $categorie, ')
          ..write('description: $description, ')
          ..write('tva: $tva, ')
          ..write('nbrePiece: $nbrePiece, ')
          ..write('fournisser: $fournisser, ')
          ..write('prixOrTax: $prixOrTax, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, prix, libelle, categorie, description,
      tva, nbrePiece, fournisser, prixOrTax, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.prix == this.prix &&
          other.libelle == this.libelle &&
          other.categorie == this.categorie &&
          other.description == this.description &&
          other.tva == this.tva &&
          other.nbrePiece == this.nbrePiece &&
          other.fournisser == this.fournisser &&
          other.prixOrTax == this.prixOrTax &&
          other.createdAt == this.createdAt);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> prix;
  final Value<String> libelle;
  final Value<String> categorie;
  final Value<String?> description;
  final Value<String> tva;
  final Value<String> nbrePiece;
  final Value<String> fournisser;
  final Value<String> prixOrTax;
  final Value<DateTime> createdAt;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.prix = const Value.absent(),
    this.libelle = const Value.absent(),
    this.categorie = const Value.absent(),
    this.description = const Value.absent(),
    this.tva = const Value.absent(),
    this.nbrePiece = const Value.absent(),
    this.fournisser = const Value.absent(),
    this.prixOrTax = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String prix,
    required String libelle,
    required String categorie,
    this.description = const Value.absent(),
    required String tva,
    required String nbrePiece,
    required String fournisser,
    required String prixOrTax,
    this.createdAt = const Value.absent(),
  })  : prix = Value(prix),
        libelle = Value(libelle),
        categorie = Value(categorie),
        tva = Value(tva),
        nbrePiece = Value(nbrePiece),
        fournisser = Value(fournisser),
        prixOrTax = Value(prixOrTax);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? prix,
    Expression<String>? libelle,
    Expression<String>? categorie,
    Expression<String>? description,
    Expression<String>? tva,
    Expression<String>? nbrePiece,
    Expression<String>? fournisser,
    Expression<String>? prixOrTax,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (prix != null) 'prix': prix,
      if (libelle != null) 'libelle': libelle,
      if (categorie != null) 'categorie': categorie,
      if (description != null) 'description': description,
      if (tva != null) 'tva': tva,
      if (nbrePiece != null) 'nbre_piece': nbrePiece,
      if (fournisser != null) 'fournisser': fournisser,
      if (prixOrTax != null) 'prix_or_tax': prixOrTax,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<String>? prix,
      Value<String>? libelle,
      Value<String>? categorie,
      Value<String?>? description,
      Value<String>? tva,
      Value<String>? nbrePiece,
      Value<String>? fournisser,
      Value<String>? prixOrTax,
      Value<DateTime>? createdAt}) {
    return ProductsCompanion(
      id: id ?? this.id,
      prix: prix ?? this.prix,
      libelle: libelle ?? this.libelle,
      categorie: categorie ?? this.categorie,
      description: description ?? this.description,
      tva: tva ?? this.tva,
      nbrePiece: nbrePiece ?? this.nbrePiece,
      fournisser: fournisser ?? this.fournisser,
      prixOrTax: prixOrTax ?? this.prixOrTax,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (prix.present) {
      map['prix'] = Variable<String>(prix.value);
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
      map['tva'] = Variable<String>(tva.value);
    }
    if (nbrePiece.present) {
      map['nbre_piece'] = Variable<String>(nbrePiece.value);
    }
    if (fournisser.present) {
      map['fournisser'] = Variable<String>(fournisser.value);
    }
    if (prixOrTax.present) {
      map['prix_or_tax'] = Variable<String>(prixOrTax.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('prix: $prix, ')
          ..write('libelle: $libelle, ')
          ..write('categorie: $categorie, ')
          ..write('description: $description, ')
          ..write('tva: $tva, ')
          ..write('nbrePiece: $nbrePiece, ')
          ..write('fournisser: $fournisser, ')
          ..write('prixOrTax: $prixOrTax, ')
          ..write('createdAt: $createdAt')
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, ville, rue, phone, tva, createdAt];
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
  const Fournisser(
      {required this.id,
      required this.name,
      required this.ville,
      required this.rue,
      required this.phone,
      required this.tva,
      required this.createdAt});
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
    };
  }

  Fournisser copyWith(
          {int? id,
          String? name,
          String? ville,
          String? rue,
          String? phone,
          String? tva,
          DateTime? createdAt}) =>
      Fournisser(
        id: id ?? this.id,
        name: name ?? this.name,
        ville: ville ?? this.ville,
        rue: rue ?? this.rue,
        phone: phone ?? this.phone,
        tva: tva ?? this.tva,
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
          ..write('tva: $tva, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, ville, rue, phone, tva, createdAt);
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
          other.createdAt == this.createdAt);
}

class FournissersCompanion extends UpdateCompanion<Fournisser> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> ville;
  final Value<String> rue;
  final Value<String> phone;
  final Value<String> tva;
  final Value<DateTime> createdAt;
  const FournissersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.ville = const Value.absent(),
    this.rue = const Value.absent(),
    this.phone = const Value.absent(),
    this.tva = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FournissersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String ville,
    required String rue,
    required String phone,
    required String tva,
    this.createdAt = const Value.absent(),
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
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (ville != null) 'ville': ville,
      if (rue != null) 'rue': rue,
      if (phone != null) 'phone': phone,
      if (tva != null) 'tva': tva,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FournissersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? ville,
      Value<String>? rue,
      Value<String>? phone,
      Value<String>? tva,
      Value<DateTime>? createdAt}) {
    return FournissersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      ville: ville ?? this.ville,
      rue: rue ?? this.rue,
      phone: phone ?? this.phone,
      tva: tva ?? this.tva,
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
    if (tva.present) {
      map['tva'] = Variable<String>(tva.value);
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
          ..write('tva: $tva, ')
          ..write('createdAt: $createdAt')
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
  static const VerificationMeta _clientNameMeta =
      const VerificationMeta('clientName');
  @override
  late final GeneratedColumn<String> clientName = GeneratedColumn<String>(
      'client_name', aliasedName, false,
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
  List<GeneratedColumn> get $columns => [id, clientName, createdAt];
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
    if (data.containsKey('client_name')) {
      context.handle(
          _clientNameMeta,
          clientName.isAcceptableOrUnknown(
              data['client_name']!, _clientNameMeta));
    } else if (isInserting) {
      context.missing(_clientNameMeta);
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
      clientName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}client_name'])!,
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
  final String clientName;
  final DateTime createdAt;
  const BonLivraison(
      {required this.id, required this.clientName, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_name'] = Variable<String>(clientName);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BonLivraisonsCompanion toCompanion(bool nullToAbsent) {
    return BonLivraisonsCompanion(
      id: Value(id),
      clientName: Value(clientName),
      createdAt: Value(createdAt),
    );
  }

  factory BonLivraison.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BonLivraison(
      id: serializer.fromJson<int>(json['id']),
      clientName: serializer.fromJson<String>(json['clientName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clientName': serializer.toJson<String>(clientName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BonLivraison copyWith({int? id, String? clientName, DateTime? createdAt}) =>
      BonLivraison(
        id: id ?? this.id,
        clientName: clientName ?? this.clientName,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('BonLivraison(')
          ..write('id: $id, ')
          ..write('clientName: $clientName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, clientName, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BonLivraison &&
          other.id == this.id &&
          other.clientName == this.clientName &&
          other.createdAt == this.createdAt);
}

class BonLivraisonsCompanion extends UpdateCompanion<BonLivraison> {
  final Value<int> id;
  final Value<String> clientName;
  final Value<DateTime> createdAt;
  const BonLivraisonsCompanion({
    this.id = const Value.absent(),
    this.clientName = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  BonLivraisonsCompanion.insert({
    this.id = const Value.absent(),
    required String clientName,
    this.createdAt = const Value.absent(),
  }) : clientName = Value(clientName);
  static Insertable<BonLivraison> custom({
    Expression<int>? id,
    Expression<String>? clientName,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientName != null) 'client_name': clientName,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  BonLivraisonsCompanion copyWith(
      {Value<int>? id, Value<String>? clientName, Value<DateTime>? createdAt}) {
    return BonLivraisonsCompanion(
      id: id ?? this.id,
      clientName: clientName ?? this.clientName,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (clientName.present) {
      map['client_name'] = Variable<String>(clientName.value);
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
          ..write('clientName: $clientName, ')
          ..write('createdAt: $createdAt')
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
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [clients, products, fournissers, bonLivraisons];
}
