set cindent
set shiftwidth=4
set expandtab
set hlsearch

imap jk <Esc><RIGHT>

"set cinkeys-=0#
"set indentkeys-=0#

"set keywordprg=pman

"abbrev aa $a$
"abbrev ana analytic
"abbrev anay analytically
"abbrev anad analysed
"abbrev ap arithmetic progression
"abbrev apost \textit{a posteriori}
"abbrev app application
"abbrev aps arithmetic progressions
"abbrev ari arithmetic
"abbrev arim arithmetic mean
"abbrev aria arithmetic average
"abbrev avg average
"abbrev avgs averages
"abbrev balpha \boldsymbol{\alpha}
"abbrev bbeta \boldsymbol{\beta}
"abbrev bdelta \boldsymbol{\delta}
"abbrev bepsilon \boldsymbol{\epsilon}
"abbrev bmt \begin{bmatrix}\end{bmatrix}<C-o>12h<c-r>=Eatchar('\s')
"abbrev bomega \boldsymbol{\omega}
"abbrev bphi \boldsymbol{\phi}
"abbrev bpsi \boldsymbol{\psi}
"abbrev bb $b$
"abbrev bino binomial
"abbrev clc calculate
"abbrev calc calculation
"abbrev calcd calculated
"abbrev calcs calculations
"abbrev calcg calculating
"abbrev Calc Calculation
"abbrev charc characteristic
"abbrev coeff coefficient
"abbrev coeffs coefficients
"abbrev com combination
"abbrev coms combinations
"abbrev corr correlation
"abbrev corrd correlated
"abbrev cts continuous
"abbrev dec decrease
"abbrev dcp decimal places
"abbrev defd defined
"abbrev defn definition
"abbrev detm determine
"abbrev detmn determination
"abbrev dev deviation
"abbrev devs deviations
"abbrev dif difference
"abbrev diffble differentiable
"abbrev difi difficult
"abbrev difs differences
"abbrev dify difficulty
"abbrev difys difficulties
"abbrev dist distribution
"abbrev dists distributions
"abbrev distd distributed
"abbrev eco economic
"abbrev ect economist
"abbrev ects economists
"abbrev eee e^{}<LEFT><c-r>=Eatchar('\s')
"abbrev eps \varepsilon
"abbrev eq equation
"abbrev eqr equation \eqref{}<LEFT><c-r>=Eatchar('\s')
"abbrev eqs equations
"abbrev exer \begin{exercise}<CR>\end{exercise}<UP><C-O>$
"abbrev expr expression
"abbrev expn expectation
"abbrev expns expectations
"abbrev exx \begin{example}<cr>\end{example}<C-O>O<C-R>=Eatchar('\s')
"abbrev fdist frequency distribution
"abbrev fdists frequency distributions
"abbrev ff f()<LEFT><c-r>=Eatchar('\s')
"abbrev fg Figure ???
"abbrev fn function
"abbrev fns functions
"abbrev folg following
"abbrev Folg Following
"abbrev fo formula
"abbrev fos formulas
"abbrev frc \frac{}{}<LEFT><LEFT><LEFT><c-r>=Eatchar('\s')
"abbrev freq frequency
"abbrev freqs frequencies
"abbrev Freq Frequency
"abbrev Freqs Frequencies
"abbrev ftnt \footnote{}<LEFT><c-r>=Eatchar('\s')
"abbrev fd fundamental
"abbrev fx $f(x)$
"abbrev gp geometric progression
"abbrev gps geometric progressions
"abbrev gm geometric mean
"abbrev gt greater than
"abbrev ha harmonic average
"abbrev hetero hetergeneous
"abbrev homo homogeneous
"abbrev hm harmonic mean
"abbrev ilu illustrate
"abbrev ilud illustrated
"abbrev ilug illustrating
"abbrev ilus illustrates
"abbrev inc increase
"abbrev ind independent
"abbrev indevs independent events
"abbrev ineq inequality
"abbrev ineqs inequalities
"imap iint <C-o>:call SetupIntegral()<CR>
"abbrev inv inverse
"abbrev itt \textit{}<LEFT><c-r>=Eatchar('\s')
"abbrev jprob joint probability
"abbrev lt less than
"abbrev lg logarithm
"abbrev lgs logarithms
"abbrev msc miscallaneous
"imap mmm <C-o>:M
"abbrev mn minimum
"abbrev mthl mathematical
"abbrev mthly mathematically
"abbrev mths mathematics
"abbrev muex mutually exclusive
"abbrev mx maximum
"abbrev nbhd neighbourhood
"abbrev nec necessary
"abbrev neg negative
"abbrev nl \newline
"abbrev nn \nonumber
"abbrev noal \begin{align}<CR>\nonumber<CR>\end{align}<UP>
"abbrev noeq \begin{equation}<CR>\nonumber<CR>\end{equation}<UP>
"abbrev nual \begin{align}<CR>\end{align}<UP><RIGHT><RIGHT>
"abbrev nueq \begin{equation}<CR>\end{equation}<UP><RIGHT><RIGHT>\label{}<LEFT><c-r>=Eatchar('\s')
"abbrev otoh on the other hand
"abbrev para parabola
"abbrev paras parabolas
"abbrev parac parabolic
"abbrev pb problem
"abbrev pbs problems
"abbrev pd period
"abbrev pds periods
"abbrev pdc periodic
"abbrev pdcy periodicity
"abbrev pdcs periodicities
"abbrev perm permutation
"abbrev perms permutations
"abbrev pfrk \pfrak{}{}<LEFT><LEFT><LEFT><c-r>=Eatchar('\s')
"abbrev prt particular
"abbrev prp proposition
"abbrev prty particularly
"abbrev prm \p{1}
"abbrev poly polynomial
"abbrev pos positive
"abbrev prd product
"abbrev prob probability
"abbrev probs probabilities
"abbrev qfrm quadratic form
"abbrev qn question
"abbrev qns questions
"abbrev qty quantity
"abbrev qts quantities
"abbrev rsp respective
"abbrev rspy respectively
"abbrev s2pi \sqrt{2\pi}
"abbrev sb subscript
"abbrev sbs subscripts
"abbrev sdev standard deviation
"abbrev sdevs standard deviations
"abbrev sfrc \sqrt{\frac{}{}}<LEFT><LEFT><LEFT><LEFT><c-r>=Eatchar('\s')
"abbrev sig \sigma
"abbrev sgn significant
"abbrev sim simultaneous
"abbrev simy simultaneously
"abbrev sl straight line
"abbrev smm \Brac{\begin{smallmatrix}\end{smallmatrix}}<C-o>18h<c-r>=Eatchar('\s')
"abbrev sol solution
"abbrev sp superscript
"abbrev sps superscripts
"abbrev sq \sqrt{}<LEFT><c-r>=Eatchar('\s')
"imap smn <C-o>:call SetupSummation()<CR>
"abbrev stat statistic
"abbrev statl statistical
"abbrev stats statistics
"abbrev suf sufficient
"abbrev tb table ???
"abbrev tran transformation
"abbrev thm theorem
"abbrev thms theorems
"abbrev trang transforming
"abbrev trans transformations
"abbrev ttab \begin{center}<CR>\begin{tabular}<CR>\end{tabular}<CR>\end{center}<UP><UP><RIGHT><RIGHT><RIGHT>
"abbrev txst \textstyle 
"abbrev uni uniform
"abbrev uniy uniform
"abbrev val value
"abbrev vals values
"abbrev var variable
"abbrev vars variables
"imap vv <C-o>:call Environment()<CR>
"abbrev wd well defined
"abbrev wrt with respect to
"abbrev xaxis $X$-axis
"abbrev yaxis $Y$-axis
"abbrev xx $x$
"abbrev yy $y$
""abbrev ;; $$<LEFT><c-r>=Eatchar('\s')
"imap <silent> kj $$<LEFT>
"abbrev <silent> ^^ ^{}<LEFT><c-r>=Eatchar('\s')
"imap <C-X> <C-O>$  
"imap <C-D> $<C-O>x and $$<LEFT>
"abbrev ## ``''<LEFT><LEFT><c-r>=Eatchar('\s')
"abbrev enu \begin{enumerate}<CR>\end{enumerate}<UP><RIGHT><RIGHT><RIGHT><CR>\item
"imap <C-C> <C-O>b<C-O>~<C-O>e<C-O>l
"imap <C-Z> <C-O>t{<c-o>2l
"imap <C-\> <c-O>: 
"
"
"
"abbrev noof number of
"abbrev nooft number of trials
"abbrev loln law of large numbers
"abbrev iii it is important 
"abbrev fcl freight car loadings
"abbrev han harmonic analysis
"abbrev spr stock prices
"abbrev ip industrial production
"abbrev sv seasonal variation
"abbrev lr link relative
"abbrev bs business
"abbrev apri \textit{a priori}
"abbrev trt time reversal test
"abbrev frt factor reversal test
"abbrev NYC New York City
"abbrev NY New York
"abbrev US United States
"abbrev jandec Jan  Feb  Mar  Apr  May  June  July  Aug  Sept  Oct  Nov  Dec
"abbrev Jaa January
"abbrev Fee February
"abbrev Maa March
"abbrev App April
"abbrev Sep September
"abbrev Occ October
"abbrev Noo November
"abbrev Dee December
"abbrev funal functional relations
"abbrev funals functional relationship
"abbrev phys physical sciences
"abbrev cm class marks
"abbrev forex for example,
"abbrev inu index number
"abbrev inus index numbers
"abbrev udoa U.S. Department of Agriculture
"abbrev nyfrb Federal Reserve Bank of New York
"abbrev ts time series
"abbrev tao the analysis of
"imap <silent> xc {}
"imap <silent> xxcc {}
"
"
"
"func SetupSummation()
"    let firstIndex = Interrogate("what os the lower index?")
"    let secondIndex = Interrogate("what os the upper index?")
"    let finalString = "\\sumlim{" . firstIndex . "}{" . secondIndex . "}{}"
"    call WriteText(finalString,0,1)
"    execute "normal 3f}a"
"endfunc
"
"func SetupIntegral()
"    let firstIndex = Interrogate("what os the lower index?")
"    let secondIndex = Interrogate("what os the upper index?")
"    let differential = Interrogate("with respect to what variable?")
"    let finalString = "\intlim{" . firstIndex . "}{" . secondIndex . "}{}{" . differential . "}"
"    call WriteText(finalString,0,1)
"    execute "normal 3f}a"
"endfunc
"
"
"func ReplaceIndex(iExpression, iIndex, iReplacement, iInsertBraces)
""the game we play here is to search for iIndex in such form that it is not part of any other string
""We should expect this to be the case if the character to the left or right of the index is not in [A-z] (or just to the right if a greek char)
"let oExpression = ""
"let strEndPosition = strlen(a:iExpression) - 1
"let currPosition = 0
"let indexLen = strlen(a:iIndex)
"while currPosition <= strEndPosition
"    let indexCounter = 0
"    let foundIndex = 1
"    while indexCounter < indexLen
"        if a:iExpression[currPosition + indexCounter] == a:iIndex[indexCounter]
"            if a:iExpression[currPosition + indexLen] =~ '[a-zA-Z]'
"                let foundIndex = 0
"	        let indexCounter = indexLen
"            elseif a:iExpression[currPosition -1] =~ '[a-zA-Z]' && a:iExpression[currPosition] != "\\"
"                let foundIndex = 0
"	        let indexCounter = indexLen
"            else
"	       let indexCounter+=1
"            endif
"	else
"	    let indexCounter = indexLen
"	    let foundIndex = 0
"	endif
"    endwhile
"    if foundIndex == 0
"        let oExpression .= a:iExpression[currPosition]
"        let currPosition+=1
"    else
"        if a:iInsertBraces == 1 && !(a:iExpression[currPosition-1] == "{")
"            let oExpression .= "{" . a:iReplacement . "}"
"        else
"            let oExpression .= a:iReplacement
"        endif
"        let currPosition+=indexLen
"    endif
"endwhile
"    echo "oExpression: " . oExpression
"return oExpression
"endfunc
"
"func SumOrSequenceHelper()
"    let oIndex = Interrogate("index variable? ")
"    "go to last thing visually selected (I think!), yank it (putting it in the " register), then fetch it via oParam. Then pass this off to SumOrSequence
"    execute "normal! gvy"
"    let oExpression = getreg('"') 
"    echo oExpression
"    call SumOrSequence(oExpression, oIndex)
"endfunc
"
"func SumOrSequenceHelper2(iIndex)
"    let oIndex = a:iIndex
"    "go to last thing visually selected (I think!), yank it (putting it in the " register), then fetch it via oParam. Then pass this off to SumOrSequence
"    execute "normal! gvy"
"    let oExpression = getreg('"') 
"    echo oExpression
"    call SumOrSequence(oExpression, oIndex)
"endfunc
"
"func SumOrSequence(iExpression, iIndex)
""TODO need to check validity of these - maybe set a default
"let default = Interrogate("do with defaults? yes [y] (2,1,n,0,\",\"), yes but specify last term [d[a-Z]], no [n]")
"if default == "y"
"    let leftTerms = 2
"    let rightTerms = 1
"    let lastTermIndex = "n"
"    let firstTermIndex = 1
"    let operator = ","
"    let dotType = "\\dots"
"elseif default =~ 'd[a-zA-Z]'
"    let leftTerms = 2
"    let rightTerms = 1
"    let lastTermIndex = default[1]
"    let firstTermIndex = 1
"    let operator = Interrogate("what separates terms? add [+], subtract [-], times [*], comma [,], ampersand [&]?")
"    let dotType = "\\cdots"
"else "so n or anything else
"    let leftTerms = InterrogateNumber("how many terms before dots? ")
"    let rightTerms = InterrogateNumber("how many terms after dots? ")
"    let lastTermIndex = Interrogate("what is last term index? ")
"    let firstTermIndex = Interrogate("what is first term index? ")
"    let operator = Interrogate("what separates terms? add [+], subtract [-], times [*], comma [,], ampersand [&]? ") "need to check only any of these provided
"    let dotType = "\\cdots"
"endif
"if operator == ","
"    let dotType = "\\dots"
"endif
"if operator == "*"
"    let operator = "\\times"
"endif
"let leftCount = 1
"let oExpression = ""
"let oExpression = ReplaceIndex(a:iExpression, a:iIndex, firstTermIndex,1)
"while leftCount < leftTerms
"    if leftCount > 0
"        let oExpression .= operator . " "
"    endif
"    let oExpression .= ReplaceIndex(a:iExpression, a:iIndex, HandleIncrement(firstTermIndex, leftCount),1) 
"    let leftCount += 1
"endwhile
"let oExpression .= operator . " " . dotType . " "
"let rightCount = rightTerms-1
"while rightCount > 0
"    "here we are going to be counting backwards from some number denoting number of terms - may need to know if we actually have a number!
"    echo "decrement: " . HandleDecrement(lastTermIndex, rightCount)
"    let oExpression .= operator . " " . ReplaceIndex(a:iExpression, a:iIndex, HandleDecrement(lastTermIndex, rightCount),1)
"    let rightCount -= 1
"endwhile
"let oExpression .= operator . " " . ReplaceIndex(a:iExpression, a:iIndex, lastTermIndex,0)
"echo oExpression
""might want to just return oExpression to the calling function or helper function as it may be a component of some other function
"execute "normal gvdi#"oExpression."#"
""now some jiggery-pokery to get rid of pesky space!
"execute "normal T#hxxt#lx" 
"endfunc 
"
"func HandleIncrement(iExpression, iIncrement)
""TODO and what about negative numbers for iExpression!??? not handling these yet :[
"let oExpression = ""
"if !(a:iExpression[0] =~ '[0-9]') || a:iExpression < 10 && strlen(a:iExpression) > 1
"    let oExpression = a:iExpression . " + " . a:iIncrement
"else
"    let oExpression = a:iExpression + a:iIncrement
"endif
"echo oExpression
"return oExpression
"endfunc
"
"func HandleDecrement(iExpression, iIncrement)
""TODO and what about negative numbers for iExpression!??? not handling these yet :[
"let oExpression = ""
"if !(a:iExpression[0] =~ '[0-9]') || a:iExpression < 10 && strlen(a:iExpression) > 1
"    let oExpression = a:iExpression . " - " . a:iIncrement
"else
"    let oExpression = a:iExpression - a:iIncrement
"endif
"echo oExpression
"return oExpression
"endfunc
"
"func Concatenate(iStr, iText, ...)
"    let oStr = a:iStr
"    let oStr .= a:iText
"    if a:0 > 0
"        let counter = a:1
"        while counter > 1
"            let oStr .= a:iText
"            let counter -= 1
"        endwhile
"
"    endif
"    return oStr
"endfunc
"
""func Test1(var1)
""    let counter = a:var1+1
""    while counter > 0
""    execute "normal a"counter
""    let counter -= 1
""    endwhile
""endfunc
""
"func Environment()
"    let env = Interrogate("what type of environment? ")
"    let begenv = "\\begin{" . env . "}"
"    let endenv = "\\end{" . env . "}"
"    call WriteText(begenv, 1, 1)
"    call WriteText(endenv, 1, 1)
"    execute "normal kO"
"endfunc
"
"
"
"func Interrogate(question)
"    call inputsave()
"    let answer = input(a:question)
"    call inputrestore()
"    return answer
"endfunc
"
"func InterrogateNumber(question)
"    call inputsave()
"    let answer = input(a:question)
"    call inputrestore()
"    "TODO what about negative numbers?
"    if !(answer[0] =~ '[0-9]')
"        let answer = InterrogateNumber(a:question . " you didn't enter a numerical value ")
"    endif
"    return answer
"endfunc
"
"func WriteText(iStr, iDoReturn, iChompFirstChar)
"    execute "normal! i"a:iStr
"    if a:iChompFirstChar
"        execute "normal! 0x"
"    endif
"    if a:iDoReturn
"       execute "normal! o"
"    endif
"endfunc
"
"func Matrix(isDeterminant,cols,rows)
"    let det = a:isDeterminant
"    let numCols = a:cols
"    let numRows = a:rows
"    let stringToPut = ""
"
"    if det == '0'
"       let stringToPut .= "\\Brac{\\begin{array}{"
"    elseif det != 0
"       let stringToPut .= "\\norm{\\begin{array}{"
"    endif
"
"    while numCols > 0
"       let stringToPut .= "c"
"       let numCols -= 1
"    endwhile
"
"    let stringToPut .= "}"
"    call WriteText(stringToPut, 1,0)
"    let test = "hello"
"
"    let numCols = a:cols
"    let stringToPut = ""
"    while numRows > 0
"        let stringToPut .= Interrogate('insert elements: ')
"        while numCols > 1
"            let stringToPut .= " & " . Interrogate('insert elements: ')
"            let numCols -= 1
"        endwhile
"        let numCols = a:cols
"        if numRows != 1
"            let stringToPut .= " \\\\"
"            call WriteText(stringToPut, 1,1)
"        elseif numRows == 1
"            call WriteText(stringToPut, 0,1)
"        endif
"        echo stringToPut . test[4]
"        let stringToPut = ""
"        let numRows -= 1
"    endwhile
"    
"    call WriteText(stringToPut, 1,0)
"    call WriteText("\\end{array}}", 0,0)
"endfunc
"
"
"func! GetSelectedText()
"  normal gv"xy
"  let result = getreg("x")
"  normal gv
"  return result
"endfunc
"
"func Cap(noOfWords)
"	normal mm
"	let counter = 0
"	while counter < a:noOfWords
"		normal b~h
"		let counter = counter + 1
"	endwhile
"	normal `m
"endfunc
"
""":abbr <silent> aln \begin{align}<Cr><Left>\nonumber<Cr><Left>\end{align}<Up>
"":abbr <silent> naln \begin{align}<Cr><Cr><Left>\end{align}<Up><C-R>=Eatchar(' ')
"":abbr <silent> ned end
""
"vmap <silent><F2> :call SumOrSequenceHelper()
"vmap <F2> :call SumOrSequenceHelper()
"vnoremap <F6> :call SumOrSequence(GetSelectedText(),";")<cr>
"
"imap <C-A> <C-O>mm<C-O>B<C-O>v`m<F2>
""call on something like f_;^{(j)}
""
""let counter = 0
""inoremap <expr> <C-L> ListItem()
""inoremap <expr> <C-R> ListReset()
""
""func ListItem()
""  let g:counter += 1
""  return g:counter . '. '
""endfunc
""
""func ListReset()
""  let g:counter = 0
""  return ''
""endfunc
""
"""----------------look this stuff up
""func! PrintFirstAndLastLine() range
""  echo a:firstline
""  echo a:lastline
""endfunc
""
""
"func SearchMultiLine(start, end)
"	let direction = '/'
"	"let syntax = 'normal ' . direction . a:start . '<CR>'
"	let syntax = direction . a:start 
"	echo syntax
"	execute syntax
"endfunc
"
"com -range -nargs=* C call Cap(<f-args>)
"com! -range -nargs=* F <line1>,<line2>call PrintFirstAndLastLine()
""-range is required (why?) <f-args> allows for something like :S k (specifying index k, without quotes, so I can cut down on interrogation)
"com -range -nargs=* S call SumOrSequenceHelper2(<f-args>)
"com -range -nargs=* M call Matrix(<f-args>)
""-----------------------------------------------------------------
"
"source $HOME/letterssubscripts
