/******************************
  Program "../examples/asso/n_mutualEx/n_mutualEx3.m" compiled by "Caching Murphi Release 5.4.9.1"

  Murphi Last Compiled date: "Oct 20 2020"
 ******************************/

/********************
  Parameter
 ********************/
#define MURPHI_VERSION "Caching Murphi Release 5.4.9.1"
#define MURPHI_DATE "Oct 20 2020"
#define PROTOCOL_NAME "../examples/asso/n_mutualEx/n_mutualEx3"
#define BITS_IN_WORLD 40
#define ALIGN

/********************
  Include
 ********************/
#include "mu_prolog.hpp"

/********************
  Decl declaration
 ********************/

class mu_1_state: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_state& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_state& val)
  {
    if (val.defined())
      return ( s << mu_1_state::values[ int(val) - 1] );
    else return ( s << "Undefined" );
  };

  mu_1_state (const char *name, int os): mu__byte(1, 4, 3, name, os) {};
  mu_1_state (void): mu__byte(1, 4, 3) {};
  mu_1_state (int val): mu__byte(1, 4, 3, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -1]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print()
  {
    if (defined())
      cout << name << ":" << values[ value() -1] << '\n';
    else
      cout << name << ":Undefined\n";
  };
};

const char *mu_1_state::values[] = {"I","T","C","E",NULL };

/*** end of enum declaration ***/
mu_1_state mu_1_state_undefined_var;

class mu_1_NODE: public mu__byte
{
 public:
  inline int operator=(int val) { return mu__byte::operator=(val); };
  inline int operator=(const mu_1_NODE& val) { return mu__byte::operator=((int) val); };
  mu_1_NODE (const char *name, int os): mu__byte(1, 4, 3, name, os) {};
  mu_1_NODE (void): mu__byte(1, 4, 3) {};
  mu_1_NODE (int val): mu__byte(1, 4, 3, "Parameter or function result.", 0)
  {
    operator=(val);
  };
  char * Name() { return tsprintf("%d",value()); };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
};

/*** end of subrange decl ***/
mu_1_NODE mu_1_NODE_undefined_var;

class mu_1__type_0
{
 public:
  mu_1_state array[ 4 ];
 public:
  char *name;
  char longname[BUFFER_SIZE/4];
  void set_self( const char *n, int os);
  void set_self_2( const char *n, const char *n2, int os);
  void set_self_ar( const char *n, const char *n2, int os);
  mu_1__type_0 (const char *n, int os) { set_self(n, os); };
  mu_1__type_0 ( void ) {};
  virtual ~mu_1__type_0 ();
  mu_1_state& operator[] (int index) /* const */
  {
#ifndef NO_RUN_TIME_CHECKING
    if ( ( index >= 1 ) && ( index <= 4 ) )
      return array[ index - 1 ];
    else {
      if (index==UNDEFVAL) 
	Error.Error("Indexing to %s using an undefined value.", name);
      else
	Error.Error("%d not in index range of %s.", index, name);
      return array[0];
    }
#else
    return array[ index - 1 ];
#endif
  };
  mu_1__type_0& operator= (const mu_1__type_0& from)
  {
    for (int i = 0; i < 4; i++)
      array[i].value(from.array[i].value());
    return *this;
  }

friend int CompareWeight(mu_1__type_0& a, mu_1__type_0& b)
  {
    int w;
    for (int i=0; i<4; i++) {
      w = CompareWeight(a.array[i], b.array[i]);
      if (w!=0) return w;
    }
    return 0;
  }
friend int Compare(mu_1__type_0& a, mu_1__type_0& b)
  {
    int w;
    for (int i=0; i<4; i++) {
      w = Compare(a.array[i], b.array[i]);
      if (w!=0) return w;
    }
    return 0;
  }
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort()
  {
    for (int i=0; i<4; i++)
      array[i].MultisetSort();
  }
  void print_statistic()
  {
    for (int i=0; i<4; i++)
      array[i].print_statistic();
  }
  void clear() { for (int i = 0; i < 4; i++) array[i].clear(); };

  void undefine() { for (int i = 0; i < 4; i++) array[i].undefine(); };

  void reset() { for (int i = 0; i < 4; i++) array[i].reset(); };

  void to_state(state *thestate)
  {
    for (int i = 0; i < 4; i++)
      array[i].to_state(thestate);
  };

  void print()
  {
    for (int i = 0; i < 4; i++)
      array[i].print(); };

  void print_diff(state *prevstate)
  {
    for (int i = 0; i < 4; i++)
      array[i].print_diff(prevstate);
  };
};

  void mu_1__type_0::set_self_ar( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    int l1 = strlen(n1), l2 = strlen(n2);
    strcpy( longname, n1 );
    longname[l1] = '[';
    strcpy( longname+l1+1, n2 );
    longname[l1+l2+1] = ']';
    longname[l1+l2+2] = 0;
    set_self( longname, os );
  };
  void mu_1__type_0::set_self_2( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    strcpy( longname, n1 );
    strcat( longname, n2 );
    set_self( longname, os );
  };
void mu_1__type_0::set_self( const char *n, int os)
{
  char* s;
  name = (char *)n;
  for(int i = 0; i < 4; i++) {
    array[i].set_self_ar(n, s=tsprintf("%d",i + 1), i * 8 + os);
    delete[] s;
  }
};
mu_1__type_0::~mu_1__type_0()
{
}
/*** end array declaration ***/
mu_1__type_0 mu_1__type_0_undefined_var;

const int mu_NODENUMS = 4;
const int mu_I = 1;
const int mu_T = 2;
const int mu_C = 3;
const int mu_E = 4;
/*** Variable declaration ***/
mu_1__type_0 mu_n("n",0);

/*** Variable declaration ***/
mu_0_boolean mu_x("x",32);





/********************
  The world
 ********************/
void world_class::clear()
{
  mu_n.clear();
  mu_x.clear();
}
void world_class::undefine()
{
  mu_n.undefine();
  mu_x.undefine();
}
void world_class::reset()
{
  mu_n.reset();
  mu_x.reset();
}
void world_class::print()
{
  static int num_calls = 0; /* to ward off recursive calls. */
  if ( num_calls == 0 ) {
    num_calls++;
  mu_n.print();
  mu_x.print();
    num_calls--;
}
}
void world_class::print_statistic()
{
  static int num_calls = 0; /* to ward off recursive calls. */
  if ( num_calls == 0 ) {
    num_calls++;
  mu_n.print_statistic();
  mu_x.print_statistic();
    num_calls--;
}
}
void world_class::print_diff( state *prevstate )
{
  if ( prevstate != NULL )
  {
    mu_n.print_diff(prevstate);
    mu_x.print_diff(prevstate);
  }
  else
print();
}
void world_class::to_state(state *newstate)
{
  mu_n.to_state( newstate );
  mu_x.to_state( newstate );
}
void world_class::setstate(state *thestate)
{
}


/********************
  Rule declarations
 ********************/
/******************** RuleBase0 ********************/
class RuleBase0
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_i;
    mu_i.value((r % 4) + 1);
    r = r / 4;
    return tsprintf("Idle, i:%s", mu_i.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_i;
    mu_i.value((r % 4) + 1);
    r = r / 4;
    return (mu_n[mu_i]) == (mu_E);
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 0;
    static mu_1_NODE mu_i;
    mu_i.value((r % 4) + 1);
    r = r / 4;
    while (what_rule < 4 )
      {
	if ( ( TRUE  ) ) {
	      if ((mu_n[mu_i]) == (mu_E)) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 0;
    mu_i.value((r % 4) + 1);
    r = r / 4;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_i;
    mu_i.value((r % 4) + 1);
    r = r / 4;
mu_n[mu_i] = mu_I;
mu_x = mu_true;
  };

};
/******************** RuleBase1 ********************/
class RuleBase1
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_i;
    mu_i.value((r % 4) + 1);
    r = r / 4;
    return tsprintf("Exit, i:%s", mu_i.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_i;
    mu_i.value((r % 4) + 1);
    r = r / 4;
    return (mu_n[mu_i]) == (mu_C);
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 4;
    static mu_1_NODE mu_i;
    mu_i.value((r % 4) + 1);
    r = r / 4;
    while (what_rule < 8 )
      {
	if ( ( TRUE  ) ) {
	      if ((mu_n[mu_i]) == (mu_C)) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 4;
    mu_i.value((r % 4) + 1);
    r = r / 4;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_i;
    mu_i.value((r % 4) + 1);
    r = r / 4;
mu_n[mu_i] = mu_E;
  };

};
/******************** RuleBase2 ********************/
class RuleBase2
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_i;
    mu_i.value((r % 4) + 1);
    r = r / 4;
    return tsprintf("Crit, i:%s", mu_i.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_i;
    mu_i.value((r % 4) + 1);
    r = r / 4;
bool mu__boolexpr1;
  if (!((mu_n[mu_i]) == (mu_T))) mu__boolexpr1 = FALSE ;
  else {
  mu__boolexpr1 = ((mu_x) == (mu_true)) ; 
}
    return mu__boolexpr1;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 8;
    static mu_1_NODE mu_i;
    mu_i.value((r % 4) + 1);
    r = r / 4;
    while (what_rule < 12 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr2;
  if (!((mu_n[mu_i]) == (mu_T))) mu__boolexpr2 = FALSE ;
  else {
  mu__boolexpr2 = ((mu_x) == (mu_true)) ; 
}
	      if (mu__boolexpr2) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 8;
    mu_i.value((r % 4) + 1);
    r = r / 4;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_i;
    mu_i.value((r % 4) + 1);
    r = r / 4;
mu_n[mu_i] = mu_C;
mu_x = mu_false;
  };

};
/******************** RuleBase3 ********************/
class RuleBase3
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_i;
    mu_i.value((r % 4) + 1);
    r = r / 4;
    return tsprintf("Try, i:%s", mu_i.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_i;
    mu_i.value((r % 4) + 1);
    r = r / 4;
    return (mu_n[mu_i]) == (mu_I);
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 12;
    static mu_1_NODE mu_i;
    mu_i.value((r % 4) + 1);
    r = r / 4;
    while (what_rule < 16 )
      {
	if ( ( TRUE  ) ) {
	      if ((mu_n[mu_i]) == (mu_I)) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 12;
    mu_i.value((r % 4) + 1);
    r = r / 4;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_i;
    mu_i.value((r % 4) + 1);
    r = r / 4;
mu_n[mu_i] = mu_T;
  };

};
class NextStateGenerator
{
  RuleBase0 R0;
  RuleBase1 R1;
  RuleBase2 R2;
  RuleBase3 R3;
public:
void SetNextEnabledRule(unsigned & what_rule)
{
  category = CONDITION;
  if (what_rule<4)
    { R0.NextRule(what_rule);
      if (what_rule<4) return; }
  if (what_rule>=4 && what_rule<8)
    { R1.NextRule(what_rule);
      if (what_rule<8) return; }
  if (what_rule>=8 && what_rule<12)
    { R2.NextRule(what_rule);
      if (what_rule<12) return; }
  if (what_rule>=12 && what_rule<16)
    { R3.NextRule(what_rule);
      if (what_rule<16) return; }
}
bool Condition(unsigned r)
{
  category = CONDITION;
  if (r<=3) return R0.Condition(r-0);
  if (r>=4 && r<=7) return R1.Condition(r-4);
  if (r>=8 && r<=11) return R2.Condition(r-8);
  if (r>=12 && r<=15) return R3.Condition(r-12);
Error.Notrace("Internal: NextStateGenerator -- checking condition for nonexisting rule.");
return 0;}
void Code(unsigned r)
{
  if (r<=3) { R0.Code(r-0); return; } 
  if (r>=4 && r<=7) { R1.Code(r-4); return; } 
  if (r>=8 && r<=11) { R2.Code(r-8); return; } 
  if (r>=12 && r<=15) { R3.Code(r-12); return; } 
}
int Priority(unsigned short r)
{
  if (r<=3) { return R0.Priority(); } 
  if (r>=4 && r<=7) { return R1.Priority(); } 
  if (r>=8 && r<=11) { return R2.Priority(); } 
  if (r>=12 && r<=15) { return R3.Priority(); } 
return 0;}
char * Name(unsigned r)
{
  if (r<=3) return R0.Name(r-0);
  if (r>=4 && r<=7) return R1.Name(r-4);
  if (r>=8 && r<=11) return R2.Name(r-8);
  if (r>=12 && r<=15) return R3.Name(r-12);
  return NULL;
}
};
const unsigned numrules = 16;

/********************
  parameter
 ********************/
#define RULES_IN_WORLD 16


/********************
  Startstate records
 ********************/
/******************** StartStateBase0 ********************/
class StartStateBase0
{
public:
  char * Name(unsigned short r)
  {
    return tsprintf("Init");
  }
  void Code(unsigned short r)
  {
{
for(int mu_i = 1; mu_i <= 4; mu_i++) {
mu_n[mu_i] = mu_I;
};
};
mu_x = mu_true;
  };

};
class StartStateGenerator
{
  StartStateBase0 S0;
public:
void Code(unsigned short r)
{
  if (r<=0) { S0.Code(r-0); return; }
}
char * Name(unsigned short r)
{
  if (r<=0) return S0.Name(r-0);
  return NULL;
}
};
const rulerec startstates[] = {
{ NULL, NULL, NULL, FALSE},
};
unsigned short StartStateManager::numstartstates = 1;

/********************
  Invariant records
 ********************/
int mu__invariant_3() // Invariant "rule_2"
{
bool mu__quant4; 
mu__quant4 = TRUE;
{
for(int mu_P2 = 1; mu_P2 <= 4; mu_P2++) {
bool mu__quant5; 
mu__quant5 = TRUE;
{
for(int mu_P1 = 1; mu_P1 <= 4; mu_P1++) {
bool mu__boolexpr6;
  if (!((mu_P2) != (mu_P1))) mu__boolexpr6 = TRUE ;
  else {
bool mu__boolexpr7;
  if (!((mu_n[mu_P1]) == (mu_C))) mu__boolexpr7 = TRUE ;
  else {
  mu__boolexpr7 = ((mu_n[mu_P2]) != (mu_E)) ; 
}
  mu__boolexpr6 = (mu__boolexpr7) ; 
}
if ( !(mu__boolexpr6) )
  { mu__quant5 = FALSE; break; }
};
};
if ( !(mu__quant5) )
  { mu__quant4 = FALSE; break; }
};
};
return mu__quant4;
};

bool mu__condition_8() // Condition for Rule "rule_2"
{
  return mu__invariant_3( );
}

/**** end rule declaration ****/

int mu__invariant_9() // Invariant "mutualEx"
{
bool mu__quant10; 
mu__quant10 = TRUE;
{
for(int mu_i = 1; mu_i <= 4; mu_i++) {
bool mu__quant11; 
mu__quant11 = TRUE;
{
for(int mu_j = 1; mu_j <= 4; mu_j++) {
bool mu__boolexpr12;
  if (!((mu_i) != (mu_j))) mu__boolexpr12 = TRUE ;
  else {
bool mu__boolexpr13;
  if (!((mu_n[mu_i]) == (mu_C))) mu__boolexpr13 = TRUE ;
  else {
  mu__boolexpr13 = ((mu_n[mu_j]) != (mu_C)) ; 
}
  mu__boolexpr12 = (mu__boolexpr13) ; 
}
if ( !(mu__boolexpr12) )
  { mu__quant11 = FALSE; break; }
};
};
if ( !(mu__quant11) )
  { mu__quant10 = FALSE; break; }
};
};
return mu__quant10;
};

bool mu__condition_14() // Condition for Rule "mutualEx"
{
  return mu__invariant_9( );
}

/**** end rule declaration ****/

const rulerec invariants[] = {
{"mutualEx", &mu__condition_14, NULL, },
{"rule_2", &mu__condition_8, NULL, },
};
const unsigned short numinvariants = 2;

/********************
  Normal/Canonicalization for scalarset
 ********************/
/*
n:NoScalarset
x:NoScalarset
*/

/********************
Code for symmetry
 ********************/

/********************
 Permutation Set Class
 ********************/
class PermSet
{
public:
  // book keeping
  enum PresentationType {Simple, Explicit};
  PresentationType Presentation;

  void ResetToSimple();
  void ResetToExplicit();
  void SimpleToExplicit();
  void SimpleToOne();
  bool NextPermutation();

  void Print_in_size()
  { int ret=0; for (int i=0; i<count; i++) if (in[i]) ret++; cout << "in_size:" << ret << "\n"; }


  /********************
   Simple and efficient representation
   ********************/
  bool AlreadyOnlyOneRemain;
  bool MoreThanOneRemain();


  /********************
   Explicit representation
  ********************/
  unsigned long size;
  unsigned long count;
  // in will be of product of factorial sizes for fast canonicalize
  // in will be of size 1 for reduced local memory canonicalize
  bool * in;

  // auxiliary for explicit representation

  // in/perm/revperm will be of factorial size for fast canonicalize
  // they will be of size 1 for reduced local memory canonicalize
  // second range will be size of the scalarset
  // procedure for explicit representation
  // General procedure
  PermSet();
  bool In(int i) const { return in[i]; };
  void Add(int i) { for (int j=0; j<i; j++) in[j] = FALSE;};
  void Remove(int i) { in[i] = FALSE; };
};
bool PermSet::MoreThanOneRemain()
{
  int i,j;
  if (AlreadyOnlyOneRemain)
    return FALSE;
  else {
  }
  AlreadyOnlyOneRemain = TRUE;
  return FALSE;
}
PermSet::PermSet()
: Presentation(Simple)
{
  int i,j,k;
  if (  args->sym_alg.mode == argsym_alg::Exhaustive_Fast_Canonicalize) {

  /********************
   declaration of class variables
  ********************/
  in = new bool[1];

    // Set perm and revperm

    // setting up combination of permutations
    // for different scalarset
    int carry;
    size = 1;
    count = 1;
    for (i=0; i<1; i++)
      {
        carry = 1;
        in[i]= TRUE;
    }
  }
  else
  {

  /********************
   declaration of class variables
  ********************/
  in = new bool[1];
  in[0] = TRUE;
  }
}
void PermSet::ResetToSimple()
{
  int i;

  AlreadyOnlyOneRemain = FALSE;
  Presentation = Simple;
}
void PermSet::ResetToExplicit()
{
  for (int i=0; i<1; i++) in[i] = TRUE;
  Presentation = Explicit;
}
void PermSet::SimpleToExplicit()
{
  int i,j,k;
  int start, class_size;

  // Setup range for mapping

  // To be In or not to be

  // setup explicit representation 
  // Set perm and revperm
  for (i=0; i<1; i++)
    {
      in[i] = TRUE;
    }
  Presentation = Explicit;
  if (args->test_parameter1.value==0) Print_in_size();
}
void PermSet::SimpleToOne()
{
  int i,j,k;
  int class_size;
  int start;


  // Setup range for mapping
  Presentation = Explicit;
}
bool PermSet::NextPermutation()
{
  bool nexted = FALSE;
  int start, end; 
  int class_size;
  int temp;
  int j,k;

  // algorithm
  // for each class
  //   if forall in the same class reverse_sorted, 
  //     { sort again; goto next class }
  //   else
  //     {
  //       nexted = TRUE;
  //       for (j from l to r)
  // 	       if (for all j+ are reversed sorted)
  // 	         {
  // 	           swap j, j+1
  // 	           sort all j+ again
  // 	           break;
  // 	         }
  //     }
if (!nexted) return FALSE;
  return TRUE;
}

/********************
 Symmetry Class
 ********************/
class SymmetryClass
{
  PermSet Perm;
  bool BestInitialized;
  state BestPermutedState;

  // utilities
  void SetBestResult(int i, state* temp);
  void ResetBestResult() {BestInitialized = FALSE;};

public:
  // initializer
  SymmetryClass() : Perm(), BestInitialized(FALSE) {};
  ~SymmetryClass() {};

  void Normalize(state* s);

  void Exhaustive_Fast_Canonicalize(state *s);
  void Heuristic_Fast_Canonicalize(state *s);
  void Heuristic_Small_Mem_Canonicalize(state *s);
  void Heuristic_Fast_Normalize(state *s);

  void MultisetSort(state* s);
};


/********************
 Symmetry Class Members
 ********************/
void SymmetryClass::MultisetSort(state* s)
{
        mu_n.MultisetSort();
        mu_x.MultisetSort();
}
void SymmetryClass::Normalize(state* s)
{
  switch (args->sym_alg.mode) {
  case argsym_alg::Exhaustive_Fast_Canonicalize:
    Exhaustive_Fast_Canonicalize(s);
    break;
  case argsym_alg::Heuristic_Fast_Canonicalize:
    Heuristic_Fast_Canonicalize(s);
    break;
  case argsym_alg::Heuristic_Small_Mem_Canonicalize:
    Heuristic_Small_Mem_Canonicalize(s);
    break;
  case argsym_alg::Heuristic_Fast_Normalize:
    Heuristic_Fast_Normalize(s);
    break;
  default:
    Heuristic_Fast_Canonicalize(s);
  }
}

/********************
 Permute and Canonicalize function for different types
 ********************/
void mu_1_state::Permute(PermSet& Perm, int i) {};
void mu_1_state::SimpleCanonicalize(PermSet& Perm) {};
void mu_1_state::Canonicalize(PermSet& Perm) {};
void mu_1_state::SimpleLimit(PermSet& Perm) {};
void mu_1_state::ArrayLimit(PermSet& Perm) {};
void mu_1_state::Limit(PermSet& Perm) {};
void mu_1_state::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for enum type.\n"); };
void mu_1_NODE::Permute(PermSet& Perm, int i) {};
void mu_1_NODE::SimpleCanonicalize(PermSet& Perm) {};
void mu_1_NODE::Canonicalize(PermSet& Perm) {};
void mu_1_NODE::SimpleLimit(PermSet& Perm) {};
void mu_1_NODE::ArrayLimit(PermSet& Perm) {};
void mu_1_NODE::Limit(PermSet& Perm) {};
void mu_1_NODE::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for subrange type.\n"); };
void mu_1__type_0::Permute(PermSet& Perm, int i)
{
  static mu_1__type_0 temp("Permute_mu_1__type_0",-1);
  int j;
  for (j=0; j<4; j++)
    array[j].Permute(Perm, i);
};
void mu_1__type_0::SimpleCanonicalize(PermSet& Perm)
{ Error.Error("Internal: Simple Canonicalization of Scalarset Array\n"); };
void mu_1__type_0::Canonicalize(PermSet& Perm){};
void mu_1__type_0::SimpleLimit(PermSet& Perm){}
void mu_1__type_0::ArrayLimit(PermSet& Perm) {}
void mu_1__type_0::Limit(PermSet& Perm){}
void mu_1__type_0::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for scalarset array.\n"); };

/********************
 Auxiliary function for error trace printing
 ********************/
bool match(state* ns, StatePtr p)
{
  int i;
  static PermSet Perm;
  static state temp;
  StateCopy(&temp, ns);
  if (args->symmetry_reduction.value)
    {
      if (  args->sym_alg.mode == argsym_alg::Exhaustive_Fast_Canonicalize) {
        Perm.ResetToExplicit();
        for (i=0; i<Perm.count; i++)
          if (Perm.In(i))
            {
              if (ns != workingstate)
                  StateCopy(workingstate, ns);
              
              mu_n.Permute(Perm,i);
              if (args->multiset_reduction.value)
                mu_n.MultisetSort();
              mu_x.Permute(Perm,i);
              if (args->multiset_reduction.value)
                mu_x.MultisetSort();
            if (p.compare(workingstate)) {
              StateCopy(workingstate,&temp); return TRUE; }
          }
        StateCopy(workingstate,&temp);
        return FALSE;
      }
      else {
        Perm.ResetToSimple();
        Perm.SimpleToOne();
        if (ns != workingstate)
          StateCopy(workingstate, ns);

          mu_n.Permute(Perm,0);
          if (args->multiset_reduction.value)
            mu_n.MultisetSort();
          mu_x.Permute(Perm,0);
          if (args->multiset_reduction.value)
            mu_x.MultisetSort();
        if (p.compare(workingstate)) {
          StateCopy(workingstate,&temp); return TRUE; }

        while (Perm.NextPermutation())
          {
            if (ns != workingstate)
              StateCopy(workingstate, ns);
              
              mu_n.Permute(Perm,0);
              if (args->multiset_reduction.value)
                mu_n.MultisetSort();
              mu_x.Permute(Perm,0);
              if (args->multiset_reduction.value)
                mu_x.MultisetSort();
            if (p.compare(workingstate)) {
              StateCopy(workingstate,&temp); return TRUE; }
          }
        StateCopy(workingstate,&temp);
        return FALSE;
      }
    }
  if (!args->symmetry_reduction.value
      && args->multiset_reduction.value)
    {
      if (ns != workingstate)
          StateCopy(workingstate, ns);
      mu_n.MultisetSort();
      mu_x.MultisetSort();
      if (p.compare(workingstate)) {
        StateCopy(workingstate,&temp); return TRUE; }
      StateCopy(workingstate,&temp);
      return FALSE;
    }
  return (p.compare(ns));
}

/********************
 Canonicalization by fast exhaustive generation of
 all permutations
 ********************/
void SymmetryClass::Exhaustive_Fast_Canonicalize(state* s)
{
  int i;
  static state temp;
  Perm.ResetToExplicit();

  StateCopy(&temp, workingstate);
  ResetBestResult();
  for (i=0; i<Perm.count; i++)
    if (Perm.In(i))
      {
        StateCopy(workingstate, &temp);
        mu_n.Permute(Perm,i);
        if (args->multiset_reduction.value)
          mu_n.MultisetSort();
        SetBestResult(i, workingstate);
      }
  StateCopy(workingstate, &BestPermutedState);

  StateCopy(&temp, workingstate);
  ResetBestResult();
  for (i=0; i<Perm.count; i++)
    if (Perm.In(i))
      {
        StateCopy(workingstate, &temp);
        mu_x.Permute(Perm,i);
        if (args->multiset_reduction.value)
          mu_x.MultisetSort();
        SetBestResult(i, workingstate);
      }
  StateCopy(workingstate, &BestPermutedState);

};

/********************
 Canonicalization by fast simple variable canonicalization,
 fast simple scalarset array canonicalization,
 fast restriction on permutation set with simple scalarset array of scalarset,
 and fast exhaustive generation of
 all permutations for other variables
 ********************/
void SymmetryClass::Heuristic_Fast_Canonicalize(state* s)
{
  int i;
  static state temp;

  Perm.ResetToSimple();

};

/********************
 Canonicalization by fast simple variable canonicalization,
 fast simple scalarset array canonicalization,
 fast restriction on permutation set with simple scalarset array of scalarset,
 and fast exhaustive generation of
 all permutations for other variables
 and use less local memory
 ********************/
void SymmetryClass::Heuristic_Small_Mem_Canonicalize(state* s)
{
  unsigned long cycle;
  static state temp;

  Perm.ResetToSimple();

};

/********************
 Normalization by fast simple variable canonicalization,
 fast simple scalarset array canonicalization,
 fast restriction on permutation set with simple scalarset array of scalarset,
 and for all other variables, pick any remaining permutation
 ********************/
void SymmetryClass::Heuristic_Fast_Normalize(state* s)
{
  int i;
  static state temp;

  Perm.ResetToSimple();

};

/********************
  Include
 ********************/
#include "mu_epilog.hpp"
