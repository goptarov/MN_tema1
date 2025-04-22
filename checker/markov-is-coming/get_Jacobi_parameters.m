function [G, c] = get_Jacobi_parameters (Link)
  n = size(Link, 1) - 2;
  G = Link(1 : n, 1 : n); %G este doar matricea Link fara ultimele 2 randuri si coloane
  c = Link(1 : n, n + 1); %c este doar penultima coloana a matricei Link fara ultimele 2 linii(WIN si LOSE).
endfunction
