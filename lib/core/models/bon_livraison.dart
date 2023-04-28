// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:products_management/core/database/database.dart';

class FactureWithProduct {
  final BonLivraison bonLivraison;
  final BonLivraisonsProdData product;

  FactureWithProduct({
    required this.product,
    required this.bonLivraison,
  });
}

class FactureWithClient {
  final DateTime createdAt;
  final Client client;
  final int factureId;

  FactureWithClient({
    required this.createdAt,
    required this.client,
    required this.factureId,
  });
}

class BonLivraisonFactureData {
  final String productName;
  BonLivraisonFactureData({
    required this.productName,
  });
}
