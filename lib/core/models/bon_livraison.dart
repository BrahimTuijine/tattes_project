// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:products_management/core/database/database.dart';

class BonLivraisonWithProduct {
  final BonLivraison bonLivraison;
  final BonLivraisonsProdData product;

  BonLivraisonWithProduct({
    required this.product,
    required this.bonLivraison,
  });
}

class BonLivraisonWithClient {
  final DateTime createdAt;
  final String clientName;
  final int bonLivraisonId;
  BonLivraisonWithClient({
    required this.createdAt,
    required this.clientName,
    required this.bonLivraisonId,
  });
}
