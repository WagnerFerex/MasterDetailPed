unit SimplePed.Model.Entidade.Produto.Test;

interface

uses
  DUnitX.TestFramework,
  SimplePed.Model.Interfaces,
  SimplePed.Model.Entidade.PRODUTO;

type
  [TestFixture]
  TModeDAOProdutoTest = class(TObject)
  private
    FModel: iModel;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure ValidateFields;
    [Test]
    procedure Insert;
  end;

implementation

uses
  SimplePed.Model;

procedure TModeDAOProdutoTest.Insert;
var
  Produto: TPRODUTO;
begin
  Produto := TPRODUTO.Create;
  try
    Produto.DESCRICAO := '';
    Produto.VALORUNITARIO := 10;

    Assert.WillNotRaise(
    procedure
    begin

      FModel.DAO.PRODUTO._This.ID


    end, nil, 'Insert TPRODUTO erro na inserção no banco.');
  finally
    Produto.Free;
  end;



  Assert.WillNotRaise(
    procedure
    begin

      with FModel.DAO.PRODUTO do
      begin
        Insert;
      end;

    end, nil, 'TPRODUTO.Insert erro na inserção no banco.');
end;

procedure TModeDAOProdutoTest.Setup;
begin
  FModel := TSimplePedModel.New;
end;

procedure TModeDAOProdutoTest.TearDown;
begin
end;

procedure TModeDAOProdutoTest.ValidateFields;
begin
  FModel.DAO.PRODUTO._This.DESCRICAO := '';
  Assert.WillRaise(
    procedure
    begin
      FModel.DAO.PRODUTO._This.DESCRICAO;
    end, nil, 'TPRODUTO.DESCRICAO não pode aceitar valor vazio.');
end;

initialization
  TDUnitX.RegisterTestFixture(TModeDAOProdutoTest);

end.
