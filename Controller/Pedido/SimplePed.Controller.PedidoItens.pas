unit SimplePed.Controller.PedidoItens;

interface

uses
  Data.DB,
  System.Generics.Collections,
  SimplePed.Controller.Pedido.Interfaces,
  SimplePed.Model.Entidade.PedidoItens,
  SimplePed.Model.DAO.Interfaces;

Type
  TControllerPedidoItens = class(TInterfacedObject, iControllerPedidoItens)
  private
    FDAO: iModelDAO<TPEDIDOITENS>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerPedidoItens;
    function DataSource(AValue: TDataSource): iControllerPedidoItens;
    function DAO: iModelDAO<TPEDIDOITENS>;
  end;

implementation

uses
  System.SysUtils,
  SimplePed.Model;

{ TControllerPedidoItens }

constructor TControllerPedidoItens.Create;
begin
  FDAO := TSimplePedModel.New.DAO.PEDIDOITENS;
end;

function TControllerPedidoItens.DAO: iModelDAO<TPEDIDOITENS>;
begin
  Result := FDAO;
end;

function TControllerPedidoItens.DataSource(AValue: TDataSource): iControllerPedidoItens;
begin
  Result := Self;
  AValue.DataSet := FDAO.DataSet;
end;

destructor TControllerPedidoItens.Destroy;
begin

  inherited;
end;

class function TControllerPedidoItens.New: iControllerPedidoItens;
begin
  Result := Self.Create;
end;

end.
