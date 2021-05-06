unit SimplePed.Model;

interface

uses
  SimplePed.Model.Interfaces,
  SimplePed.Model.Produto.Interfaces,
  SimplePed.Model.Pedido.Interfaces;

Type
  TSimplePedModel = class(TInterfacedObject, iModel)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModel;
      function Produto : iModelProduto;
      function Pedido : iModelPedido;
      function PedidoItens : iModelPedidoItens;
  end;

implementation

uses
  SimplePed.Model.Produto,
  SimplePed.Model.Pedido,
  SimplePed.Model.PedidoItens;

{ TModel }

constructor TSimplePedModel.Create;
begin

end;

destructor TSimplePedModel.Destroy;
begin

  inherited;
end;

class function TSimplePedModel.New: iModel;
begin
  Result := Self.Create;
end;

function TSimplePedModel.Pedido: iModelPedido;
begin
  Result := TModelPedido.New;
end;

function TSimplePedModel.PedidoItens: iModelPedidoItens;
begin
  Result := TModelPedidoItens.New;
end;

function TSimplePedModel.Produto: iModelProduto;
begin
  Result := TModelProduto.New;
end;

end.
