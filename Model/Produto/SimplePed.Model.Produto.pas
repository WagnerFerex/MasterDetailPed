unit SimplePed.Model.Produto;

interface

uses
  Data.DB,
  SimplePed.Model.Produto.Interfaces,
  SimplePed.Model.Entidade.Produto,
  SimplePed.Model.DAO.Interfaces,
  SimplePed.Model.DAO.SQL;

Type
  TModelProduto = class(TInterfacedObject, iModelProduto)
  private
    FEntidade : TPRODUTO;
    FDAO : iModelDAO<TPRODUTO>;
    FDataSource : TDataSource;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelProduto;
    function Entidade: TPRODUTO;
    function DAO: iModelDAO<TPRODUTO>;
    function DataSource(aDataSource: TDataSource): iModelProduto;
  end;

implementation

{ TModelProduto }

uses System.SysUtils;

constructor TModelProduto.Create;
begin
  FEntidade := TPRODUTO.Create;
  FDAO := TModelDAO<TPRODUTO>.New;
end;

function TModelProduto.DAO: iModelDAO<TPRODUTO>;
begin
  Result := FDAO;
end;

function TModelProduto.DataSource(aDataSource: TDataSource): iModelProduto;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelProduto.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited;
end;

function TModelProduto.Entidade: TPRODUTO;
begin
  Result := FEntidade;
end;

class function TModelProduto.New: iModelProduto;
begin
  Result := Self.Create;
end;

end.
