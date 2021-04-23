unit SimplePed.Model.Produto.Interfaces;

interface

uses
  Data.DB,
  SimplePed.Model.Entidade.Produto,
  SimplePed.Model.DAO.Interfaces;

type
  iModelProduto = interface
    ['{3B23189E-D0F9-4218-92BD-FDC3F7977D50}']
    function Entidade : TPRODUTO;
    function DAO : iModelDAO<TPRODUTO>;
    function DataSource(aDataSource : TDataSource) : iModelProduto;
  end;

implementation

end.
