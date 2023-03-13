void main() {
  print("Programação em Dart");

  Produto produto01 = Produto(5, "Sabonete", "10/03/2023");
  Produto produto02 = Produto(10, "Café", "10/03/2023");
  Produto produto03 = Produto(10, "Cerveja", "10/03/2023");

  Item item01 = Item(10, produto01);
  Item item02 = Item(10, produto02);
  Item item03 = Item(10, produto03);

  var venda = Venda("09/03/2023", [item01, item02, item03]);
  print(venda.total());
}

class Venda {
  String data;
  List<Item> itens;
  Venda(String this.data, List<Item> this.itens);
  double total() {
    var resultado = itens.reduce((value, element) {
      value.produto.preco = (element.total() + value.total()) /
          (value.quantidade + element.quantidade);
      value.quantidade += element.quantidade;
      return value;
    });
    return resultado.total();
  }
}

class Item {
  double quantidade;
  Produto produto;
  Item(double this.quantidade, Produto this.produto);
  double total() => quantidade * produto.preco;
}

class Produto {
  double preco;
  String descricao;
  String validade;

  Produto(double this.preco, String this.descricao, String this.validade);
}
