datatype CACHE_STATE = I| S| E
datatype MSG_CMD = Empty| ReqS| ReqE| Inv| InvAck| GntS| GntE
type NODE=nat
type DATA=nat
type boolean=bool




method n_SendInvAckinv__39_0(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>,  Chan2_Cmd:array<MSG_CMD>, Chan3_Cmd:array<MSG_CMD>, Chan3_Data:array<DATA>, ExGntd:array<boolean>, 
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_Data.Length==N0


requires Cache_State.Length==N0

requires Chan2_Cmd.Length==N0
requires Chan3_Cmd.Length==N0
requires Chan3_Data.Length==N0
requires ExGntd.Length==N0

requires forall i,j::0<=i<Cache_Data.Length&&0<=j<Cache_Data.Length==>Cache_Data[i]!=Cache_Data[j]


requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]

requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]
requires forall i,j::0<=i<Chan3_Cmd.Length&&0<=j<Chan3_Cmd.Length==>Chan3_Cmd[i]!=Chan3_Cmd[j]
requires forall i,j::0<=i<Chan3_Data.Length&&0<=j<Chan3_Data.Length==>Chan3_Data[i]!=Chan3_Data[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]

requires 0<=i<N0
requires  p__Inv4<N0
requires i==p__Inv4
//1
requires ((Chan2_Cmd[i] == Inv) && (Chan3_Cmd[i] == Empty)) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Cache_Data
modifies Cache_State
modifies Chan2_Cmd
modifies Chan3_Cmd
modifies Chan3_Data

{
  Chan2_Cmd[i] := Empty;
  Chan3_Cmd[i] := InvAck;
  if (Cache_State[i] == E) {
    Chan3_Data[i] := Cache_Data[i];
  }
  Cache_State[i] := I;
}

method n_SendInvAckinv__39_1(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>,  Chan2_Cmd:array<MSG_CMD>, Chan3_Cmd:array<MSG_CMD>, Chan3_Data:array<DATA>, ExGntd:array<boolean>, 
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_Data.Length==N0


requires Cache_State.Length==N0

requires Chan2_Cmd.Length==N0
requires Chan3_Cmd.Length==N0
requires Chan3_Data.Length==N0
requires ExGntd.Length==N0

requires forall i,j::0<=i<Cache_Data.Length&&0<=j<Cache_Data.Length==>Cache_Data[i]!=Cache_Data[j]


requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]

requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]
requires forall i,j::0<=i<Chan3_Cmd.Length&&0<=j<Chan3_Cmd.Length==>Chan3_Cmd[i]!=Chan3_Cmd[j]
requires forall i,j::0<=i<Chan3_Data.Length&&0<=j<Chan3_Data.Length==>Chan3_Data[i]!=Chan3_Data[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]

requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//2
requires ((Chan2_Cmd[i] == Inv) && (Chan3_Cmd[i] == Empty)) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Cache_Data
modifies Cache_State
modifies Chan2_Cmd
modifies Chan3_Cmd
modifies Chan3_Data

{
  Chan2_Cmd[i] := Empty;
  Chan3_Cmd[i] := InvAck;
  if (Cache_State[i] == E) {
    Chan3_Data[i] := Cache_Data[i];
  }
  Cache_State[i] := I;
}

method n_SendInvAckinv__39_2(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>,  Chan2_Cmd:array<MSG_CMD>, Chan3_Cmd:array<MSG_CMD>, Chan3_Data:array<DATA>, ExGntd:array<boolean>, 
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_Data.Length==N0


requires Cache_State.Length==N0

requires Chan2_Cmd.Length==N0
requires Chan3_Cmd.Length==N0
requires Chan3_Data.Length==N0
requires ExGntd.Length==N0

requires forall i,j::0<=i<Cache_Data.Length&&0<=j<Cache_Data.Length==>Cache_Data[i]!=Cache_Data[j]


requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]

requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]
requires forall i,j::0<=i<Chan3_Cmd.Length&&0<=j<Chan3_Cmd.Length==>Chan3_Cmd[i]!=Chan3_Cmd[j]
requires forall i,j::0<=i<Chan3_Data.Length&&0<=j<Chan3_Data.Length==>Chan3_Data[i]!=Chan3_Data[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]

requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//2
requires ((Chan2_Cmd[i] == Inv) && (Chan3_Cmd[i] == Empty)) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Cache_Data
modifies Cache_State
modifies Chan2_Cmd
modifies Chan3_Cmd
modifies Chan3_Data

{
  Chan2_Cmd[i] := Empty;
  Chan3_Cmd[i] := InvAck;
  if (Cache_State[i] == E) {
    Chan3_Data[i] := Cache_Data[i];
  }
  Cache_State[i] := I;
}

method n_SendInvAckinv__39_3(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>,  Chan2_Cmd:array<MSG_CMD>, Chan3_Cmd:array<MSG_CMD>, Chan3_Data:array<DATA>, ExGntd:array<boolean>, 
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_Data.Length==N0


requires Cache_State.Length==N0

requires Chan2_Cmd.Length==N0
requires Chan3_Cmd.Length==N0
requires Chan3_Data.Length==N0
requires ExGntd.Length==N0

requires forall i,j::0<=i<Cache_Data.Length&&0<=j<Cache_Data.Length==>Cache_Data[i]!=Cache_Data[j]


requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]

requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]
requires forall i,j::0<=i<Chan3_Cmd.Length&&0<=j<Chan3_Cmd.Length==>Chan3_Cmd[i]!=Chan3_Cmd[j]
requires forall i,j::0<=i<Chan3_Data.Length&&0<=j<Chan3_Data.Length==>Chan3_Data[i]!=Chan3_Data[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]

requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//2
requires ((Chan2_Cmd[i] == Inv) && (Chan3_Cmd[i] == Empty)) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Cache_Data
modifies Cache_State
modifies Chan2_Cmd
modifies Chan3_Cmd
modifies Chan3_Data

{
  Chan2_Cmd[i] := Empty;
  Chan3_Cmd[i] := InvAck;
  if (Cache_State[i] == E) {
    Chan3_Data[i] := Cache_Data[i];
  }
  Cache_State[i] := I;
}

method n_SendInvAckinv__39_4(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>,  Chan2_Cmd:array<MSG_CMD>, Chan3_Cmd:array<MSG_CMD>, Chan3_Data:array<DATA>, ExGntd:array<boolean>, 
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_Data.Length==N0


requires Cache_State.Length==N0

requires Chan2_Cmd.Length==N0
requires Chan3_Cmd.Length==N0
requires Chan3_Data.Length==N0
requires ExGntd.Length==N0

requires forall i,j::0<=i<Cache_Data.Length&&0<=j<Cache_Data.Length==>Cache_Data[i]!=Cache_Data[j]


requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]

requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]
requires forall i,j::0<=i<Chan3_Cmd.Length&&0<=j<Chan3_Cmd.Length==>Chan3_Cmd[i]!=Chan3_Cmd[j]
requires forall i,j::0<=i<Chan3_Data.Length&&0<=j<Chan3_Data.Length==>Chan3_Data[i]!=Chan3_Data[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]

requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//2
requires ((Chan2_Cmd[i] == Inv) && (Chan3_Cmd[i] == Empty)) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Cache_Data
modifies Cache_State
modifies Chan2_Cmd
modifies Chan3_Cmd
modifies Chan3_Data

{
  Chan2_Cmd[i] := Empty;
  Chan3_Cmd[i] := InvAck;
  if (Cache_State[i] == E) {
    Chan3_Data[i] := Cache_Data[i];
  }
  Cache_State[i] := I;
}


method n_RecvInvAckinv__39_0(Cache_State:array<CACHE_STATE>,   Chan3_Cmd:array<MSG_CMD>,  Chan3_Data:array<DATA>, CurCmd:array<MSG_CMD>,  ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan3_Cmd.Length==N0

requires Chan3_Data.Length==N0
requires CurCmd.Length==N0

requires ExGntd.Length==N0
requires MemData.Length==N0
requires ShrSet.Length==N0
requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan3_Cmd.Length&&0<=j<Chan3_Cmd.Length==>Chan3_Cmd[i]!=Chan3_Cmd[j]

requires forall i,j::0<=i<Chan3_Data.Length&&0<=j<Chan3_Data.Length==>Chan3_Data[i]!=Chan3_Data[j]
requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<MemData.Length&&0<=j<MemData.Length==>MemData[i]!=MemData[j]
requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]
requires 0<=i<N0
requires  p__Inv4<N0
requires i==p__Inv4
requires (ExGntd[0] == true)//branch
requires ((Chan3_Cmd[i] == InvAck) && (!(CurCmd[0] == Empty))) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan3_Cmd
modifies Chan3_Data
modifies ExGntd
modifies MemData
modifies ShrSet

{
  Chan3_Cmd[i] := Empty;
  ShrSet[i] := false;
  if (ExGntd[0] == true) {
    ExGntd[0] := false;
    MemData[0] := Chan3_Data[i];
  }
}

method n_RecvInvAckinv__39_1(Cache_State:array<CACHE_STATE>,   Chan3_Cmd:array<MSG_CMD>,  Chan3_Data:array<DATA>, CurCmd:array<MSG_CMD>,  ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan3_Cmd.Length==N0

requires Chan3_Data.Length==N0
requires CurCmd.Length==N0

requires ExGntd.Length==N0
requires MemData.Length==N0
requires ShrSet.Length==N0
requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan3_Cmd.Length&&0<=j<Chan3_Cmd.Length==>Chan3_Cmd[i]!=Chan3_Cmd[j]

requires forall i,j::0<=i<Chan3_Data.Length&&0<=j<Chan3_Data.Length==>Chan3_Data[i]!=Chan3_Data[j]
requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<MemData.Length&&0<=j<MemData.Length==>MemData[i]!=MemData[j]
requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]
requires 0<=i<N0
requires  p__Inv4<N0
requires i==p__Inv4
requires (!(ExGntd[0] == true))//branch
requires ((Chan3_Cmd[i] == InvAck) && (!(CurCmd[0] == Empty))) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan3_Cmd
modifies Chan3_Data
modifies ExGntd
modifies MemData
modifies ShrSet

{
  Chan3_Cmd[i] := Empty;
  ShrSet[i] := false;
  if (ExGntd[0] == true) {
    ExGntd[0] := false;
    MemData[0] := Chan3_Data[i];
  }
}

method n_RecvInvAckinv__39_2(Cache_State:array<CACHE_STATE>,   Chan3_Cmd:array<MSG_CMD>,  Chan3_Data:array<DATA>, CurCmd:array<MSG_CMD>,  ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan3_Cmd.Length==N0

requires Chan3_Data.Length==N0
requires CurCmd.Length==N0

requires ExGntd.Length==N0
requires MemData.Length==N0
requires ShrSet.Length==N0
requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan3_Cmd.Length&&0<=j<Chan3_Cmd.Length==>Chan3_Cmd[i]!=Chan3_Cmd[j]

requires forall i,j::0<=i<Chan3_Data.Length&&0<=j<Chan3_Data.Length==>Chan3_Data[i]!=Chan3_Data[j]
requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<MemData.Length&&0<=j<MemData.Length==>MemData[i]!=MemData[j]
requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]
requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (ExGntd[0] == true)//branch
requires ((Chan3_Cmd[i] == InvAck) && (!(CurCmd[0] == Empty))) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan3_Cmd
modifies Chan3_Data
modifies ExGntd
modifies MemData
modifies ShrSet

{
  Chan3_Cmd[i] := Empty;
  ShrSet[i] := false;
  if (ExGntd[0] == true) {
    ExGntd[0] := false;
    MemData[0] := Chan3_Data[i];
  }
}

method n_RecvInvAckinv__39_3(Cache_State:array<CACHE_STATE>,   Chan3_Cmd:array<MSG_CMD>,  Chan3_Data:array<DATA>, CurCmd:array<MSG_CMD>,  ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan3_Cmd.Length==N0

requires Chan3_Data.Length==N0
requires CurCmd.Length==N0

requires ExGntd.Length==N0
requires MemData.Length==N0
requires ShrSet.Length==N0
requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan3_Cmd.Length&&0<=j<Chan3_Cmd.Length==>Chan3_Cmd[i]!=Chan3_Cmd[j]

requires forall i,j::0<=i<Chan3_Data.Length&&0<=j<Chan3_Data.Length==>Chan3_Data[i]!=Chan3_Data[j]
requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<MemData.Length&&0<=j<MemData.Length==>MemData[i]!=MemData[j]
requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]
requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!(ExGntd[0] == true))//branch
requires ((Chan3_Cmd[i] == InvAck) && (!(CurCmd[0] == Empty))) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan3_Cmd
modifies Chan3_Data
modifies ExGntd
modifies MemData
modifies ShrSet

{
  Chan3_Cmd[i] := Empty;
  ShrSet[i] := false;
  if (ExGntd[0] == true) {
    ExGntd[0] := false;
    MemData[0] := Chan3_Data[i];
  }
}

method n_RecvInvAckinv__39_4(Cache_State:array<CACHE_STATE>,   Chan3_Cmd:array<MSG_CMD>,  Chan3_Data:array<DATA>, CurCmd:array<MSG_CMD>,  ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan3_Cmd.Length==N0

requires Chan3_Data.Length==N0
requires CurCmd.Length==N0

requires ExGntd.Length==N0
requires MemData.Length==N0
requires ShrSet.Length==N0
requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan3_Cmd.Length&&0<=j<Chan3_Cmd.Length==>Chan3_Cmd[i]!=Chan3_Cmd[j]

requires forall i,j::0<=i<Chan3_Data.Length&&0<=j<Chan3_Data.Length==>Chan3_Data[i]!=Chan3_Data[j]
requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<MemData.Length&&0<=j<MemData.Length==>MemData[i]!=MemData[j]
requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]
requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (ExGntd[0] == true)//branch
requires ((Chan3_Cmd[i] == InvAck) && (!(CurCmd[0] == Empty))) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan3_Cmd
modifies Chan3_Data
modifies ExGntd
modifies MemData
modifies ShrSet

{
  Chan3_Cmd[i] := Empty;
  ShrSet[i] := false;
  if (ExGntd[0] == true) {
    ExGntd[0] := false;
    MemData[0] := Chan3_Data[i];
  }
}

method n_RecvInvAckinv__39_5(Cache_State:array<CACHE_STATE>,   Chan3_Cmd:array<MSG_CMD>,  Chan3_Data:array<DATA>, CurCmd:array<MSG_CMD>,  ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan3_Cmd.Length==N0

requires Chan3_Data.Length==N0
requires CurCmd.Length==N0

requires ExGntd.Length==N0
requires MemData.Length==N0
requires ShrSet.Length==N0
requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan3_Cmd.Length&&0<=j<Chan3_Cmd.Length==>Chan3_Cmd[i]!=Chan3_Cmd[j]

requires forall i,j::0<=i<Chan3_Data.Length&&0<=j<Chan3_Data.Length==>Chan3_Data[i]!=Chan3_Data[j]
requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<MemData.Length&&0<=j<MemData.Length==>MemData[i]!=MemData[j]
requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]
requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!(ExGntd[0] == true))//branch
requires ((Chan3_Cmd[i] == InvAck) && (!(CurCmd[0] == Empty))) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan3_Cmd
modifies Chan3_Data
modifies ExGntd
modifies MemData
modifies ShrSet

{
  Chan3_Cmd[i] := Empty;
  ShrSet[i] := false;
  if (ExGntd[0] == true) {
    ExGntd[0] := false;
    MemData[0] := Chan3_Data[i];
  }
}

method n_RecvInvAckinv__39_6(Cache_State:array<CACHE_STATE>,   Chan3_Cmd:array<MSG_CMD>,  Chan3_Data:array<DATA>, CurCmd:array<MSG_CMD>,  ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan3_Cmd.Length==N0

requires Chan3_Data.Length==N0
requires CurCmd.Length==N0

requires ExGntd.Length==N0
requires MemData.Length==N0
requires ShrSet.Length==N0
requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan3_Cmd.Length&&0<=j<Chan3_Cmd.Length==>Chan3_Cmd[i]!=Chan3_Cmd[j]

requires forall i,j::0<=i<Chan3_Data.Length&&0<=j<Chan3_Data.Length==>Chan3_Data[i]!=Chan3_Data[j]
requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<MemData.Length&&0<=j<MemData.Length==>MemData[i]!=MemData[j]
requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]
requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (ExGntd[0] == true)//branch
requires ((Chan3_Cmd[i] == InvAck) && (!(CurCmd[0] == Empty))) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan3_Cmd
modifies Chan3_Data
modifies ExGntd
modifies MemData
modifies ShrSet

{
  Chan3_Cmd[i] := Empty;
  ShrSet[i] := false;
  if (ExGntd[0] == true) {
    ExGntd[0] := false;
    MemData[0] := Chan3_Data[i];
  }
}

method n_RecvInvAckinv__39_7(Cache_State:array<CACHE_STATE>,   Chan3_Cmd:array<MSG_CMD>,  Chan3_Data:array<DATA>, CurCmd:array<MSG_CMD>,  ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan3_Cmd.Length==N0

requires Chan3_Data.Length==N0
requires CurCmd.Length==N0

requires ExGntd.Length==N0
requires MemData.Length==N0
requires ShrSet.Length==N0
requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan3_Cmd.Length&&0<=j<Chan3_Cmd.Length==>Chan3_Cmd[i]!=Chan3_Cmd[j]

requires forall i,j::0<=i<Chan3_Data.Length&&0<=j<Chan3_Data.Length==>Chan3_Data[i]!=Chan3_Data[j]
requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<MemData.Length&&0<=j<MemData.Length==>MemData[i]!=MemData[j]
requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]
requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!(ExGntd[0] == true))//branch
requires ((Chan3_Cmd[i] == InvAck) && (!(CurCmd[0] == Empty))) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan3_Cmd
modifies Chan3_Data
modifies ExGntd
modifies MemData
modifies ShrSet

{
  Chan3_Cmd[i] := Empty;
  ShrSet[i] := false;
  if (ExGntd[0] == true) {
    ExGntd[0] := false;
    MemData[0] := Chan3_Data[i];
  }
}

method n_RecvInvAckinv__39_8(Cache_State:array<CACHE_STATE>,   Chan3_Cmd:array<MSG_CMD>,  Chan3_Data:array<DATA>, CurCmd:array<MSG_CMD>,  ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan3_Cmd.Length==N0

requires Chan3_Data.Length==N0
requires CurCmd.Length==N0

requires ExGntd.Length==N0
requires MemData.Length==N0
requires ShrSet.Length==N0
requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan3_Cmd.Length&&0<=j<Chan3_Cmd.Length==>Chan3_Cmd[i]!=Chan3_Cmd[j]

requires forall i,j::0<=i<Chan3_Data.Length&&0<=j<Chan3_Data.Length==>Chan3_Data[i]!=Chan3_Data[j]
requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<MemData.Length&&0<=j<MemData.Length==>MemData[i]!=MemData[j]
requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]
requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (ExGntd[0] == true)//branch
requires ((Chan3_Cmd[i] == InvAck) && (!(CurCmd[0] == Empty))) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan3_Cmd
modifies Chan3_Data
modifies ExGntd
modifies MemData
modifies ShrSet

{
  Chan3_Cmd[i] := Empty;
  ShrSet[i] := false;
  if (ExGntd[0] == true) {
    ExGntd[0] := false;
    MemData[0] := Chan3_Data[i];
  }
}

method n_RecvInvAckinv__39_9(Cache_State:array<CACHE_STATE>,   Chan3_Cmd:array<MSG_CMD>,  Chan3_Data:array<DATA>, CurCmd:array<MSG_CMD>,  ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan3_Cmd.Length==N0

requires Chan3_Data.Length==N0
requires CurCmd.Length==N0

requires ExGntd.Length==N0
requires MemData.Length==N0
requires ShrSet.Length==N0
requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan3_Cmd.Length&&0<=j<Chan3_Cmd.Length==>Chan3_Cmd[i]!=Chan3_Cmd[j]

requires forall i,j::0<=i<Chan3_Data.Length&&0<=j<Chan3_Data.Length==>Chan3_Data[i]!=Chan3_Data[j]
requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<MemData.Length&&0<=j<MemData.Length==>MemData[i]!=MemData[j]
requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]
requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!(ExGntd[0] == true))//branch
requires ((Chan3_Cmd[i] == InvAck) && (!(CurCmd[0] == Empty))) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan3_Cmd
modifies Chan3_Data
modifies ExGntd
modifies MemData
modifies ShrSet

{
  Chan3_Cmd[i] := Empty;
  ShrSet[i] := false;
  if (ExGntd[0] == true) {
    ExGntd[0] := false;
    MemData[0] := Chan3_Data[i];
  }
}


method n_SendGntEinv__39_0(Cache_State:array<CACHE_STATE>,   Chan2_Cmd:array<MSG_CMD>,  Chan2_Data:array<DATA>, CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,     
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan2_Cmd.Length==N0

requires Chan2_Data.Length==N0
requires CurCmd.Length==N0

requires CurPtr.Length==N0
requires ExGntd.Length==N0
requires MemData.Length==N0
requires ShrSet.Length==N0





requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]

requires forall i,j::0<=i<Chan2_Data.Length&&0<=j<Chan2_Data.Length==>Chan2_Data[i]!=Chan2_Data[j]
requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<CurPtr.Length&&0<=j<CurPtr.Length==>CurPtr[i]!=CurPtr[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<MemData.Length&&0<=j<MemData.Length==>MemData[i]!=MemData[j]
requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]





requires 0<=i<N0
requires  p__Inv4<N0
requires i==p__Inv4
requires (!((ShrSet[p__Inv4] == false) && (!(Cache_State[p__Inv4] == I))))//3
requires ((Chan2_Cmd[i] == Empty) && (CurCmd[0] == ReqE) && (CurPtr[0] == i) && (ExGntd[0] == false) && (forall j  |0<= j<N0 :: (ShrSet[j] == false) )) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan2_Cmd
modifies Chan2_Data
modifies CurCmd
modifies ExGntd
modifies MemData
modifies ShrSet

{
  Chan2_Cmd[i] := GntE;
  Chan2_Data[i] := MemData[0];
  ShrSet[i] := true;
  ExGntd[0] := true;
  CurCmd[0] := Empty;
}

method n_SendGntEinv__39_1(Cache_State:array<CACHE_STATE>,   Chan2_Cmd:array<MSG_CMD>,  Chan2_Data:array<DATA>, CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,     
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan2_Cmd.Length==N0

requires Chan2_Data.Length==N0
requires CurCmd.Length==N0

requires CurPtr.Length==N0
requires ExGntd.Length==N0
requires MemData.Length==N0
requires ShrSet.Length==N0





requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]

requires forall i,j::0<=i<Chan2_Data.Length&&0<=j<Chan2_Data.Length==>Chan2_Data[i]!=Chan2_Data[j]
requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<CurPtr.Length&&0<=j<CurPtr.Length==>CurPtr[i]!=CurPtr[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<MemData.Length&&0<=j<MemData.Length==>MemData[i]!=MemData[j]
requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]





requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((ShrSet[p__Inv4] == false) && (!(Cache_State[p__Inv4] == I))))//3
requires ((Chan2_Cmd[i] == Empty) && (CurCmd[0] == ReqE) && (CurPtr[0] == i) && (ExGntd[0] == false) && (forall j  |0<= j<N0 :: (ShrSet[j] == false) )) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan2_Cmd
modifies Chan2_Data
modifies CurCmd
modifies ExGntd
modifies MemData
modifies ShrSet

{
  Chan2_Cmd[i] := GntE;
  Chan2_Data[i] := MemData[0];
  ShrSet[i] := true;
  ExGntd[0] := true;
  CurCmd[0] := Empty;
}

method n_SendGntEinv__39_2(Cache_State:array<CACHE_STATE>,   Chan2_Cmd:array<MSG_CMD>,  Chan2_Data:array<DATA>, CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,     
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan2_Cmd.Length==N0

requires Chan2_Data.Length==N0
requires CurCmd.Length==N0

requires CurPtr.Length==N0
requires ExGntd.Length==N0
requires MemData.Length==N0
requires ShrSet.Length==N0





requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]

requires forall i,j::0<=i<Chan2_Data.Length&&0<=j<Chan2_Data.Length==>Chan2_Data[i]!=Chan2_Data[j]
requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<CurPtr.Length&&0<=j<CurPtr.Length==>CurPtr[i]!=CurPtr[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<MemData.Length&&0<=j<MemData.Length==>MemData[i]!=MemData[j]
requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]





requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((ShrSet[p__Inv4] == false) && (!(Cache_State[p__Inv4] == I))))//3
requires ((Chan2_Cmd[i] == Empty) && (CurCmd[0] == ReqE) && (CurPtr[0] == i) && (ExGntd[0] == false) && (forall j  |0<= j<N0 :: (ShrSet[j] == false) )) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan2_Cmd
modifies Chan2_Data
modifies CurCmd
modifies ExGntd
modifies MemData
modifies ShrSet

{
  Chan2_Cmd[i] := GntE;
  Chan2_Data[i] := MemData[0];
  ShrSet[i] := true;
  ExGntd[0] := true;
  CurCmd[0] := Empty;
}

method n_SendGntEinv__39_3(Cache_State:array<CACHE_STATE>,   Chan2_Cmd:array<MSG_CMD>,  Chan2_Data:array<DATA>, CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,     
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan2_Cmd.Length==N0

requires Chan2_Data.Length==N0
requires CurCmd.Length==N0

requires CurPtr.Length==N0
requires ExGntd.Length==N0
requires MemData.Length==N0
requires ShrSet.Length==N0





requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]

requires forall i,j::0<=i<Chan2_Data.Length&&0<=j<Chan2_Data.Length==>Chan2_Data[i]!=Chan2_Data[j]
requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<CurPtr.Length&&0<=j<CurPtr.Length==>CurPtr[i]!=CurPtr[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<MemData.Length&&0<=j<MemData.Length==>MemData[i]!=MemData[j]
requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]





requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((ShrSet[p__Inv4] == false) && (!(Cache_State[p__Inv4] == I))))//3
requires ((Chan2_Cmd[i] == Empty) && (CurCmd[0] == ReqE) && (CurPtr[0] == i) && (ExGntd[0] == false) && (forall j  |0<= j<N0 :: (ShrSet[j] == false) )) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan2_Cmd
modifies Chan2_Data
modifies CurCmd
modifies ExGntd
modifies MemData
modifies ShrSet

{
  Chan2_Cmd[i] := GntE;
  Chan2_Data[i] := MemData[0];
  ShrSet[i] := true;
  ExGntd[0] := true;
  CurCmd[0] := Empty;
}

method n_SendGntEinv__39_4(Cache_State:array<CACHE_STATE>,   Chan2_Cmd:array<MSG_CMD>,  Chan2_Data:array<DATA>, CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,     
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan2_Cmd.Length==N0

requires Chan2_Data.Length==N0
requires CurCmd.Length==N0

requires CurPtr.Length==N0
requires ExGntd.Length==N0
requires MemData.Length==N0
requires ShrSet.Length==N0





requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]

requires forall i,j::0<=i<Chan2_Data.Length&&0<=j<Chan2_Data.Length==>Chan2_Data[i]!=Chan2_Data[j]
requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<CurPtr.Length&&0<=j<CurPtr.Length==>CurPtr[i]!=CurPtr[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<MemData.Length&&0<=j<MemData.Length==>MemData[i]!=MemData[j]
requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]





requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((ShrSet[p__Inv4] == false) && (!(Cache_State[p__Inv4] == I))))//3
requires ((Chan2_Cmd[i] == Empty) && (CurCmd[0] == ReqE) && (CurPtr[0] == i) && (ExGntd[0] == false) && (forall j  |0<= j<N0 :: (ShrSet[j] == false) )) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan2_Cmd
modifies Chan2_Data
modifies CurCmd
modifies ExGntd
modifies MemData
modifies ShrSet

{
  Chan2_Cmd[i] := GntE;
  Chan2_Data[i] := MemData[0];
  ShrSet[i] := true;
  ExGntd[0] := true;
  CurCmd[0] := Empty;
}


method n_RecvGntSinv__39_0(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>,  Chan2_Cmd:array<MSG_CMD>, Chan2_Data:array<DATA>, ExGntd:array<boolean>, 
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_Data.Length==N0


requires Cache_State.Length==N0

requires Chan2_Cmd.Length==N0
requires Chan2_Data.Length==N0
requires ExGntd.Length==N0

requires forall i,j::0<=i<Cache_Data.Length&&0<=j<Cache_Data.Length==>Cache_Data[i]!=Cache_Data[j]


requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]

requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]
requires forall i,j::0<=i<Chan2_Data.Length&&0<=j<Chan2_Data.Length==>Chan2_Data[i]!=Chan2_Data[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]

requires 0<=i<N0
requires  p__Inv4<N0
requires i==p__Inv4
requires (!((Chan2_Cmd[p__Inv4] == GntS) && (ExGntd[0] == true)))//3
requires (Chan2_Cmd[i] == GntS) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Cache_Data
modifies Cache_State
modifies Chan2_Cmd
modifies Chan2_Data

{
  Cache_State[i] := S;
  Cache_Data[i] := Chan2_Data[i];
  Chan2_Cmd[i] := Empty;
}

method n_RecvGntSinv__39_1(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>,  Chan2_Cmd:array<MSG_CMD>, Chan2_Data:array<DATA>, ExGntd:array<boolean>, 
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_Data.Length==N0


requires Cache_State.Length==N0

requires Chan2_Cmd.Length==N0
requires Chan2_Data.Length==N0
requires ExGntd.Length==N0

requires forall i,j::0<=i<Cache_Data.Length&&0<=j<Cache_Data.Length==>Cache_Data[i]!=Cache_Data[j]


requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]

requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]
requires forall i,j::0<=i<Chan2_Data.Length&&0<=j<Chan2_Data.Length==>Chan2_Data[i]!=Chan2_Data[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]

requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//2
requires (Chan2_Cmd[i] == GntS) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Cache_Data
modifies Cache_State
modifies Chan2_Cmd
modifies Chan2_Data

{
  Cache_State[i] := S;
  Cache_Data[i] := Chan2_Data[i];
  Chan2_Cmd[i] := Empty;
}

method n_RecvGntSinv__39_2(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>,  Chan2_Cmd:array<MSG_CMD>, Chan2_Data:array<DATA>, ExGntd:array<boolean>, 
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_Data.Length==N0


requires Cache_State.Length==N0

requires Chan2_Cmd.Length==N0
requires Chan2_Data.Length==N0
requires ExGntd.Length==N0

requires forall i,j::0<=i<Cache_Data.Length&&0<=j<Cache_Data.Length==>Cache_Data[i]!=Cache_Data[j]


requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]

requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]
requires forall i,j::0<=i<Chan2_Data.Length&&0<=j<Chan2_Data.Length==>Chan2_Data[i]!=Chan2_Data[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]

requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//2
requires (Chan2_Cmd[i] == GntS) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Cache_Data
modifies Cache_State
modifies Chan2_Cmd
modifies Chan2_Data

{
  Cache_State[i] := S;
  Cache_Data[i] := Chan2_Data[i];
  Chan2_Cmd[i] := Empty;
}

method n_RecvGntSinv__39_3(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>,  Chan2_Cmd:array<MSG_CMD>, Chan2_Data:array<DATA>, ExGntd:array<boolean>, 
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_Data.Length==N0


requires Cache_State.Length==N0

requires Chan2_Cmd.Length==N0
requires Chan2_Data.Length==N0
requires ExGntd.Length==N0

requires forall i,j::0<=i<Cache_Data.Length&&0<=j<Cache_Data.Length==>Cache_Data[i]!=Cache_Data[j]


requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]

requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]
requires forall i,j::0<=i<Chan2_Data.Length&&0<=j<Chan2_Data.Length==>Chan2_Data[i]!=Chan2_Data[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]

requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//2
requires (Chan2_Cmd[i] == GntS) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Cache_Data
modifies Cache_State
modifies Chan2_Cmd
modifies Chan2_Data

{
  Cache_State[i] := S;
  Cache_Data[i] := Chan2_Data[i];
  Chan2_Cmd[i] := Empty;
}

method n_RecvGntSinv__39_4(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>,  Chan2_Cmd:array<MSG_CMD>, Chan2_Data:array<DATA>, ExGntd:array<boolean>, 
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_Data.Length==N0


requires Cache_State.Length==N0

requires Chan2_Cmd.Length==N0
requires Chan2_Data.Length==N0
requires ExGntd.Length==N0

requires forall i,j::0<=i<Cache_Data.Length&&0<=j<Cache_Data.Length==>Cache_Data[i]!=Cache_Data[j]


requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]

requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]
requires forall i,j::0<=i<Chan2_Data.Length&&0<=j<Chan2_Data.Length==>Chan2_Data[i]!=Chan2_Data[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]

requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//2
requires (Chan2_Cmd[i] == GntS) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Cache_Data
modifies Cache_State
modifies Chan2_Cmd
modifies Chan2_Data

{
  Cache_State[i] := S;
  Cache_Data[i] := Chan2_Data[i];
  Chan2_Cmd[i] := Empty;
}


method n_RecvGntEinv__39_0(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>,  Chan2_Cmd:array<MSG_CMD>, Chan2_Data:array<DATA>, ExGntd:array<boolean>, 
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_Data.Length==N0


requires Cache_State.Length==N0

requires Chan2_Cmd.Length==N0
requires Chan2_Data.Length==N0
requires ExGntd.Length==N0

requires forall i,j::0<=i<Cache_Data.Length&&0<=j<Cache_Data.Length==>Cache_Data[i]!=Cache_Data[j]


requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]

requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]
requires forall i,j::0<=i<Chan2_Data.Length&&0<=j<Chan2_Data.Length==>Chan2_Data[i]!=Chan2_Data[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]

requires 0<=i<N0
requires  p__Inv4<N0
requires i==p__Inv4
//1
requires (Chan2_Cmd[i] == GntE) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Cache_Data
modifies Cache_State
modifies Chan2_Cmd
modifies Chan2_Data

{
  Cache_State[i] := E;
  Cache_Data[i] := Chan2_Data[i];
  Chan2_Cmd[i] := Empty;
}

method n_RecvGntEinv__39_1(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>,  Chan2_Cmd:array<MSG_CMD>, Chan2_Data:array<DATA>, ExGntd:array<boolean>, 
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_Data.Length==N0


requires Cache_State.Length==N0

requires Chan2_Cmd.Length==N0
requires Chan2_Data.Length==N0
requires ExGntd.Length==N0

requires forall i,j::0<=i<Cache_Data.Length&&0<=j<Cache_Data.Length==>Cache_Data[i]!=Cache_Data[j]


requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]

requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]
requires forall i,j::0<=i<Chan2_Data.Length&&0<=j<Chan2_Data.Length==>Chan2_Data[i]!=Chan2_Data[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]

requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//2
requires (Chan2_Cmd[i] == GntE) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Cache_Data
modifies Cache_State
modifies Chan2_Cmd
modifies Chan2_Data

{
  Cache_State[i] := E;
  Cache_Data[i] := Chan2_Data[i];
  Chan2_Cmd[i] := Empty;
}

method n_RecvGntEinv__39_2(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>,  Chan2_Cmd:array<MSG_CMD>, Chan2_Data:array<DATA>, ExGntd:array<boolean>, 
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_Data.Length==N0


requires Cache_State.Length==N0

requires Chan2_Cmd.Length==N0
requires Chan2_Data.Length==N0
requires ExGntd.Length==N0

requires forall i,j::0<=i<Cache_Data.Length&&0<=j<Cache_Data.Length==>Cache_Data[i]!=Cache_Data[j]


requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]

requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]
requires forall i,j::0<=i<Chan2_Data.Length&&0<=j<Chan2_Data.Length==>Chan2_Data[i]!=Chan2_Data[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]

requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//2
requires (Chan2_Cmd[i] == GntE) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Cache_Data
modifies Cache_State
modifies Chan2_Cmd
modifies Chan2_Data

{
  Cache_State[i] := E;
  Cache_Data[i] := Chan2_Data[i];
  Chan2_Cmd[i] := Empty;
}

method n_RecvGntEinv__39_3(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>,  Chan2_Cmd:array<MSG_CMD>, Chan2_Data:array<DATA>, ExGntd:array<boolean>, 
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_Data.Length==N0


requires Cache_State.Length==N0

requires Chan2_Cmd.Length==N0
requires Chan2_Data.Length==N0
requires ExGntd.Length==N0

requires forall i,j::0<=i<Cache_Data.Length&&0<=j<Cache_Data.Length==>Cache_Data[i]!=Cache_Data[j]


requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]

requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]
requires forall i,j::0<=i<Chan2_Data.Length&&0<=j<Chan2_Data.Length==>Chan2_Data[i]!=Chan2_Data[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]

requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//2
requires (Chan2_Cmd[i] == GntE) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Cache_Data
modifies Cache_State
modifies Chan2_Cmd
modifies Chan2_Data

{
  Cache_State[i] := E;
  Cache_Data[i] := Chan2_Data[i];
  Chan2_Cmd[i] := Empty;
}

method n_RecvGntEinv__39_4(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>,  Chan2_Cmd:array<MSG_CMD>, Chan2_Data:array<DATA>, ExGntd:array<boolean>, 
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_Data.Length==N0


requires Cache_State.Length==N0

requires Chan2_Cmd.Length==N0
requires Chan2_Data.Length==N0
requires ExGntd.Length==N0

requires forall i,j::0<=i<Cache_Data.Length&&0<=j<Cache_Data.Length==>Cache_Data[i]!=Cache_Data[j]


requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]

requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]
requires forall i,j::0<=i<Chan2_Data.Length&&0<=j<Chan2_Data.Length==>Chan2_Data[i]!=Chan2_Data[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]

requires 0<=i<N0
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//2
requires (Chan2_Cmd[i] == GntE) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Cache_Data
modifies Cache_State
modifies Chan2_Cmd
modifies Chan2_Data

{
  Cache_State[i] := E;
  Cache_Data[i] := Chan2_Data[i];
  Chan2_Cmd[i] := Empty;
}


method n_Storeinv__39_0(AuxData:array<DATA>,   Cache_Data:array<DATA>,  Cache_State:array<CACHE_STATE>,  ExGntd:array<boolean>,
N0:nat,i:nat,d:nat,N1:nat,
p__Inv4:nat)
requires N0>0
requires N1>0

requires AuxData.Length==N0


requires Cache_Data.Length==N0

requires Cache_State.Length==N0

requires ExGntd.Length==N0
requires forall i,j::0<=i<AuxData.Length&&0<=j<AuxData.Length==>AuxData[i]!=AuxData[j]


requires forall i,j::0<=i<Cache_Data.Length&&0<=j<Cache_Data.Length==>Cache_Data[i]!=Cache_Data[j]

requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]

requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires 0<=i<N0
requires 0<=d<N1
requires  p__Inv4<N0
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//statement has nothing with prop--it guranttee itself

requires (Cache_State[i] == E) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies AuxData
modifies Cache_Data

{
  Cache_Data[i] := d;
  AuxData[0] := d;
}


method n_SendGntSinv__39_0(Cache_State:array<CACHE_STATE>,   Chan2_Cmd:array<MSG_CMD>,  Chan2_Data:array<DATA>, CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan2_Cmd.Length==N0

requires Chan2_Data.Length==N0
requires CurCmd.Length==N0

requires CurPtr.Length==N0
requires ExGntd.Length==N0
requires MemData.Length==N0
requires ShrSet.Length==N0
requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]

requires forall i,j::0<=i<Chan2_Data.Length&&0<=j<Chan2_Data.Length==>Chan2_Data[i]!=Chan2_Data[j]
requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<CurPtr.Length&&0<=j<CurPtr.Length==>CurPtr[i]!=CurPtr[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<MemData.Length&&0<=j<MemData.Length==>MemData[i]!=MemData[j]
requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]
requires 0<=i<N0
requires  p__Inv4<N0
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//statement has nothing with prop--it guranttee itself

requires ((Chan2_Cmd[i] == Empty) && (CurCmd[0] == ReqS) && (CurPtr[0] == i) && (ExGntd[0] == false)) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan2_Cmd
modifies Chan2_Data
modifies CurCmd
modifies MemData
modifies ShrSet

{
  Chan2_Cmd[i] := GntS;
  Chan2_Data[i] := MemData[0];
  ShrSet[i] := true;
  CurCmd[0] := Empty;
}


method n_RecvReqE__part__0inv__39_0(Cache_State:array<CACHE_STATE>,    CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, ExGntd:array<boolean>, InvSet:array<boolean>,  ShrSet:array<boolean>,
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0



requires CurCmd.Length==N0

requires CurPtr.Length==N0
requires ExGntd.Length==N0
requires InvSet.Length==N0

requires ShrSet.Length==N0
requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]



requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<CurPtr.Length&&0<=j<CurPtr.Length==>CurPtr[i]!=CurPtr[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<InvSet.Length&&0<=j<InvSet.Length==>InvSet[i]!=InvSet[j]

requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]
requires 0<=i<N0
requires  p__Inv4<N0
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//statement has nothing with prop--it guranttee itself

requires ((CurCmd[0] == Empty) && (Cache_State[i] == I)) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies CurCmd
modifies CurPtr
modifies InvSet
modifies ShrSet

{
  CurCmd[0] := ReqE;
  CurPtr[0] := i;
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    InvSet[j] := ShrSet[j];
  
 j:=j+1;
}
}


method n_SendInv__part__0inv__39_0(Cache_State:array<CACHE_STATE>,   Chan2_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,  ExGntd:array<boolean>, InvSet:array<boolean>,
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan2_Cmd.Length==N0

requires CurCmd.Length==N0

requires ExGntd.Length==N0
requires InvSet.Length==N0
requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]

requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<InvSet.Length&&0<=j<InvSet.Length==>InvSet[i]!=InvSet[j]
requires 0<=i<N0
requires  p__Inv4<N0
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//statement has nothing with prop--it guranttee itself

requires ((Chan2_Cmd[i] == Empty) && (InvSet[i] == true) && (CurCmd[0] == ReqE)) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan2_Cmd
modifies InvSet

{
  Chan2_Cmd[i] := Inv;
  InvSet[i] := false;
}


method n_SendInv__part__1inv__39_0(Cache_State:array<CACHE_STATE>,   Chan2_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,  ExGntd:array<boolean>, InvSet:array<boolean>,
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0


requires Chan2_Cmd.Length==N0

requires CurCmd.Length==N0

requires ExGntd.Length==N0
requires InvSet.Length==N0
requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]


requires forall i,j::0<=i<Chan2_Cmd.Length&&0<=j<Chan2_Cmd.Length==>Chan2_Cmd[i]!=Chan2_Cmd[j]

requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<InvSet.Length&&0<=j<InvSet.Length==>InvSet[i]!=InvSet[j]
requires 0<=i<N0
requires  p__Inv4<N0
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//statement has nothing with prop--it guranttee itself

requires ((Chan2_Cmd[i] == Empty) && (InvSet[i] == true) && ((CurCmd[0] == ReqS) && (ExGntd[0] == true))) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies Chan2_Cmd
modifies InvSet

{
  Chan2_Cmd[i] := Inv;
  InvSet[i] := false;
}


method n_RecvReqE__part__1inv__39_0(Cache_State:array<CACHE_STATE>,    CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, ExGntd:array<boolean>, InvSet:array<boolean>,  ShrSet:array<boolean>,
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0



requires CurCmd.Length==N0

requires CurPtr.Length==N0
requires ExGntd.Length==N0
requires InvSet.Length==N0

requires ShrSet.Length==N0
requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]



requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<CurPtr.Length&&0<=j<CurPtr.Length==>CurPtr[i]!=CurPtr[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<InvSet.Length&&0<=j<InvSet.Length==>InvSet[i]!=InvSet[j]

requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]
requires 0<=i<N0
requires  p__Inv4<N0
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//statement has nothing with prop--it guranttee itself

requires ((CurCmd[0] == Empty) && (Cache_State[i] == S)) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies CurCmd
modifies CurPtr
modifies InvSet
modifies ShrSet

{
  CurCmd[0] := ReqE;
  CurPtr[0] := i;
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    InvSet[j] := ShrSet[j];
  
 j:=j+1;
}
}


method n_RecvReqSinv__39_0(Cache_State:array<CACHE_STATE>,    CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, ExGntd:array<boolean>, InvSet:array<boolean>,  ShrSet:array<boolean>,
N0:nat,i:nat,
p__Inv4:nat)
requires N0>0

requires Cache_State.Length==N0



requires CurCmd.Length==N0

requires CurPtr.Length==N0
requires ExGntd.Length==N0
requires InvSet.Length==N0

requires ShrSet.Length==N0
requires forall i,j::0<=i<Cache_State.Length&&0<=j<Cache_State.Length==>Cache_State[i]!=Cache_State[j]



requires forall i,j::0<=i<CurCmd.Length&&0<=j<CurCmd.Length==>CurCmd[i]!=CurCmd[j]

requires forall i,j::0<=i<CurPtr.Length&&0<=j<CurPtr.Length==>CurPtr[i]!=CurPtr[j]
requires forall i,j::0<=i<ExGntd.Length&&0<=j<ExGntd.Length==>ExGntd[i]!=ExGntd[j]
requires forall i,j::0<=i<InvSet.Length&&0<=j<InvSet.Length==>InvSet[i]!=InvSet[j]

requires forall i,j::0<=i<ShrSet.Length&&0<=j<ShrSet.Length==>ShrSet[i]!=ShrSet[j]
requires 0<=i<N0
requires  p__Inv4<N0
requires (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))//statement has nothing with prop--it guranttee itself

requires ((Cache_State[i] == I) && (CurCmd[0] == Empty)) //guard condition
ensures   (!((Cache_State[p__Inv4] == S) && (ExGntd[0] == true)))
modifies CurCmd
modifies CurPtr
modifies InvSet
modifies ShrSet

{
  CurCmd[0] := ReqS;
  CurPtr[0] := i;
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    InvSet[j] := ShrSet[j];
  
 j:=j+1;
}
}


