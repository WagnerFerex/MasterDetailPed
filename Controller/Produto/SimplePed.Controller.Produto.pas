unit SimplePed.Controller.Produto;

interface

uses
  System.Generics.Collections,
  Data.DB,
  SimplePed.Model.DAO.Interfaces,
  SimplePed.Model.DAO.SQL,
  SimplePed.Model.Entidade.Produto,
  SimplePed.Controller.Produto.Interfaces;

Type
  TControllerProduto = class(TInterfacedObject, iControllerProduto)
  private
    FDAO: iModelDAO<TPRODUTO>;
    FList : TObjectList<TPRODUTO>;
    FEntidade : TPRODUTO;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerProduto;
    function DataSource(aDataSource: TDataSource): iControllerProduto;
    function Buscar : iControllerProduto; overload;
    function Buscar (aId : Integer) : iControllerProduto; overload;
    function Buscar (aDescricao : String) : iControllerProduto; overload;
    function Insert: iControllerProduto;
    function Delete: iControllerProduto;
    function Update: iControllerProduto;
    function _This: TPRODUTO;
  end;

implementation

uses
  SimplePed.Model, System.SysUtils;

{ TControllerProduto }

function TControllerProduto.Buscar: iControllerProduto;
begin
  Result := Self;

  if Assigned(FList) then
    FList.Free;

  FList := FDAO.Find;
end;

function TControllerProduto.Buscar(aId: Integer): iControllerProduto;
begin
  Result := Self;

  if Assigned(FEntidade) then
    FEntidade.Free;

  FEntidade := FDAO.Find(aId);
end;

function TControllerProduto.Buscar(aDescricao: String): iControllerProduto;
begin
  Result := Self;

  if Assigned(FList) then
    FList.Free;

  FList := FDAO.Find('DESCRICAO = ' + QuotedStr(aDescricao));
end;

constructor TControllerProduto.Create;
begin
  FDAO := TModelDAO<TPRODUTO>.New;
end;

function TControllerProduto.DataSource(aDataSource: TDataSource): iControllerProduto;
begin
  Result := Self;
  FDAO.DataSource(aDataSource);
end;

function TControllerProduto.Delete: iControllerProduto;
begin
  Result := Self;
  FDAO.Delete;
end;

destructor TControllerProduto.Destroy;
begin
  if Assigned(FList) then
    FList.Free;

  if Assigned(FEntidade) then
    FEntidade.Free;

  inherited;
end;

function TControllerProduto._This: TPRODUTO;
begin
  Result := FDAO._This;
end;

function TControllerProduto.Insert: iControllerProduto;
begin
  Result := Self;
  FDAO.Insert(FDAO._This);
end;

class function TControllerProduto.New: iControllerProduto;
begin
  Result := Self.Create;
end;

function TControllerProduto.Update: iControllerProduto;
begin
  Result := Self;
  FDAO.Update(FDAO._This);
end;

end.
