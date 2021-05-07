unit SimplePed.Model;

interface

uses
  SimplePed.Model.Interfaces,
  SimplePed.Model.Pedido.Interfaces;

Type
  TSimplePedModel = class(TInterfacedObject, iModel)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModel;
      function Pedido : iModelPedido;
  end;

implementation

uses
  SimplePed.Model.Pedido;

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


end.
