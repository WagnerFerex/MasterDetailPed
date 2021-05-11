unit SimplePed.Controller;

interface

uses
  Vcl.Forms,
  SimplePed.Model.Entidade.PRODUTO,
  SimplePed.Controller.Interfaces,
  SimplePed.Controller.Pedido.Interfaces,
  SimplePed.Controller.Exceptions;

Type
  TSimplePedController = class(TInterfacedObject, iController)
  private
    FForm : TForm;
    FException : iControllerExceptions;
    FProduto: iControllerGeneric<TPRODUTO>;
    FPedido: iControllerPedido;
    FPedidoItens: iControllerPedidoItens;
  public
    constructor Create(Form : TForm);
    destructor Destroy; override;
    class function New(Form : TForm): iController;
    function Produto: iControllerGeneric<TPRODUTO>;
    function Pedido: iControllerPedido;
    function PedidoItens: iControllerPedidoItens;
  end;

implementation

uses
  SimplePed.Controller.Pedido,
  SimplePed.Controller.PedidoItens,
  SimplePed.Controller.Generic;

{ TController }

constructor TSimplePedController.Create(Form : TForm);
begin
  FForm := Form;
  FException := TControllerExceptions.New(FForm);
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

function TSimplePedController.Produto: iControllerGeneric<TPRODUTO>;
begin
  if not Assigned(FProduto) then
    FProduto := TControllerGeneric<TPRODUTO>.New;

  Result := FProduto;
end;

end.
