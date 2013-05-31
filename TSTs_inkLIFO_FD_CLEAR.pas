unit TSTs_inkLIFO_FD_CLEAR;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry, uTST_CORE_inkLIFO,
     inkLIFO;

type

 ttst_testClass=class
  end;

 tTests_inkLIFO_FD_CLEAR=class(tTSTCTC_CORE_inkLIFO)
  published
    procedure Clear_NIL;
    procedure Clear_One;
    procedure Clear_Two;
    procedure Clear_Six;
  end;

implementation

procedure tTests_inkLIFO_FD_CLEAR.Clear_NIL;
begin
    STACK:=TST_stack_Create(0);
    //---
    inkLIFO_ClearOBJ(STACK);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkLIFO_FD_CLEAR.Clear_One;
begin
    STACK:=TST_node_Create(ttst_testClass.Create,nil);
    //---
    inkLIFO_nodesCLR(STACK,@TST_node_DESTROY);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkLIFO_FD_CLEAR.Clear_Two;
begin
    STACK:=TST_node_Create(ttst_testClass.Create,nil);
    STACK:=TST_node_Create(ttst_testClass.Create,STACK);
    //---
    inkLIFO_nodesCLR(STACK,@TST_node_DESTROY);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkLIFO_FD_CLEAR.Clear_Six;
begin
    STACK:=TST_node_Create(ttst_testClass.Create,nil);
    STACK:=TST_node_Create(ttst_testClass.Create,STACK);
    STACK:=TST_node_Create(ttst_testClass.Create,STACK);
    STACK:=TST_node_Create(ttst_testClass.Create,STACK);
    STACK:=TST_node_Create(ttst_testClass.Create,STACK);
    STACK:=TST_node_Create(ttst_testClass.Create,STACK);
    //---
    inkLIFO_nodesCLR(STACK,@TST_node_DESTROY);
    //---
    AssertNull(STACK);
end;

initialization
    RegisterTest(cTestSuitePath__inkLIFO,tTests_inkLIFO_FD_CLEAR);
end.
