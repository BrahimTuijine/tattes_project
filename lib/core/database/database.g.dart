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
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tvaMeta = const VerificationMeta('tva');
  @override
  late final GeneratedColumn<String> tva = GeneratedColumn<String>(
      'tva', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _refrenceMeta =
      const VerificationMeta('refrence');
  @override
  late final GeneratedColumn<String> refrence = GeneratedColumn<String>(
      'refrence', aliasedName, false,
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
        image,
        tva,
        refrence,
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
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('tva')) {
      context.handle(
          _tvaMeta, tva.isAcceptableOrUnknown(data['tva']!, _tvaMeta));
    } else if (isInserting) {
      context.missing(_tvaMeta);
    }
    if (data.containsKey('refrence')) {
      context.handle(_refrenceMeta,
          refrence.isAcceptableOrUnknown(data['refrence']!, _refrenceMeta));
    } else if (isInserting) {
      context.missing(_refrenceMeta);
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
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      tva: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tva'])!,
      refrence: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}refrence'])!,
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
  final String? image;
  final String tva;
  final String refrence;
  final DateTime createdAt;
  const Product(
      {required this.id,
      required this.prix,
      required this.libelle,
      required this.categorie,
      this.description,
      this.image,
      required this.tva,
      required this.refrence,
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
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    map['tva'] = Variable<String>(tva);
    map['refrence'] = Variable<String>(refrence);
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
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      tva: Value(tva),
      refrence: Value(refrence),
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
      image: serializer.fromJson<String?>(json['image']),
      tva: serializer.fromJson<String>(json['tva']),
      refrence: serializer.fromJson<String>(json['refrence']),
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
      'image': serializer.toJson<String?>(image),
      'tva': serializer.toJson<String>(tva),
      'refrence': serializer.toJson<String>(refrence),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Product copyWith(
          {int? id,
          String? prix,
          String? libelle,
          String? categorie,
          Value<String?> description = const Value.absent(),
          Value<String?> image = const Value.absent(),
          String? tva,
          String? refrence,
          DateTime? createdAt}) =>
      Product(
        id: id ?? this.id,
        prix: prix ?? this.prix,
        libelle: libelle ?? this.libelle,
        categorie: categorie ?? this.categorie,
        description: description.present ? description.value : this.description,
        image: image.present ? image.value : this.image,
        tva: tva ?? this.tva,
        refrence: refrence ?? this.refrence,
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
          ..write('image: $image, ')
          ..write('tva: $tva, ')
          ..write('refrence: $refrence, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, prix, libelle, categorie, description,
      image, tva, refrence, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.prix == this.prix &&
          other.libelle == this.libelle &&
          other.categorie == this.categorie &&
          other.description == this.description &&
          other.image == this.image &&
          other.tva == this.tva &&
          other.refrence == this.refrence &&
          other.createdAt == this.createdAt);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> prix;
  final Value<String> libelle;
  final Value<String> categorie;
  final Value<String?> description;
  final Value<String?> image;
  final Value<String> tva;
  final Value<String> refrence;
  final Value<DateTime> createdAt;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.prix = const Value.absent(),
    this.libelle = const Value.absent(),
    this.categorie = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.tva = const Value.absent(),
    this.refrence = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String prix,
    required String libelle,
    required String categorie,
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    required String tva,
    required String refrence,
    this.createdAt = const Value.absent(),
  })  : prix = Value(prix),
        libelle = Value(libelle),
        categorie = Value(categorie),
        tva = Value(tva),
        refrence = Value(refrence);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? prix,
    Expression<String>? libelle,
    Expression<String>? categorie,
    Expression<String>? description,
    Expression<String>? image,
    Expression<String>? tva,
    Expression<String>? refrence,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (prix != null) 'prix': prix,
      if (libelle != null) 'libelle': libelle,
      if (categorie != null) 'categorie': categorie,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (tva != null) 'tva': tva,
      if (refrence != null) 'refrence': refrence,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<String>? prix,
      Value<String>? libelle,
      Value<String>? categorie,
      Value<String?>? description,
      Value<String?>? image,
      Value<String>? tva,
      Value<String>? refrence,
      Value<DateTime>? createdAt}) {
    return ProductsCompanion(
      id: id ?? this.id,
      prix: prix ?? this.prix,
      libelle: libelle ?? this.libelle,
      categorie: categorie ?? this.categorie,
      description: description ?? this.description,
      image: image ?? this.image,
      tva: tva ?? this.tva,
      refrence: refrence ?? this.refrence,
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
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (tva.present) {
      map['tva'] = Variable<String>(tva.value);
    }
    if (refrence.present) {
      map['refrence'] = Variable<String>(refrence.value);
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
          ..write('image: $image, ')
          ..write('tva: $tva, ')
          ..write('refrence: $refrence, ')
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
  late final $ProductsTable products = $ProductsTable(this);
  late final $FournissersTable fournissers = $FournissersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [clients, products, fournissers];
}
