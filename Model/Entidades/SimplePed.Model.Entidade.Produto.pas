unit SimplePed.Model.Entidade.Produto;

interface

uses
  SimpleAttributes;

type
  [Tabela('PRODUTO')]
  TPRODUTO = class
  private
    FDESCRICAO: String;
    FVALORUNITARIO: Currency;
    FID: Integer;
    procedure SetDESCRICAO(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetVALORUNITARIO(const Value: Currency);
    function GetDESCRICAO: String;
  public
    [Campo('ID_PRODUTO'), PK, AutoInc]
    property ID : Integer read FID write SetID;
    [Campo('DESCRICAO')]
    property DESCRICAO : String read GetDESCRICAO write SetDESCRICAO;
    [Campo('VALORUNITARIO')]
    property VALORUNITARIO : Currency read FVALORUNITARIO write SetVALORUNITARIO;
  end;

implementation

uses
  SimplePed.Model.Exceptions;

{ TPRODUTO }

function TPRODUTO.GetDESCRICAO: String;
begin
  if FDESCRICAO = '' then
    raise TValidaCampo.Create('DESCRICAO', 'O Campo Descrição não pode ser Nulo');

  Result := FDESCRICAO;
end;

procedure TPRODUTO.SetDESCRICAO(const Value: String);
begin
  FDESCRICAO := Value;
end;

procedure TPRODUTO.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TPRODUTO.SetVALORUNITARIO(const Value: Currency);
begin
  FVALORUNITARIO := Value;
end;

end.
