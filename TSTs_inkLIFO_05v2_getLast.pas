unit TSTs_inkLIFO_05v2_getLast;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkLIFO,
     inkLIFO;

type

 tTests_inkLIFO_05v2_nodeGetLast= class(tTSTCTC_CORE_inkLIFO)
  published
    procedure getLast_node_Nil;
    procedure getLast_node_One;
    procedure getLast_node_Two;
    procedure getLast_node_SiX;
  published
    procedure getLast_count_Nil;
    procedure getLast_count_One;
    procedure getLast_count_Two;
    procedure getLast_count_SiX;
  end;

implementation

procedure  tTests_inkLIFO_05v2_nodeGetLast.getLast_node_Nil;
var lst:pointer;
    cnt:NativeUint;
begin
    STACK:=TST_stack_Create(0);
    //---
    lst:=inkLIFO_nodeGetLast(STACK,cnt);
    //---
    AssertSame  ('wrong last Node', TST_STACK_LAST ,lst);
    AssertEquals('wrong count'    , TST_STACK_Count,cnt);
end;

procedure  tTests_inkLIFO_05v2_nodeGetLast.getLast_node_One;
var lst:pointer;
    cnt:NativeUint;
begin
    STACK:=TST_stack_Create(1);
    //---
    lst:=inkLIFO_nodeGetLast(STACK,cnt);
    //---
    AssertSame  ('wrong last Node', TST_STACK_LAST ,lst);
    AssertEquals('wrong count'    , TST_STACK_Count,cnt);
end;

procedure  tTests_inkLIFO_05v2_nodeGetLast.getLast_node_Two;
var lst:pointer;
    cnt:NativeUint;
begin
    STACK:=TST_stack_Create(2);
    //---
    lst:=inkLIFO_nodeGetLast(STACK,cnt);
    //---
    AssertSame  ('wrong last Node', TST_STACK_LAST ,lst);
    AssertEquals('wrong count'    , TST_STACK_Count,cnt);
end;

procedure  tTests_inkLIFO_05v2_nodeGetLast.getLast_node_SiX;
var lst:pointer;
    cnt:NativeUint;
begin
    STACK:=TST_stack_Create(6);
    //---
    lst:=inkLIFO_nodeGetLast(STACK,cnt);
    //---
    AssertSame  ('wrong last Node', TST_STACK_LAST ,lst);
    AssertEquals('wrong count'    , TST_STACK_Count,cnt);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure  tTests_inkLIFO_05v2_nodeGetLast.getLast_count_Nil;
var lst:pointer;
    cnt:NativeUint;
begin
    STACK:=TST_stack_Create(0);
    //---
    cnt:=inkLIFO_nodeGetLast(STACK,lst);
    //---
    AssertSame  ('wrong last Node', TST_STACK_LAST ,lst);
    AssertEquals('wrong count'    , TST_STACK_Count,cnt);
end;

procedure  tTests_inkLIFO_05v2_nodeGetLast.getLast_count_One;
var lst:pointer;
    cnt:NativeUint;
begin
    STACK:=TST_stack_Create(1);
    //---
    cnt:=inkLIFO_nodeGetLast(STACK,lst);
    //---
    AssertSame  ('wrong last Node', TST_STACK_LAST ,lst);
    AssertEquals('wrong count'    , TST_STACK_Count,cnt);
end;

procedure  tTests_inkLIFO_05v2_nodeGetLast.getLast_count_Two;
var lst:pointer;
    cnt:NativeUint;
begin
    STACK:=TST_stack_Create(2);
    //---
    cnt:=inkLIFO_nodeGetLast(STACK,lst);
    //---
    AssertSame  ('wrong last Node', TST_STACK_LAST ,lst);
    AssertEquals('wrong count'    , TST_STACK_Count,cnt);
end;

procedure  tTests_inkLIFO_05v2_nodeGetLast.getLast_count_SiX;
var lst:pointer;
    cnt:NativeUint;
begin
    STACK:=TST_stack_Create(6);
    //---
    cnt:=inkLIFO_nodeGetLast(STACK,lst);
    //---
    AssertSame  ('wrong last Node', TST_STACK_LAST ,lst);
    AssertEquals('wrong count'    , TST_STACK_Count,cnt);
end;

initialization
    RegisterTest(cTestSuitePath__inkLIFO,tTests_inkLIFO_05v2_nodeGetLast);
end.

