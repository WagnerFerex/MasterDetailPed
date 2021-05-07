unit SimplePed.Model.Pedido;

interface

uses
  Data.DB,
  SimplePed.Model.DAO.Interfaces,
  SimplePed.Model.DAO.SQL,
  SimplePed.Model.Pedido.Interfaces,
  SimplePed.Model.Entidade.Pedido;

Type
  TModelPedido = class(TInterfacedObject, iModelPedido)
  private
    FEntidade : TPEDIDO;
    FDAO : iModelDAO<TPEDIDO>;
    FDataSource : TDataSource;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelPedido;
    function Entidade: TPEDIDO; overload;
    function Entidade (aEntidade : TPEDIDO) : iModelPedido; overload;
    function DAO: iModelDAO<TPEDIDO>;
    function DataSource(aDataSource: TDataSource): iModelPedido;
  end;

implementation

{ TModelPedido }

uses
  System.SysUtils;

constructor TModelPedido.Create;
begin
  FEntidade := TPEDIDO.Create;
  FDAO := TModelDAO<TPEDIDO>.New;
end;

function TModelPedido.DAO: iModelDAO<TPEDIDO>;
begin
  Result := FDAO;
end;

function TModelPedido.DataSource(aDataSource: TDataSource): iModelPedido;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelPedido.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited;
end;

function TModelPedido.Entidade(aEntidade: TPEDIDO): iModelPedido;
begin
  Result := Self;
  FEntidade := aEntidade;
end;

function TModelPedido.Entidade: TPEDIDO;
begin
  Result := FEntidade;
end;

class function TModelPedido.New: iModelPedido;
begin
  Result := Self.Create;
end;

end.
