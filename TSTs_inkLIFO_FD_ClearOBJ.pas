unit TSTs_inkLIFO_FD_ClearOBJ;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry, uTST_CORE_inkLIFO,
     inkLIFO;

type

 tTests_inkLIFO_FD_ClearOBJ=class(tTSTCTC_CORE_inkLIFO)
  published
    procedure Clear_NIL;
    procedure Clear_One;
    procedure Clear_Two;
    procedure Clear_Six;
  end;

implementation

type
 tTST_testClass=class
  public
    destructor DESTROY; override;
  end;

destructor tTST_testClass.DESTROY;
begin
    inherited;
end;

//------------------------------------------------------------------------------

procedure tTests_inkLIFO_FD_ClearOBJ.Clear_NIL;
begin
    STACK:=TST_stack_Create(0);
    //---
    inkLIFO_ClearOBJ(STACK);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkLIFO_FD_ClearOBJ.Clear_One;
begin
    STACK:=TST_node_Create(tTST_testClass.Create,nil);
    //---
    inkLIFO_ClearOBJ(STACK);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkLIFO_FD_ClearOBJ.Clear_Two;
begin
    STACK:=TST_node_Create(tTST_testClass.Create,nil);
    STACK:=TST_node_Create(tTST_testClass.Create,STACK);
    //---
    inkLIFO_ClearOBJ(STACK);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkLIFO_FD_ClearOBJ.Clear_Six;
begin
    STACK:=TST_node_Create(tTST_testClass.Create,nil);
    STACK:=TST_node_Create(tTST_testClass.Create,STACK);
    STACK:=TST_node_Create(tTST_testClass.Create,STACK);
    STACK:=TST_node_Create(tTST_testClass.Create,STACK);
    STACK:=TST_node_Create(tTST_testClass.Create,STACK);
    STACK:=TST_node_Create(tTST_testClass.Create,STACK);
    //---
    inkLIFO_ClearOBJ(STACK);
    //---
    AssertNull(STACK);
end;

initialization
    RegisterTest(cTestSuitePath__inkLIFO,tTests_inkLIFO_FD_ClearOBJ);
end.
