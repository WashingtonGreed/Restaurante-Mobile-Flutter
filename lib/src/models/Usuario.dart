class Usuario {
  int id;
  String nome;
  String foto;
  String dataNascimento;
  String email;
  String senha;
  String telefone;
  bool sexo;
  int pais;
  String geolocalizacao;
  String dataCriacao;
  String token;
  Map<int, String> galeria;

  Usuario(
      {this.id,
      this.nome,
      this.foto,
      this.dataNascimento,
      this.email,
      this.senha,
      this.telefone,
      this.sexo,
      this.pais,
      this.geolocalizacao,
      this.dataCriacao,
      this.token,
      this.galeria});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'] as int,
      nome: json['nome'] as String,
      foto: json['foto'] as String,
      dataNascimento: json['dataNascimento'] as String,
      email: json['email'] as String,
      senha: json['senha'] as String,
      telefone: json['telefone'] as String,
      sexo: json['sexo'] as bool,
      pais: json['pais'] as int,
      geolocalizacao: json['geolocalizacao'] as String,
      dataCriacao: json['dataCriacao'] as String,
      token: json['token'] as String,
      galeria: json['url'] as Map<int, String>,
    );
  }
}
