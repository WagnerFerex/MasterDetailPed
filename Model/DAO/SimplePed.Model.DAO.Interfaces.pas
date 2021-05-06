unit SimplePed.Model.DAO.Interfaces;

interface

uses
  Data.DB,
  System.Generics.Collections,
  SimpleInterface;


type
  iModelDAO<T: class, constructor> = interface
    ['{B08B6A07-2EF9-4D43-AF6F-9D38D9BB3678}']
    function DataSource(ADataSource: TDataSource): iModelDAO<T>;
    function _This: T;
    function _NewThis: T;
    function SQL : iSimpleDAOSQLAttribute<T>;
    function Find : TObjectList<T>; overload;
    function Find(Aid: Variant): T; overload;
    function Find(Where: string; OrderBy: string = ''): TObjectList<T>; overload;
    function Insert: iModelDAO<T>; overload;
    function Update: iModelDAO<T>; overload;
    function Delete: iModelDAO<T>; overload;
    function Insert(aObject: T): iModelDAO<T>; overload;
    function Update(aObject: T): iModelDAO<T>; overload;
    function Delete(aObject: T): iModelDAO<T>; overload;
  end;

  iModelDAOFactory = interface
    ['{9A087E63-5665-47AF-A188-1CE8ABC20309}']
//    function Produto: iModelDAO<TPRODUTO>;
//    function Pedido: iModelDAO<TPEDIDO>;
//    function PedidoItens: iModelDAO<TPEDIDOITENS>;
  end;

implementation

end.
