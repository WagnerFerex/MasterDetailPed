unit SimplePed.Model;

interface

uses
  SimplePed.Model.Interfaces,
  SimplePed.Model.DAO.Interfaces,
  SimplePed.Model.Components.Interfaces;

Type
  TSimplePedModel = class(TInterfacedObject, iModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModel;
    function DAO: iModelDAOFactory;
    function Components: iModelComponentsFactory;
  end;

implementation

{ TSimplePedModel }

uses
  SimplePed.Model.DAO.Factory,
  SimplePed.Model.Components.Factory;

function TSimplePedModel.Components: iModelComponentsFactory;
begin
  Result := TModelComponentsFactory.New;
end;

constructor TSimplePedModel.Create;
begin

end;

function TSimplePedModel.DAO: iModelDAOFactory;
begin
  Result := TModelDAOFactory.New;
end;

destructor TSimplePedModel.Destroy;
begin

  inherited;
end;

class function TSimplePedModel.New: iModel;
begin
  Result := Self.Create;
end;

end.
