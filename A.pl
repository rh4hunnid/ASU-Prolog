drawSymbol(Symbol,0).
drawSymbol(Symbol,N) :- N>0,write(Symbol), N1 is N-1, drawSymbol(Symbol,N1).


drawHLine(0):- write('\n').
drawHLine(N):- N>0,write('-'),N1 is N-1,drawHLine(N1).

hline(LRM, SBC, Font) :-TextWidth is Font*3, LineLen is TextWidth*3 + SBC*2+LRM*2+2,drawHLine(LineLen).


drawVSpace(0,LineLen).
drawVSpace(N,LineLen):- N>0,write('|'),drawSymbol(' ',LineLen), write('|'),write('\n'),N1 is N-1,drawVSpace(N1,LineLen).







drawA(TxtWidth,TxtHeight,Font,Line,TxtWidth). 
drawA(TxtWidth,TxtHeight,Font,Line,Col) :- ((Line >= Font,Line<2*Font);(Line>=3*Font,Line<4*Font);(Line>=4*Font,Line<5*Font)),((Col >=0,Col<Font);(Col>=2*Font,Col<3*Font)), drawSymbol('*',Font),NextCol is Col+Font,drawA(TxtWidth,TxtHeight,Font,Line,NextCol).
drawA(TxtWidth,TxtHeight,Font,Line,Col) :- ((Line >= Font,Line<2*Font);(Line>=3*Font,Line<4*Font);(Line>=4*Font,Line<5*Font)), Col >=1*Font,Col<2*Font, drawSymbol(' ',Font),NextCol is Col+Font,drawA(TxtWidth,TxtHeight,Font,Line,NextCol).
drawA(TxtWidth,TxtHeight,Font,Line,Col) :- ((Line>=0,Line<Font);(Line>=2*Font,Line<3*Font)),Col<3*Font,drawSymbol('*',Font),NextCol is Col+Font,drawA(TxtWidth,TxtHeight,Font,Line,NextCol).


drawS(TxtWidth,TxtHeight,Font,Line,TxtWidth).
drawS(TxtWidth,TxtHeight,Font,Line,Col) :- ((Line>=0,Line<Font);(Line>=2*Font,Line<3*Font);(Line>=4*Font,Line<5*Font)),Col<3*Font,drawSymbol('*',Font),NextCol is Col+Font,drawS(TxtWidth,TxtHeight,Font,Line,NextCol).
drawS(TxtWidth,TxtHeight,Font,Line,Col) :- ((Line>=1*Font,Line<2*Font)),Col<Font,drawSymbol('*',Font),NextCol is Col+Font,drawS(TxtWidth,TxtHeight,Font,Line,NextCol).
drawS(TxtWidth,TxtHeight,Font,Line,Col) :- ((Line>=3*Font,Line<4*Font)),(Col>=2*Font,Col<3*Font),drawSymbol('*',Font),NextCol is Col+Font,drawS(TxtWidth,TxtHeight,Font,Line,NextCol).
drawS(TxtWidth,TxtHeight,Font,Line,Col) :- ((Line>=1*Font,Line<2*Font)),(Col>=Font,Col<3*Font),drawSymbol(' ',Font),NextCol is Col+Font,drawS(TxtWidth,TxtHeight,Font,Line,NextCol).
drawS(TxtWidth,TxtHeight,Font,Line,Col) :- ((Line>=3*Font,Line<4*Font)),Col<2*Font,drawSymbol(' ',Font),NextCol is Col+Font,drawS(TxtWidth,TxtHeight,Font,Line,NextCol).

drawU(TxtWidth,TxtHeight,Font,Line,TxtWidth).
drawU(TxtWidth,TxtHeight,Font,Line,Col) :- (Line >=0,Line<4*Font),((Col>=0,Col<Font);(Col>=2*Font,Col<3*Font)),drawSymbol('*',Font),NextCol is Col+Font,drawU(TxtWidth,TxtHeight,Font,Line,NextCol).
drawU(TxtWidth,TxtHeight,Font,Line,Col) :- (Line >=0,Line<4*Font),(Col>=Font,Col<2*Font),drawSymbol(' ',Font),NextCol is Col+Font,drawU(TxtWidth,TxtHeight,Font,Line,NextCol).
drawU(TxtWidth,TxtHeight,Font,Line,Col) :- (Line >=4*Font,Line<5*Font),Col<3*Font,drawSymbol('*',Font),NextCol is Col+Font,drawU(TxtWidth,TxtHeight,Font,Line,NextCol).

drawR(LRM,TBM,SBC,TxtW,TxtH,Font,TxtH).
drawR(LRM,TBM,SBC,TxtW,TxtH,Font,Line) :- Line < TxtH, write('|'),drawSymbol(' ',LRM),
drawA(TxtW,TxtH,Font,Line,0),drawSymbol(' ',SBC),drawS(TxtW,TxtH,Font,Line,0),drawSymbol(' ',SBC),
drawU(TxtW,TxtH,Font,Line,0),drawSymbol(' ',LRM),write('|'),write('\n'),NextLine is Line+1, drawR(LRM,TBM,SBC,TxtW,TxtH,Font,NextLine).


asu(LRM,TBM,SBC,Font) :- TxtW is Font*3, TxtH is Font*5, LineLen is 3*TxtW +LRM*2+SBC*2,drawHLine(LineLen+2),drawVSpace(TBM,LineLen),drawR(LRM,TBM,SBC,TxtW,TxtH,Font,0),drawVSpace(TBM,LineLen),drawHLine(LineLen+2).