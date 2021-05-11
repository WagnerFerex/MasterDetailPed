unit SimplePed.Model.DAO.Interfaces;

interface

uses
  Data.DB,
  Vcl.Forms,
  System.Generics.Collections,
  SimpleInterface,
  SimplePed.Model.Entidade.Produto,
  SimplePed.Model.Entidade.Pedido,
  SimplePed.Model.Entidade.PedidoItens;


type
  iModelDAO<T: class, constructor> = interface
    ['{B08B6A07-2EF9-4D43-AF6F-9D38D9BB3678}']
    function _This: T;
    function Form(AForm: TForm): iModelDAO<T>;
    function DataSet: TDataSet;
    function DataSource(ADataSource: TDataSource): iModelDAO<T>;
    function Delete: iModelDAO<T>;
    function Find(AList: TObjectList<T>): iModelDAO<T>; overload;
    function Find(AId: Variant): T; overload;
    function Find(Where: string = ''; OrderBy: string = ''): iModelDAO<T>; overload;
    function Insert: iModelDAO<T>;
    function SQL: iSimpleDAOSQLAttribute<T>;
    function Update: iModelDAO<T>;
  end;

  iModelDAOFactory = interface
    ['{9A087E63-5665-47AF-A188-1CE8ABC20309}']
    function PRODUTO: iModelDAO<TPRODUTO>;
    function PEDIDO: iModelDAO<TPEDIDO>;
    function PEDIDOITENS: iModelDAO<TPEDIDOITENS>;
  end;

implementation

end.
