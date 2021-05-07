program SimplePed;

uses
  Vcl.Forms,
  SimplePed.View.Principal in 'View\SimplePed.View.Principal.pas' {Form6},
  SimplePed.Model.Conexao.FireDAC in 'Model\Conexao\SimplePed.Model.Conexao.FireDAC.pas' {DMFireDAC: TDataModule},
  SimplePed.Model.Entidade.Produto in 'Model\Entidades\SimplePed.Model.Entidade.Produto.pas',
  SimplePed.Model.Entidade.Pedido in 'Model\Entidades\SimplePed.Model.Entidade.Pedido.pas',
  SimplePed.Model.Entidade.PedidoItens in 'Model\Entidades\SimplePed.Model.Entidade.PedidoItens.pas',
  SimplePed.Model in 'Model\SimplePed.Model.pas',
  SimplePed.Model.Interfaces in 'Model\SimplePed.Model.Interfaces.pas',
  SimplePed.Controller.Produto in 'Controller\Produto\SimplePed.Controller.Produto.pas',
  SimplePed.Controller.Produto.Interfaces in 'Controller\Produto\SimplePed.Controller.Produto.Interfaces.pas',
  SimplePed.Controller in 'Controller\SimplePed.Controller.pas',
  SimplePed.Controller.Interfaces in 'Controller\SimplePed.Controller.Interfaces.pas',
  SimplePed.Model.Pedido in 'Model\Pedido\SimplePed.Model.Pedido.pas',
  SimplePed.Model.Pedido.Interfaces in 'Model\Pedido\SimplePed.Model.Pedido.Interfaces.pas',
  SimplePed.Controller.Pedido in 'Controller\Pedido\SimplePed.Controller.Pedido.pas',
  SimplePed.Controller.Pedido.Interfaces in 'Controller\Pedido\SimplePed.Controller.Pedido.Interfaces.pas',
  SimplePed.Controller.PedidoItens in 'Controller\Pedido\SimplePed.Controller.PedidoItens.pas',
  SimplePed.Model.Exceptions in 'Model\Exceptions\SimplePed.Model.Exceptions.pas',
  SimplePed.Controller.Exceptions in 'Controller\Exceptions\SimplePed.Controller.Exceptions.pas',
  SimplePed.Model.DAO.Interfaces in 'Model\DAO\SimplePed.Model.DAO.Interfaces.pas',
  SimplePed.Model.DAO.SQL in 'Model\DAO\SimplePed.Model.DAO.SQL.pas',
  SimplePed.Model.Entidade.CUPOM in 'Model\Entidades\SimplePed.Model.Entidade.CUPOM.pas',
  SimplePed.Model.Entidade.CUPOMITENS in 'Model\Entidades\SimplePed.Model.Entidade.CUPOMITENS.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMFireDAC, DMFireDAC);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
