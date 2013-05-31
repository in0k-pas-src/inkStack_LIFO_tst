unit TSTs_inkLIFO_FFx0_Clean;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry, uTST_CORE_inkLIFO,
     inkLIFO;

type

 tTests_inkLIFO_FFx0_Clean=class(tTSTCTC_CORE_inkLIFO)
  published
    procedure Clear_NIL;
    procedure Clear_One;
    procedure Clear_Two;
    procedure Clear_Six;
  end;

implementation

procedure tTests_inkLIFO_FFx0_Clean.Clear_NIL;
begin
    STACK:=TST_stack_Create(0);
    //---
    inkLIFO_ClearOBJ(STACK);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkLIFO_FFx0_Clean.Clear_One;
begin
    STACK:=TST_node_Create(nil,nil);
    //---
    inkLIFO_nodesCLR(STACK,@TST_node_DESTROY);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkLIFO_FFx0_Clean.Clear_Two;
begin
    STACK:=TST_node_Create(nil,nil);
    STACK:=TST_node_Create(nil,STACK);
    //---
    inkLIFO_nodesCLR(STACK,@TST_node_DESTROY);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkLIFO_FFx0_Clean.Clear_Six;
begin
    STACK:=TST_node_Create(nil,nil);
    STACK:=TST_node_Create(nil,STACK);
    STACK:=TST_node_Create(nil,STACK);
    STACK:=TST_node_Create(nil,STACK);
    STACK:=TST_node_Create(nil,STACK);
    STACK:=TST_node_Create(nil,STACK);
    //---
    inkLIFO_nodesCLR(STACK,@TST_node_DESTROY);
    //---
    AssertNull(STACK);
end;

initialization
    RegisterTest(cTestSuitePath__inkLIFO,tTests_inkLIFO_FFx0_Clean);
end.
