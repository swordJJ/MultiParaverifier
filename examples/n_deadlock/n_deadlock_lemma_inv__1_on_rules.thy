(*  Title:      HOL/Auth/n_deadlock_lemma_inv__1_on_rules.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

(*header{*The n_deadlock Protocol Case Study*}*) 

theory n_deadlock_lemma_inv__1_on_rules imports n_deadlock_lemma_on_inv__1
begin
section{*All lemmas on causal relation between inv__1*}
lemma lemma_inv__1_on_rules:
  assumes b1: "r \<in> rules N" and b2: "(\<exists> p__Inv3 p__Inv4. p__Inv3\<le>N\<and>p__Inv4\<le>N\<and>p__Inv3~=p__Inv4\<and>f=inv__1  p__Inv3 p__Inv4)"
  shows "invHoldForRule s f r (invariants N)"
  proof -
  have c1: "(\<exists> i. i\<le>N\<and>r=n_Try  i)\<or>
    (\<exists> i. i\<le>N\<and>r=n_Crit  i)\<or>
    (\<exists> i. i\<le>N\<and>r=n_Exit  i)\<or>
    (\<exists> i. i\<le>N\<and>r=n_Idle  i)"
  apply (cut_tac b1, auto) done
    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_Try  i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_TryVsinv__1) done
    }

    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_Crit  i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_CritVsinv__1) done
    }

    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_Exit  i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_ExitVsinv__1) done
    }

    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_Idle  i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_IdleVsinv__1) done
    }

  ultimately show "invHoldForRule s f r (invariants N)"
  by satx
qed

end
