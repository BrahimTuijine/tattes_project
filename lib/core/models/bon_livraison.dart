// ignore_for_file: public_member_api_docs, sort_constructors_first
class BonLivraisonWithProduct {
  final int bonLivraisonId;
  final String factureId;
  final int clientId;
  final DateTime createdAt;
  final int? productId;
  final String? nbrCol;
  final String? prix;
  final String? remise;
  final String clientName;
  final String clientRue;

  BonLivraisonWithProduct({
    required this.bonLivraisonId,
    required this.factureId,
    required this.clientId,
    required this.createdAt,
    required this.productId,
    required this.nbrCol,
    required this.prix,
    required this.remise,
    required this.clientName,
    required this.clientRue,
  });
}
