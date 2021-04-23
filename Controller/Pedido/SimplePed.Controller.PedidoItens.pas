unit SimplePed.Controller.PedidoItens;

interface

uses
  Data.DB,
  System.Generics.Collections,
  SimplePed.Controller.Pedido.Interfaces,
  SimplePed.Model.Pedido.Interfaces,
  SimplePed.Model.Entidade.PedidoItens;

Type
  TControllerPedidoItens = class(TInterfacedObject, iControllerPedidoItens)
  private
    FModel: iModelPedidoItens;
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
    function Entidade: TPEDIDOITENS;
  end;

implementation

uses
  System.SysUtils,
  SimplesPed.Model;

{ TControllerPedidoItens }

function TControllerPedidoItens.Buscar: iControllerPedidoItens;
begin
  Result := Self;

  if Assigned(FList) then
    FList.Free;
  FDataSource.DataSet.DisableControls;
  FList := FModel.DAO.Find;
  FDataSource.DataSet.EnableControls;
end;

function TControllerPedidoItens.Buscar(aId: Integer): iControllerPedidoItens;
begin
  Result := Self;

  if Assigned(FList) then
    FList.Free;

  FDataSource.DataSet.DisableControls;
  FModel.DAO
            .SQL
              .Fields('PEDIDOITENS.ID_PEDIDOITENS AS ID,')
              .Fields('PRODUTO.DESCRICAO AS PRODUTO,')
              .Fields('PEDIDOITENS.QUANTIDADE AS QNT,')
              .Fields('PEDIDOITENS.VALORUNITARIO AS UNITARIO,')
              .Fields('PEDIDOITENS.VALORTOTAL AS TOTAL')
              .Join('INNER JOIN PRODUTO ON PRODUTO.ID_PRODUTO = PEDIDOITENS.ID_PRODUTO')
              .Where('ID_PEDIDO = ' + IntToStr(aID));

  FList := FModel.DAO.Find;
  FDataSource.DataSet.EnableControls;
  FDataSource.DataSet.FieldByName('ID').Visible := false;
  FDataSource.DataSet.FieldByName('PRODUTO').DisplayWidth := 50;
end;

constructor TControllerPedidoItens.Create;
begin
  FModel := TModel.New.PedidoItens;
end;

function TControllerPedidoItens.DataSource(aDataSource: TDataSource)
  : iControllerPedidoItens;
begin
  Result := Self;
  FDataSource := aDataSource;
  FModel.DataSource(FDataSource);
end;

function TControllerPedidoItens.Delete: iControllerPedidoItens;
begin
  Result := Self;
  FModel.DAO.Delete(FModel._This);
end;

destructor TControllerPedidoItens.Destroy;
begin

  if Assigned(FList) then
    FList.Free;

  inherited;
end;

function TControllerPedidoItens.Entidade: TPEDIDOITENS;
begin
  Result := FModel._This;
end;

function TControllerPedidoItens.Insert: iControllerPedidoItens;
begin
  Result := Self;
  FModel.DAO.Insert(FModel._This);
end;

class function TControllerPedidoItens.New: iControllerPedidoItens;
begin
  Result := Self.Create;
end;

function TControllerPedidoItens.Update: iControllerPedidoItens;
begin
  Result := Self;
  FModel.DAO.Update(FModel._This);
end;

end.
