program SimplePed;

uses
  Vcl.Forms,
  SimplePed.View.Principal in 'View\SimplePed.View.Principal.pas' {Form6},
  SimplePed.Model.Entidade.PRODUTO in 'Model\Entidades\SimplePed.Model.Entidade.PRODUTO.pas',
  SimplePed.Model.Entidade.PEDIDO in 'Model\Entidades\SimplePed.Model.Entidade.PEDIDO.pas',
  SimplePed.Model.Entidade.PEDIDOITENS in 'Model\Entidades\SimplePed.Model.Entidade.PEDIDOITENS.pas',
  SimplePed.Model in 'Model\SimplePed.Model.pas',
  SimplePed.Model.Interfaces in 'Model\SimplePed.Model.Interfaces.pas',
  SimplePed.Controller.Produto in 'Controller\Produto\SimplePed.Controller.Produto.pas',
  SimplePed.Controller.Produto.Interfaces in 'Controller\Produto\SimplePed.Controller.Produto.Interfaces.pas',
  SimplePed.Controller in 'Controller\SimplePed.Controller.pas',
  SimplePed.Controller.Interfaces in 'Controller\SimplePed.Controller.Interfaces.pas',
  SimplePed.Controller.Pedido in 'Controller\Pedido\SimplePed.Controller.Pedido.pas',
  SimplePed.Controller.Pedido.Interfaces in 'Controller\Pedido\SimplePed.Controller.Pedido.Interfaces.pas',
  SimplePed.Controller.PedidoItens in 'Controller\Pedido\SimplePed.Controller.PedidoItens.pas',
  SimplePed.Model.Exceptions in 'Model\Exceptions\SimplePed.Model.Exceptions.pas',
  SimplePed.Controller.Exceptions in 'Controller\Exceptions\SimplePed.Controller.Exceptions.pas',
  SimplePed.Model.DAO.Interfaces in 'Model\DAO\SimplePed.Model.DAO.Interfaces.pas',
  SimplePed.Model.DAO.SQL in 'Model\DAO\SimplePed.Model.DAO.SQL.pas',
  SimplePed.Model.DAO.Factory in 'Model\DAO\SimplePed.Model.DAO.Factory.pas',
  SimplePed.Model.Components.Interfaces in 'Model\Components\SimplePed.Model.Components.Interfaces.pas',
  SimplePed.Model.Components.FireDAC in 'Model\Components\SimplePed.Model.Components.FireDAC.pas',
  SimplePed.Model.Components.Factory in 'Model\Components\SimplePed.Model.Components.Factory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
