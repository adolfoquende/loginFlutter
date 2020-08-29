class Contato {
  int id;
  String nome;
  String email;
  String image;

  Contato(this.id, this.nome, this.email, this.image);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'email': email,
      'image': image
    };
    return map;
  }

  Contato.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    email = map['email'];
    image = map['image'];
  }
}
