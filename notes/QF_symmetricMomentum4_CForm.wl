(* 17 central-momentum QFs at the 4A point.
   Evaluate cell-by-cell in Mathematica: assignment, then % // CForm. *)

QF1 = symmetricMomentum4[-p1 - q, q, p1]
% // CForm

QF2 = symmetricMomentum4[-q, -p2 + q, p2]
% // CForm

QF3 = symmetricMomentum4[p2 - q, p1 + p4 + q, p3]
% // CForm

QF4 = symmetricMomentum4[-p1 - p4 - q, p1 + q, p4]
% // CForm

QF5 = symmetricMomentum4[p1, p2, -q, -p1 - p2 + q]
% // CForm

QF6 = symmetricMomentum4[p1, p3, -q, -p1 - p3 + q]
% // CForm

QF7 = symmetricMomentum4[p1, p4, -q, -p1 - p4 + q]
% // CForm

QF8 = symmetricMomentum4[p3, -p3 - q, q]
% // CForm

QF9 = symmetricMomentum4[p4, p1 + p2 - q, p3 + q]
% // CForm

QF10 = symmetricMomentum4[p1, p2, p3 - q, p4 + q]
% // CForm

QF11 = symmetricMomentum4[p2, -p2 - q, q]
% // CForm

QF12 = symmetricMomentum4[p1, p3, p2 - q, p4 + q]
% // CForm

QF13 = symmetricMomentum4[p3, p1 + p4 - q, p2 + q]
% // CForm

QF14 = symmetricMomentum4[p2, p4, p1 - q, p3 + q]
% // CForm

QF15 = symmetricMomentum4[p3, p4, -q, -p3 - p4 + q]
% // CForm

QF16 = symmetricMomentum4[p2, p3 + p4 - q, p1 + q]
% // CForm

QF17 = symmetricMomentum4[p4, p1 - q, p2 + p3 + q]
% // CForm
