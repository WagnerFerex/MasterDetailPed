unit SimplePed.Controller.Interfaces;

interface

uses
  Data.DB,
  SimplePed.Controller.Pedido.Interfaces,
  SimplePed.Model.DAO.Interfaces,
  SimplePed.Model.Entidade.Produto,
  SimplePed.Model.Entidade.Pedido;

type
  iControllerGeneric<T: class, constructor> = interface;

  iController = interface
    ['{CB9E0130-BE09-4B55-BEC5-6970E07D9DEB}']
    function Produto : iControllerGeneric<TPRODUTO>;
    function Pedido : iControllerPedido;
    function PedidoItens : iControllerPedidoItens;
  end;

  iControllerGeneric<T: class, constructor> = interface
    ['{135DAAFC-C57A-42FC-9A2F-630E166E72C2}']
    function DAO: IModelDAO<T>;
    function DataSource(AValue: TDataSource): iControllerGeneric<T>;
  end;

implementation

end.
