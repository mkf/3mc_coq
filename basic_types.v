Inductive Color : Set := White | Gray | Black.
Definition next (c:Color) := match c with
    | White => Gray
    | Gray => Black
    | Black => White 
end.
Variable prev : Color -> Color.
Axiom defining_prev : 
    forall c : Color, (next (prev c)) = c.
(* Definition prev (c:Color) := match c with
    | White => Black
    | Gray => White
    | Black => Gray
end. *)
Lemma next_three_times 
    : forall c : Color, (next (next (next c))) = c.
Proof. Admitted.
Lemma prev_three_times 
    : forall c : Color, (prev (prev (prev c))) = c.
Proof. Admitted.
Lemma next_of_prev_is_orig : 
    forall c : Color, (next (prev c)) = c.
Proof. Admitted.
Lemma prev_of_next_is_orig : forall c : Color, (prev (next c)) = c.
Proof. Admitted.
Inductive RankHalf : Set := Outer | Inner.
Inductive Rank : Set := 
    | Most (_:RankHalf)
    | Second (_:RankHalf)
    | Middle (_:RankHalf).
Definition inw (r:Rank) : Rank := match r with
    | Most Outer => Second Outer
    | Second Outer => Middle Outer
    | Middle Outer => Middle Inner
    | Middle Inner => Second Inner
    | Second Inner => Most Inner
    | Most Inner => Most Inner
end.
Inductive OutRank : Set := Outboard | Onboard (r:Rank).
Variable out : Rank -> OutRank.
Axiom out_mostouter : (out (Most Outer)) = Outboard.
Axiom out_never_same : forall a : Rank, (out a) <> (Onboard a).
Axiom out_if_inw : 
    forall a : Rank, forall b : Rank, 
    (a = (inw b)) -> ((Onboard b) = (out a)).
Inductive SegmentHalf : Set := FirstHalf | SecondHalf.
Definition SegmentEight : Set := (SegmentHalf, SegmentHalf, SegmentHalf)
Definition ColorSegment : Set := Color
Definition File : Set := (ColorSegment, SegmentEight)
(* Definition oneFilePluswards (f:File) : File := *)