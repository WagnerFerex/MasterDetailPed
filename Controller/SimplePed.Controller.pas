unit SimplePed.Controller;

interface

uses
  SimplePed.Controller.Interfaces, SimplePed.Controller.Produto.Interfaces,
  SimplePed.Controller.Pedido.Interfaces, SimplePed.Controller.Exceptions,
  Vcl.Forms,
  SimplePed.Model.DAO.Interfaces,
  SimplePed.Model.Entidade.Produto;

Type
  TSimplePedController = class(TInterfacedObject, iController)
  private
    FForm : TForm;
    FException : iControllerExceptions;
    FProduto: iControllerProduto;
    FPedido: iControllerPedido;
    FPedidoItens: iControllerPedidoItens;

    FProdutos: iModelDAO<TPRODUTO>;
  public
    constructor Create(Form : TForm);
    destructor Destroy; override;
    class function New(Form : TForm): iController;
    function Produto: iControllerProduto;
    function Pedido: iControllerPedido;
    function PedidoItens: iControllerPedidoItens;
    function DAOProduto : iModelDAO<TPRODUTO>;
  end;

implementation

uses
  SimplePed.Controller.Produto,
  SimplePed.Controller.Pedido,
  SimplePed.Controller.PedidoItens,
  SimplePed.Model.DAO.SQL;

{ TController }

constructor TSimplePedController.Create(Form : TForm);
begin
  FForm := Form;
  FException := TControllerExceptions.New(FForm);
end;

function TSimplePedController.DAOProduto: iModelDAO<TPRODUTO>;
begin
  if not Assigned(FProdutos) then
    FProdutos := TModelDAO<TPRODUTO>.New;

  Result := FProdutos;
end;

destructor TSimplePedController.Destroy;
begin

  inherited;
end;

class function TSimplePedController.New(Form : TForm): iController;
begin
  Result := Self.Create(Form);
end;

function TSimplePedController.Pedido: iControllerPedido;
begin
  if not Assigned(FPedido) then
    FPedido := TControllerPedido.New;

  Result := FPedido;
end;

function TSimplePedController.PedidoItens: iControllerPedidoItens;
begin
  if not Assigned(FPedidoItens) then
    FPedidoItens := TControllerPedidoItens.New;

  Result := FPedidoItens;
end;

function TSimplePedController.Produto: iControllerProduto;
begin
  if not Assigned(FProduto) then
    FProduto := TControllerProduto.New;

  Result := FProduto;
end;

end.
