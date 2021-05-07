unit SimplePed.Controller.Pedido;

interface

uses
  Data.DB,
  System.Generics.Collections,
  SimplePed.Controller.Pedido.Interfaces,
  SimplePed.Model.Entidade.Pedido,
  SimplePed.Model.Pedido.Interfaces,
  SimplePed.Model.DAO.Interfaces;

Type
  TControllerPedido = class(TInterfacedObject, iControllerPedido)
  private
    FDAO: iModelDAO<TPEDIDO>;
    FDataSource : TDataSource;
    FList : TObjectList<TPEDIDO>;
    FPedidoItens : iControllerPedidoItens;
    procedure DataChance (Sender : TObject; Field : TField);
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerPedido;
    function DataSource(aDataSource: TDataSource): iControllerPedido;
    function Buscar: iControllerPedido;
    function Insert: iControllerPedido;
    function Delete: iControllerPedido;
    function Update: iControllerPedido;
    function _This: TPEDIDO;
    function Itens : iControllerPedidoItens;
  end;

implementation

uses
  SimplePed.Model,
  SimplePed.Model.DAO.SQL,
  SimplePed.Controller.PedidoItens;

{ TControllerPedido }

function TControllerPedido.Buscar: iControllerPedido;
begin
  Result := Self;

  if Assigned(FList) then
    FList.Free;

  FDataSource.DataSet.DisableControls;
  FList := FDAO.Find;
  FDataSource.DataSet.EnableControls;
end;

constructor TControllerPedido.Create;
begin
  FDAO := TModelDAO<TPEDIDO>.New;
  FPedidoItens := TControllerPedidoItens.New;
end;

procedure TControllerPedido.DataChance(Sender: TObject; Field: TField);
begin
  FPedidoItens.Buscar(FDataSource.DataSet.FieldByName('ID_PEDIDO').AsInteger);
end;

function TControllerPedido.DataSource(
  aDataSource: TDataSource): iControllerPedido;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
  FDataSource.OnDataChange := DataChance;
end;

function TControllerPedido.Delete: iControllerPedido;
begin
  Result := Self;
  FDAO.Delete(FDAO._This);
end;

destructor TControllerPedido.Destroy;
begin
  if Assigned(FList) then
    FList.Free;
  inherited;
end;

function TControllerPedido._This: TPEDIDO;
begin
  Result := FDAO._This;
end;

function TControllerPedido.Insert: iControllerPedido;
begin
  Result := Self;
  FDAO.Insert(FDAO._This);
end;

function TControllerPedido.Itens: iControllerPedidoItens;
begin
  Result := FPedidoItens;
end;

class function TControllerPedido.New: iControllerPedido;
begin
  Result := Self.Create;
end;

function TControllerPedido.Update: iControllerPedido;
begin
  Result := Self;
  FDAO.Update(FDAO._This);
end;

end.
