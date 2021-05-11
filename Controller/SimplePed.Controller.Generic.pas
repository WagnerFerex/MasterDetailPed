unit SimplePed.Controller.Generic;

interface

uses
  Data.DB,
  SimplePed.Model.DAO.Interfaces,
  SimplePed.Controller.Interfaces;

type
  TControllerGeneric<T: class, constructor> = class(TInterfacedObject, iControllerGeneric<T>)
  private
    FDAO: iModelDAO<T>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerGeneric<T>;
    function DataSource(AValue: TDataSource): iControllerGeneric<T>;
    function DAO: iModelDAO<T>;
  end;

implementation

uses
  SimplePed.Model.DAO.SQL;

{ TControllerGeneric<T> }

constructor TControllerGeneric<T>.Create;
begin
  FDAO := TModelDAO<T>.Create;
end;

function TControllerGeneric<T>.DAO: iModelDAO<T>;
begin
  Result := FDAO;
end;

function TControllerGeneric<T>.DataSource(AValue: TDataSource): iControllerGeneric<T>;
begin
  Result := Self;
  FDAO.DataSource(AValue);
end;

destructor TControllerGeneric<T>.Destroy;
begin

  inherited;
end;

class function TControllerGeneric<T>.New: iControllerGeneric<T>;
begin
  Result := Self.Create;
end;

end.
