class UserModel {
  final String? id;
  final String? nom;
  final String? email;
  final String? motdepasse;
  final int? phone;
  final String? code;
  final String? role;
  final String? image;
  final List<dynamic>? reservation;
  final List<dynamic>? avis;
  final int? v;
  final String? refreshToken;
  final Tokens? tokens;

  UserModel({
    this.id,
    this.nom,
    this.email,
    this.motdepasse,
    this.phone,
    this.code,
    this.role,
    this.image,
    this.reservation,
    this.avis,
    this.v,
    this.refreshToken,
    this.tokens,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final utilisateur = json['utilisateur'];
    return UserModel(
      id: utilisateur['_id'],
      nom: utilisateur['nom'],
      email: utilisateur['email'],
      motdepasse: utilisateur['motdepasse'],
      phone: utilisateur['phone'],
      code: utilisateur['code'],
      role: utilisateur['role'],
      image: utilisateur['image'],
      reservation: utilisateur['reservation'] ?? [],
      avis: utilisateur['avis'] ?? [],
      v: utilisateur['__v'],
      refreshToken: utilisateur['refreshToken'],
      tokens: json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'nom': nom,
      'email': email,
      'motdepasse': motdepasse,
      'phone': phone,
      'code': code,
      'role': role,
      'image': image,
      'reservation': reservation,
      'avis': avis,
      '__v': v,
      'refreshToken': refreshToken,
      'tokens': tokens?.toJson(),
    };
  }
}

class Tokens {
  final String? accesstoken;
  final String? refreshToken;

  Tokens({this.accesstoken, this.refreshToken});

  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(
      accesstoken: json['accesstoken'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accesstoken': accesstoken,
      'refreshToken': refreshToken,
    };
  }
}
