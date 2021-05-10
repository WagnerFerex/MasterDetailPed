unit SimplePed.Controller.Pedido;

interface

uses
  Data.DB,
  System.Generics.Collections,
  SimplePed.Controller.Pedido.Interfaces,
  SimplePed.Model.Entidade.Pedido,
  SimplePed.Model.DAO.Interfaces;

Type
  TControllerPedido = class(TInterfacedObject, iControllerPedido)
  private
    FDAO: iModelDAO<TPEDIDO>;
    FDataSource : TDataSource;
    FPedidoItens : iControllerPedidoItens;
    procedure DataChance (Sender : TObject; Field : TField);
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerPedido;
    function DataSource(AValue: TDataSource): iControllerPedido;
    function DAO: iModelDAO<TPEDIDO>;
    function ITENS: iControllerPedidoItens;
  end;

implementation

uses
  SimplePed.Model,
  SimplePed.Controller.PedidoItens;

{ TControllerPedido }

constructor TControllerPedido.Create;
begin
  FDAO := TSimplePedModel.New.DAO.PEDIDO;
  FPedidoItens := TControllerPedidoItens.New;
end;

function TControllerPedido.DAO: iModelDAO<TPEDIDO>;
begin
  Result := FDAO;
end;

procedure TControllerPedido.DataChance(Sender: TObject; Field: TField);
begin
  FPedidoItens.Buscar(FDataSource.DataSet.FieldByName('ID_PEDIDO').AsInteger);
end;

function TControllerPedido.DataSource(AValue: TDataSource): iControllerPedido;
begin
  Result := Self;
  FDataSource := AValue;
  FDataSource.DataSet := FDAO.DataSet;
  FDataSource.OnDataChange := DataChance;
end;

destructor TControllerPedido.Destroy;
begin

  inherited;
end;

function TControllerPedido.Itens: iControllerPedidoItens;
begin
  Result := FPedidoItens;
end;

class function TControllerPedido.New: iControllerPedido;
begin
  Result := Self.Create;
end;

end.
