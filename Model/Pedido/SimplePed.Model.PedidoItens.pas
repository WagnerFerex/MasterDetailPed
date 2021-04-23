unit SimplePed.Model.PedidoItens;

interface

uses
  Data.DB,
  SimplePed.Model.Pedido.Interfaces,
  SimplePed.Model.Entidade.Pedido,
  SimplePed.Model.DAO.Interfaces,
  SimplePed.Model.Entidade.PedidoItens;

Type
  TModelPedidoItens = class(TInterfacedObject, iModelPedidoItens)
  private
    FThis : TPEDIDOITENS;
    FDAO : iModelDAO<TPEDIDOITENS>;
    FDataSource : TDataSource;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelPedidoItens;
    function _This: TPEDIDOITENS; overload;
    function Entidade (aEntidade : TPEDIDOITENS) : iModelPedidoItens; overload;
    function DAO: iModelDAO<TPEDIDOITENS>;
    function DataSource(aDataSource: TDataSource): iModelPedidoItens;
  end;

implementation

{ TModelPedidoItens }

uses
  System.SysUtils, SimplePed.Model.DAO.SQL;


constructor TModelPedidoItens.Create;
begin
  FThis := TPEDIDOITENS.Create;
  FDAO := TModelDAO<TPEDIDOITENS>.New;
end;

function TModelPedidoItens.DAO: iModelDAO<TPEDIDOITENS>;
begin
  Result := FDAO;
end;

function TModelPedidoItens.DataSource(aDataSource: TDataSource): iModelPedidoItens;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelPedidoItens.Destroy;
begin
  FreeAndNil(FThis);
  inherited;
end;

function TModelPedidoItens.Entidade(aEntidade: TPEDIDOITENS): iModelPedidoItens;
begin
  Result := Self;
  FThis := aEntidade;
end;

function TModelPedidoItens._This: TPEDIDOITENS;
begin
  Result := FThis;
end;

class function TModelPedidoItens.New: iModelPedidoItens;
begin
  Result := Self.Create;
end;

end.
