unit SimplePed.Controller.Interfaces;

interface

uses
  SimplePed.Controller.Produto.Interfaces,
  SimplePed.Controller.Pedido.Interfaces,
  SimplePed.Model.DAO.Interfaces,
  SimplePed.Model.Entidade.Produto;

type
  iController = interface
    ['{CB9E0130-BE09-4B55-BEC5-6970E07D9DEB}']
    function Produto : iControllerProduto;
    function Pedido : iControllerPedido;
    function PedidoItens : iControllerPedidoItens;
  end;

implementation

end.
