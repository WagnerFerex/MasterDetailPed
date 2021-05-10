unit SimplePed.Model.Components.Factory;

interface

uses
  SimplePed.Model.Components.Interfaces,
  SimpleInterface,
  SimpleQueryFireDAC;

type
  TModelComponentsFactory = class(TInterfacedObject, IModelComponentsFactory)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelComponentsFactory;
    function Query: IModelComponentsQuery;
    function SimpleQuery: iSimpleQuery;
  end;

implementation

uses
  SimplePed.Model.Components.FireDAC;

{ TModelComponentsFactory }

constructor TModelComponentsFactory.Create;
begin

end;

destructor TModelComponentsFactory.Destroy;
begin

  inherited;
end;

class function TModelComponentsFactory.New: IModelComponentsFactory;
begin
  Result := Self.Create
end;

function TModelComponentsFactory.Query: IModelComponentsQuery;
begin
  Result := TModelComponentsFDQuery.New;
end;

function TModelComponentsFactory.SimpleQuery: iSimpleQuery;
begin
  Result := TSimpleQueryFiredac.New();
end;

end.
