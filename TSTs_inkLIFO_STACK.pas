unit TSTs_inkLIFO_STACK;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkLIFO,
     inkLIFO;

type

 tTests_inkLIFO_STACK= class(tTSTCTC_CORE_inkLIFO)
  published
    procedure node_PUSH;
    procedure node_POP;
  published
    procedure data_PUSH;
    procedure data_POP;
  end;

implementation

procedure  tTests_inkLIFO_STACK.node_PUSH;
var tmp:pointer;
begin
    STACK:=TST_stack_Create(0);
    //---
    tmp  :=TST_node_Create(0);
    inkLIFO_nodePUSH(STACK,tmp);
    AssertEquals('#1 wrong count',1,TST_STACK_Count);
    //---
    tmp  :=TST_node_Create(1);
    inkLIFO_nodePUSH(STACK,tmp);
    AssertEquals('#2 wrong count',2,TST_STACK_Count);
    //---
    tmp  :=TST_node_Create(2);
    inkLIFO_nodePUSH(STACK,tmp);
    AssertEquals('#3 wrong count',3,TST_STACK_Count);
    //---
    tmp  :=TST_node_Create(3);
    inkLIFO_nodePUSH(STACK,tmp);
    AssertEquals('#4 wrong count',4,TST_STACK_Count);
    //---
    tmp  :=TST_node_Create(4);
    inkLIFO_nodePUSH(STACK,tmp);
    AssertEquals('#5 wrong count',5,TST_STACK_Count);
    //---
    tmp  :=TST_node_Create(5);
    inkLIFO_nodePUSH(STACK,tmp);
    AssertEquals('#6 wrong count',6,TST_STACK_Count);
end;

procedure  tTests_inkLIFO_STACK.node_POP;
var tmp:pointer;
begin
    STACK:=TST_stack_Create(6);
    //---
    tmp:=inkLIFO_nodePOP(STACK);
    AssertNotNull('#1 wrong pop'  ,tmp);
    AssertEquals ('#1 wrong count',5,TST_node_Nmbr(tmp));
    AssertEquals ('#1 wrong count',5,TST_STACK_Count);
    TST_node_DESTROY(tmp);
    //---
    tmp:=inkLIFO_nodePOP(STACK);
    AssertNotNull('#2 wrong pop'  ,tmp);
    AssertEquals ('#2 wrong count',4,TST_node_Nmbr(tmp));
    AssertEquals ('#2 wrong count',4,TST_STACK_Count);
    TST_node_DESTROY(tmp);
    //---
    tmp:=inkLIFO_nodePOP(STACK);
    AssertNotNull('#3 wrong pop'  ,tmp);
    AssertEquals ('#3 wrong count',3,TST_node_Nmbr(tmp));
    AssertEquals ('#3 wrong count',3,TST_STACK_Count);
    TST_node_DESTROY(tmp);
    //---
    tmp:=inkLIFO_nodePOP(STACK);
    AssertNotNull('#4 wrong pop'  ,tmp);
    AssertEquals ('#4 wrong count',2,TST_node_Nmbr(tmp));
    AssertEquals ('#4 wrong count',2,TST_STACK_Count);
    TST_node_DESTROY(tmp);
    //---
    tmp:=inkLIFO_nodePOP(STACK);
    AssertNotNull('#5 wrong pop'  ,tmp);
    AssertEquals ('#5 wrong count',1,TST_node_Nmbr(tmp));
    AssertEquals ('#5 wrong count',1,TST_STACK_Count);
    TST_node_DESTROY(tmp);
    //---
    tmp:=inkLIFO_nodePOP(STACK);
    AssertNotNull('#6 wrong pop'  ,tmp);
    AssertEquals ('#6 wrong count',0,TST_node_Nmbr(tmp));
    AssertEquals ('#6 wrong count',0,TST_STACK_Count);
    AssertNull   ('#6 wrong pop'  ,STACK);
    TST_node_DESTROY(tmp);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure  tTests_inkLIFO_STACK.data_PUSH;
var tmp:pointer;
begin
    STACK:=TST_stack_Create(0);
    //---
    tmp  :=TST_data_Create(0);
    inkLIFO_PUSH(STACK,tmp);
    AssertEquals('#1 wrong count',1,TST_STACK_Count);
    //---
    tmp  :=TST_data_Create(1);
    inkLIFO_PUSH(STACK,tmp);
    AssertEquals('#2 wrong count',2,TST_STACK_Count);
    //---
    tmp  :=TST_data_Create(2);
    inkLIFO_PUSH(STACK,tmp);
    AssertEquals('#3 wrong count',3,TST_STACK_Count);
    //---
    tmp  :=TST_data_Create(3);
    inkLIFO_PUSH(STACK,tmp);
    AssertEquals('#4 wrong count',4,TST_STACK_Count);
    //---
    tmp  :=TST_data_Create(4);
    inkLIFO_PUSH(STACK,tmp);
    AssertEquals('#5 wrong count',5,TST_STACK_Count);
    //---
    tmp  :=TST_data_Create(5);
    inkLIFO_PUSH(STACK,tmp);
    AssertEquals('#6 wrong count',6,TST_STACK_Count);
end;

procedure  tTests_inkLIFO_STACK.data_POP;
var tmp:pointer;
begin
    STACK:=TST_stack_Create(6);
    //---
    tmp:=inkLIFO_POP(STACK);
    AssertNotNull('#1 wrong pop'  ,tmp);
    AssertEquals ('#1 wrong count',5,TST_DATA_Nmbr(tmp));
    AssertEquals ('#1 wrong count',5,TST_STACK_Count);
    TST_data_DESTROY(tmp);
    //---
    tmp:=inkLIFO_POP(STACK);
    AssertNotNull('#2 wrong pop'  ,tmp);
    AssertEquals ('#2 wrong count',4,TST_DATA_Nmbr(tmp));
    AssertEquals ('#2 wrong count',4,TST_STACK_Count);
    TST_data_DESTROY(tmp);
    //---
    tmp:=inkLIFO_POP(STACK);
    AssertNotNull('#3 wrong pop'  ,tmp);
    AssertEquals ('#3 wrong count',3,TST_DATA_Nmbr(tmp));
    AssertEquals ('#3 wrong count',3,TST_STACK_Count);
    TST_data_DESTROY(tmp);
    //---
    tmp:=inkLIFO_POP(STACK);
    AssertNotNull('#4 wrong pop'  ,tmp);
    AssertEquals ('#4 wrong count',2,TST_DATA_Nmbr(tmp));
    AssertEquals ('#4 wrong count',2,TST_STACK_Count);
    TST_data_DESTROY(tmp);
    //---
    tmp:=inkLIFO_POP(STACK);
    AssertNotNull('#5 wrong pop'  ,tmp);
    AssertEquals ('#5 wrong count',1,TST_DATA_Nmbr(tmp));
    AssertEquals ('#5 wrong count',1,TST_STACK_Count);
    TST_data_DESTROY(tmp);
    //---
    tmp:=inkLIFO_POP(STACK);
    AssertNotNull('#6 wrong pop'  ,tmp);
    AssertEquals ('#6 wrong count',0,TST_DATA_Nmbr(tmp));
    AssertEquals ('#6 wrong count',0,TST_STACK_Count);
    AssertNull   ('#6 wrong pop'  ,STACK);
    TST_data_DESTROY(tmp);
    //---
end;

initialization
    RegisterTest(cTestSuitePath__inkLIFO,tTests_inkLIFO_STACK);
end.

