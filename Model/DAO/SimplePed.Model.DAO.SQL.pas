unit SimplePed.Model.DAO.SQL;

interface

uses
  Vcl.Forms,
  Data.DB,
  System.Generics.Collections,
  SimpleInterface,
  SimpleDAO,
  SimpleUtil,
  SimpleQueryFireDAC,
  SimplePed.Model.DAO.Interfaces;

type
  TModelDAO<T: class, constructor> = class(TInterfacedObject, iModelDAO<T>)
  private
    FThis: T;
    FSimpleQuery: iSimpleQuery;
    FSimpleDAO: iSimpleDAO<T>;
    FForm: TForm;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelDAO<T>;
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

implementation

{ TModelDAO<T> }

uses
  SimplePed.Model.Components.Factory, System.SysUtils;

constructor TModelDAO<T>.Create;
begin
  FThis := T.Create;
  FSimpleQuery := TModelComponentsFactory.New.SimpleQuery;
  FSimpleDAO := TSimpleDAO<T>.New(FSimpleQuery);
end;

function TModelDAO<T>.DataSet: TDataSet;
begin
  Result := FSimpleQuery.DataSet;
end;

function TModelDAO<T>.DataSource(ADataSource: TDataSource): iModelDAO<T>;
begin
  Result := Self;
  FSimpleDAO.DataSource(ADataSource);
end;

function TModelDAO<T>.Delete: iModelDAO<T>;
begin
  Result := Self;
  if Assigned(FForm) then
    FSimpleDAO.Delete
  else
    FSimpleDAO.Delete(FThis);
end;

destructor TModelDAO<T>.Destroy;
begin
  FThis.DisposeOf;
  inherited;
end;

function TModelDAO<T>.Find(Aid: Variant): T;
begin
  Result := FSimpleDAO.Find(Integer(AId));
end;

function TModelDAO<T>.Find(AList: TObjectList<T>): iModelDAO<T>;
begin
  Result := Self;
  FSimpleDAO.Find(AList);
end;

function TModelDAO<T>.Find(Where, OrderBy: string): iModelDAO<T>;
begin
  if not Trim(Where).IsEmpty then
    FSimpleDAO.SQL.Where(Where);

  if not Trim(OrderBy).IsEmpty then
    FSimpleDAO.SQL.OrderBy(OrderBy);

  FSimpleDAO.Find;
end;

function TModelDAO<T>.Form(AForm: TForm): iModelDAO<T>;
begin
  Result := Self;
  FForm := AForm;
  FSimpleDAO.BindForm(FForm);
end;

function TModelDAO<T>.Insert: iModelDAO<T>;
begin
  Result := Self;

  if Assigned(FForm) then
    FSimpleDAO.Insert
  else
    FSimpleDAO.Insert(FThis);
end;

class function TModelDAO<T>.New: iModelDAO<T>;
begin
  Result := Self.Create;
end;

function TModelDAO<T>.SQL: iSimpleDAOSQLAttribute<T>;
begin
  Result := FSimpleDAO.SQL;
end;

function TModelDAO<T>.Update: iModelDAO<T>;
begin
  Result := Self;

  if Assigned(FForm) then
    FSimpleDAO.Update
  else
    FSimpleDAO.Update(FThis);
end;

function TModelDAO<T>._This: T;
begin
  Result := FThis;
end;

end.
