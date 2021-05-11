unit SimplePed.Model.Interfaces;

interface

uses
  SimplePed.Model.DAO.Interfaces,
  SimplePed.Model.Entidade.PedidoItens,
  SimplePed.Model.Components.Interfaces;

type

  iModel = interface
    ['{2A108A7C-FAA6-42F5-8982-B70F1F79A212}']
    function DAO: iModelDAOFactory;
    function Components: iModelComponentsFactory;
  end;

implementation

end.
