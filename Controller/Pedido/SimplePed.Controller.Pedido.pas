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
    procedure DoDataChange(Sender: TObject; Field: TField);
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

procedure TControllerPedido.DoDataChange(Sender: TObject; Field: TField);
begin
  FPedidoItens
    .DAO
      .SQL
        .Fields('PEDIDOITENS.ID_PEDIDOITENS AS ID,')
        .Fields('PRODUTO.DESCRICAO AS PRODUTO,')
        .Fields('PEDIDOITENS.QUANTIDADE AS QNT,')
        .Fields('PEDIDOITENS.VALORUNITARIO AS UNITARIO,')
        .Fields('PEDIDOITENS.VALORTOTAL AS TOTAL')
        .Join('INNER JOIN PRODUTO ON PRODUTO.ID_PRODUTO = PEDIDOITENS.ID_PRODUTO')
        .Where('ID_PEDIDO = ' + FDAO.DataSet.FieldByName('ID_PEDIDO').AsString)
      .&End
      .Find;

  FPedidoItens.DAO.DataSet.FieldByName('ID').Visible := false;
  FPedidoItens.DAO.DataSet.FieldByName('PRODUTO').DisplayWidth := 50;
end;

function TControllerPedido.DataSource(AValue: TDataSource): iControllerPedido;
begin
  Result := Self;
  FDataSource := AValue;
  FDataSource.DataSet := FDAO.DataSet;
  FDataSource.OnDataChange := DoDataChange;
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
