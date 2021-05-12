unit SimplePed.Controller.Generic;

interface

uses
  Vcl.Forms,
  Data.DB,
  SimplePed.Model.DAO.Interfaces,
  SimplePed.Controller.Interfaces;

type
  TControllerGeneric<T: class, constructor> = class(TInterfacedObject, iControllerGeneric<T>)
  private
    FDAO: iModelDAO<T>;
    FParent: iController;
  public
    constructor Create(AParent: iController);
    destructor Destroy; override;
    class function New(AParent: iController): iControllerGeneric<T>;
    function DataSource(AValue: TDataSource): iControllerGeneric<T>;
    function BindForm(AForm: TForm): iControllerGeneric<T>;
    function DAO: iModelDAO<T>;
    function &End: iController;
  end;

implementation

uses
  SimplePed.Model.DAO.SQL;

{ TControllerGeneric<T> }

function TControllerGeneric<T>.&End: iController;
begin
  Result := FParent;
end;

function TControllerGeneric<T>.BindForm(AForm: TForm): iControllerGeneric<T>;
begin
  Result := Self;
  FDAO.Form(AForm);
end;

constructor TControllerGeneric<T>.Create(AParent: iController);
begin
  FParent := AParent;
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

class function TControllerGeneric<T>.New(AParent: iController): iControllerGeneric<T>;
begin
  Result := Self.Create(AParent);
end;

end.
