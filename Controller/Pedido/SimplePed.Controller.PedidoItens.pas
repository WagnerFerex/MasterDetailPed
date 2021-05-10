unit SimplePed.Controller.PedidoItens;

interface

uses
  Data.DB,
  System.Generics.Collections,
  SimplePed.Controller.Pedido.Interfaces,
  SimplePed.Model.Entidade.PedidoItens,
  SimplePed.Model.DAO.Interfaces, SimplePed.Model.DAO.SQL;

Type
  TControllerPedidoItens = class(TInterfacedObject, iControllerPedidoItens)
  private
    FDAO: iModelDAO<TPEDIDOITENS>;
    FThis: TPEDIDOITENS;
    FDataSource: TDataSource;
    FList: TObjectList<TPEDIDOITENS>;
  public
    constructor Create;
//    constructor Create(AMaster: iControllerPedido); overload;
    destructor Destroy; override;
    class function New: iControllerPedidoItens;
    function DataSource(aDataSource: TDataSource): iControllerPedidoItens;
    function Buscar: iControllerPedidoItens; overload;
    function Buscar(aId: Integer): iControllerPedidoItens; overload;
    function Insert: iControllerPedidoItens;
    function Delete: iControllerPedidoItens;
    function Update: iControllerPedidoItens;
    function DataSet : TDataSet;
    function _This: TPEDIDOITENS;
  end;

implementation

uses
  System.SysUtils,
  SimplePed.Model;

{ TControllerPedidoItens }

function TControllerPedidoItens.Buscar: iControllerPedidoItens;
begin
  Result := Self;

  if Assigned(FList) then
    FList.Free;
  FDataSource.DataSet.DisableControls;
  FList := FDAO.Find;
  FDataSource.DataSet.EnableControls;
end;

function TControllerPedidoItens.Buscar(aId: Integer): iControllerPedidoItens;
begin
  Result := Self;

  if Assigned(FList) then
    FList.Free;

  FDataSource.DataSet.DisableControls;
  FDAO
    .SQL
      .Fields('PEDIDOITENS.ID_PEDIDOITENS AS ID,')
      .Fields('PRODUTO.DESCRICAO AS PRODUTO,')
      .Fields('PEDIDOITENS.QUANTIDADE AS QNT,')
      .Fields('PEDIDOITENS.VALORUNITARIO AS UNITARIO,')
      .Fields('PEDIDOITENS.VALORTOTAL AS TOTAL')
      .Join('INNER JOIN PRODUTO ON PRODUTO.ID_PRODUTO = PEDIDOITENS.ID_PRODUTO')
      .Where('ID_PEDIDO = ' + IntToStr(aID));

  FList := FDAO.Find;
  FDataSource.DataSet.EnableControls;
  FDataSource.DataSet.FieldByName('ID').Visible := false;
  FDataSource.DataSet.FieldByName('PRODUTO').DisplayWidth := 50;
end;

constructor TControllerPedidoItens.Create;
begin
  FDAO := TModelDAO<TPEDIDOITENS>.New;
end;

function TControllerPedidoItens.DataSet: TDataSet;
begin
  Result := FDAO.DataSet;
end;

function TControllerPedidoItens.DataSource(aDataSource: TDataSource): iControllerPedidoItens;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FDAO.DataSet;
end;

function TControllerPedidoItens.Delete: iControllerPedidoItens;
begin
  Result := Self;
  FDAO.Delete(FDAO._This);
end;

destructor TControllerPedidoItens.Destroy;
begin

  if Assigned(FList) then
    FList.Free;

  inherited;
end;

function TControllerPedidoItens._This: TPEDIDOITENS;
begin
  Result := FDAO._This;
end;

function TControllerPedidoItens.Insert: iControllerPedidoItens;
begin
  Result := Self;
  FDAO.Insert(FDAO._This);
end;

class function TControllerPedidoItens.New: iControllerPedidoItens;
begin
  Result := Self.Create;
end;

function TControllerPedidoItens.Update: iControllerPedidoItens;
begin
  Result := Self;
  FDAO.Update(FDAO._This);
end;

end.
