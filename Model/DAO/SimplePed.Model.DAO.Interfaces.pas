unit SimplePed.Model.DAO.Interfaces;

interface

uses
  Data.DB,
  System.Generics.Collections,
  SimpleInterface,
  SimplePed.Model.Entidade.Produto,
  SimplePed.Model.Entidade.Pedido,
  SimplePed.Model.Entidade.PedidoItens;


type
  iModelDAO<T: class, constructor> = interface
    ['{B08B6A07-2EF9-4D43-AF6F-9D38D9BB3678}']
    function DataSet: TDataSet;
    function _This: T;
    function SQL : iSimpleDAOSQLAttribute<T>;
    function Find(AList: TObjectList<T>) : iModelDAO<T>; overload;
    function Find(AId: Variant): T; overload;
    function Find(Where: string = ''; OrderBy: string = ''): TObjectList<T>; overload;
    function Insert: iModelDAO<T>; overload;
    function Update: iModelDAO<T>; overload;
    function Delete: iModelDAO<T>; overload;
    function Insert(aObject: T): iModelDAO<T>; overload;
    function Update(aObject: T): iModelDAO<T>; overload;
    function Delete(aObject: T): iModelDAO<T>; overload;
  end;

  iModelDAOFactory = interface
    ['{9A087E63-5665-47AF-A188-1CE8ABC20309}']
    function PRODUTO: iModelDAO<TPRODUTO>;
    function PEDIDO: iModelDAO<TPEDIDO>;
    function PEDIDOITENS: iModelDAO<TPEDIDOITENS>;
  end;

implementation

end.
