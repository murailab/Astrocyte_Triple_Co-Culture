# Raw qPCR Data

Data was filtered for reactions with “Call” == “Pass”. Culture condition
was added to each sample to facilitate downstream analysis.

## Data Points without Corresponding Culture Condition

These are samples that are not among the original sample set that were
used for RNA-seq. Note the inclusion of the blank samples for the target
Srp68. This indicates that the Srp68 primers amplify without template.
Possible primer-dimer amplification. The Srp68 reactions should be
excluded.

    ## # A tibble: 41 × 15
    ##    ID      sample    culture Sample_Type rConc Target Test_Type Ct_Value Quality
    ##    <chr>   <chr>     <chr>   <chr>       <dbl> <chr>  <chr>        <dbl>   <dbl>
    ##  1 S96-A01 No Sample <NA>    Blank           1 Adcy1  Test          27.8   1    
    ##  2 S96-A31 No Sample <NA>    Blank           1 Srp68  Test          18.1   0.767
    ##  3 S95-A31 No Sample <NA>    Blank           1 Srp68  Test          18.1   0.682
    ##  4 S04-A31 No Sample <NA>    Blank           1 Srp68  Test          18.5   0.713
    ##  5 S92-A31 No Sample <NA>    Blank           1 Srp68  Test          18.0   0.839
    ##  6 S91-A31 No Sample <NA>    Blank           1 Srp68  Test          17.8   0.819
    ##  7 S88-A31 No Sample <NA>    Blank           1 Srp68  Test          18.7   0.748
    ##  8 S87-A31 No Sample <NA>    Blank           1 Srp68  Test          18.2   0.699
    ##  9 S08-A31 No Sample <NA>    Blank           1 Srp68  Test          18.4   0.711
    ## 10 S84-A31 No Sample <NA>    Blank           1 Srp68  Test          18.6   0.727
    ## # ℹ 31 more rows
    ## # ℹ 6 more variables: Call <chr>, Threshold <dbl>, `In Range` <dbl>,
    ## #   `Out Range` <dbl>, `Peak Ratio` <dbl>, Comments <lgl>

## Summary of qPCR Data

This table contains the mean values for each culture condition and
target. The key value is ddCt with is equivalent to log2 fold change. It
is ddCt that will be compared to the RNA-seq estimated log2 fold
changes.

    ## # A tibble: 1,216 × 9
    ## # Groups:   sample [21]
    ##    sample Target mean_Ct     sd culture calibrator_Ct delta_Ct mean_con_dCt
    ##    <chr>  <chr>    <dbl>  <dbl> <chr>           <dbl>    <dbl>        <dbl>
    ##  1 AN_G1  Adcy1    13.7  0.0582 AN               11.3   -2.45        -1.56 
    ##  2 AN_G1  Aldoc     6.75 0.0438 AN               11.3    4.55         3.41 
    ##  3 AN_G1  Appl2    10.8  0.134  AN               11.3    0.447       -0.125
    ##  4 AN_G1  Aqp4      7.06 0.0977 AN               11.3    4.24         3.30 
    ##  5 AN_G1  Atp1b1    7.04 0.0680 AN               11.3    4.26         3.82 
    ##  6 AN_G1  Ccnd1     8.47 0.0286 AN               11.3    2.83         3.99 
    ##  7 AN_G1  Ccnd2     8.29 0.0745 AN               11.3    3.01         3.57 
    ##  8 AN_G1  Cdk1     11.9  0.117  AN               11.3   -0.570        0.855
    ##  9 AN_G1  Clcn5    14.4  0.164  AN               11.3   -3.12        -2.30 
    ## 10 AN_G1  Cldn10   12.9  0.138  AN               11.3   -1.64        -3.36 
    ## # ℹ 1,206 more rows
    ## # ℹ 1 more variable: ddCt <dbl>

# Boxplot of A vs. EAN

![](figures/qPCR_boxplot-1.png)

# Correlation with RNA-seq Data

## AN Fit

    ## 
    ## Call:
    ## lm(formula = mean_ddCt ~ seq_lfc, data = corr_data %>% filter(culture == 
    ##     "AN"))
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -0.51175 -0.16423 -0.05963  0.03238  1.78971 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  0.05925    0.04592    1.29    0.202    
    ## seq_lfc      1.11003    0.05945   18.67   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.3296 on 56 degrees of freedom
    ## Multiple R-squared:  0.8616, Adjusted R-squared:  0.8591 
    ## F-statistic: 348.6 on 1 and 56 DF,  p-value: < 2.2e-16

## EA Fit

    ## 
    ## Call:
    ## lm(formula = mean_ddCt ~ seq_lfc, data = corr_data %>% filter(culture == 
    ##     "AE"))
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -7.2250 -0.4718  0.0510  0.6835  3.4501 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)   0.3543     0.2166   1.636    0.107    
    ## seq_lfc       1.2791     0.1964   6.514 2.19e-08 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 1.649 on 56 degrees of freedom
    ## Multiple R-squared:  0.4311, Adjusted R-squared:  0.4209 
    ## F-statistic: 42.43 on 1 and 56 DF,  p-value: 2.193e-08

## EAN Fit

    ## 
    ## Call:
    ## lm(formula = mean_ddCt ~ seq_lfc, data = corr_data %>% filter(culture == 
    ##     "AEN"))
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -3.2054 -0.3782 -0.0664  0.2530  3.0005 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  0.34362    0.11060   3.107  0.00297 ** 
    ## seq_lfc      1.08462    0.04659  23.282  < 2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.8358 on 56 degrees of freedom
    ## Multiple R-squared:  0.9064, Adjusted R-squared:  0.9047 
    ## F-statistic:   542 on 1 and 56 DF,  p-value: < 2.2e-16

# Plot of Correlation between RNA-seq and qPCR

![](figures/qPCR_RNA-seq_correlation-1.png)

## Interactive Plot

<div class="plotly html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-204de2d9a8a3b74cf82d" style="width:768px;height:768px;"></div>
<script type="application/json" data-for="htmlwidget-204de2d9a8a3b74cf82d">{"x":{"visdat":{"d86b5d56645":["function () ","plotlyVisDat"]},"cur_data":"d86b5d56645","attrs":{"d86b5d56645":{"x":{},"y":{},"mode":"markers","text":{},"color":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Validation of RNA-seq by qPCR","xaxis":{"domain":[0,1],"automargin":true,"title":"qPCR (ddCt)"},"yaxis":{"domain":[0,1],"automargin":true,"title":"RNA-Seq (estimated log2 fold change)"},"legend":{"title":{"text":"<b> Pure Astros vs. <\/b>"}},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[-1.51602928833333,1.87630304953333,0.293043753000001,1.4294926906,-0.207790239333333,-1.30956575906667,-0.154034546599999,-0.278950845666667,0.475937989000001,2.10421141233333,0.443908750333334,0.148348545466668,3.54337921833333,-2.45587594326667,1.54264979378333,-0.146480885666666,-0.338068805666666,2.39255544766667,0.404684090200001,-5.46610726033333,1.3756284178,-2.6374348468,0.6685824748,0.0820824083333342,3.94069973366667,0.370162497600001,2.17344967833333,2.348599937,-1.0282239788,0.246910489666668,-0.132036868733333,1.41189038833333,0.212158372333334,-0.200801979,0.504082341866667,0.665106893000001,1.45222068206667,-3.27676577033333,-6.988695061,2.47176637806667,1.132301416,0.593665554333334,4.69386855766667,5.467586995,0.00963401700000119,-0.0125607454666658,-0.580043653666666,2.10990377833333,0.0976476403333341,-0.0976476403333329,1.01392025246667,-3.42200539826667,-1.44696693033333,-0.753650823666666,0.818232009666667,-0.325481713133333,-0.221912030333332,4.65773795633333],"y":[-0.420867371458161,0.285855218955176,0.529408380989025,0.184918038650511,-0.349834932826271,-1.66434369244993,-0.434702280616185,-0.264324693230206,0.267695880563009,0.45376343740018,0.488662272319117,-0.45456839435369,0.561311005432701,-3.15772627912217,-0.129165086015444,-0.422373115759411,-0.464034585815168,0.167582347737738,0.405153276725235,-0.493089239332622,0.327837763521166,-1.87977311905015,0.615583380620387,0.0472304692236921,0.106571829126023,-0.0817626077523333,0.259054740529616,0.706059667149804,-1.12338238776721,-0.0469925338846402,0.138162814861627,0.578369890242769,-0.0199316980459264,-2.00376533342855,0.58153712388685,0.04955368626096,0.621691049422349,-3.45242497789922,-0.0922918177921022,0.555805135748008,0.508929435154106,0.174646184503153,2.83706392504871,4.4871894099144,-0.522916023898517,0.697593529984109,-0.492482954415104,0.911998437282203,-0.0655672202770066,-0.0256081916056847,0.460439573608215,-0.30153552652793,-0.440817202859173,0.0888018632005441,0.179889133654525,-0.598326714768591,0.0935074772959418,0.737541201114097],"mode":"markers","text":["Target:  Adcy1 <br>culture:  AE <br>ddCt:  -1.51602928833333 <br>RNA-Seq: -0.420867371458161","Target:  Aldoc <br>culture:  AE <br>ddCt:  1.87630304953333 <br>RNA-Seq: 0.285855218955176","Target:  Appl2 <br>culture:  AE <br>ddCt:  0.293043753000001 <br>RNA-Seq: 0.529408380989025","Target:  Aqp4 <br>culture:  AE <br>ddCt:  1.4294926906 <br>RNA-Seq: 0.184918038650511","Target:  Atp1b1 <br>culture:  AE <br>ddCt:  -0.207790239333333 <br>RNA-Seq: -0.349834932826271","Target:  Ccnd1 <br>culture:  AE <br>ddCt:  -1.30956575906667 <br>RNA-Seq: -1.66434369244993","Target:  Ccnd2 <br>culture:  AE <br>ddCt:  -0.154034546599999 <br>RNA-Seq: -0.434702280616185","Target:  Cdk1 <br>culture:  AE <br>ddCt:  -0.278950845666667 <br>RNA-Seq: -0.264324693230206","Target:  Clcn5 <br>culture:  AE <br>ddCt:  0.475937989000001 <br>RNA-Seq: 0.267695880563009","Target:  Cldn10 <br>culture:  AE <br>ddCt:  2.10421141233333 <br>RNA-Seq: 0.45376343740018","Target:  Dapp1 <br>culture:  AE <br>ddCt:  0.443908750333334 <br>RNA-Seq: 0.488662272319117","Target:  Emc7 <br>culture:  AE <br>ddCt:  0.148348545466668 <br>RNA-Seq: -0.45456839435369","Target:  Ephb1 <br>culture:  AE <br>ddCt:  3.54337921833333 <br>RNA-Seq: 0.561311005432701","Target:  Ephb2 <br>culture:  AE <br>ddCt:  -2.45587594326667 <br>RNA-Seq: -3.15772627912217","Target:  Fabp7 <br>culture:  AE <br>ddCt:  1.54264979378333 <br>RNA-Seq: -0.129165086015444","Target:  Fam43a <br>culture:  AE <br>ddCt:  -0.146480885666666 <br>RNA-Seq: -0.422373115759411","Target:  Fzd1 <br>culture:  AE <br>ddCt:  -0.338068805666666 <br>RNA-Seq: -0.464034585815168","Target:  Fzd10 <br>culture:  AE <br>ddCt:  2.39255544766667 <br>RNA-Seq: 0.167582347737738","Target:  Gja1 <br>culture:  AE <br>ddCt:  0.404684090200001 <br>RNA-Seq: 0.405153276725235","Target:  Gli1 <br>culture:  AE <br>ddCt:  -5.46610726033333 <br>RNA-Seq: -0.493089239332622","Target:  Glul <br>culture:  AE <br>ddCt:  1.3756284178 <br>RNA-Seq: 0.327837763521166","Target:  Gpc4 <br>culture:  AE <br>ddCt:  -2.6374348468 <br>RNA-Seq: -1.87977311905015","Target:  Gsn <br>culture:  AE <br>ddCt:  0.6685824748 <br>RNA-Seq: 0.615583380620387","Target:  Hars2 <br>culture:  AE <br>ddCt:  0.0820824083333342 <br>RNA-Seq: 0.0472304692236921","Target:  Hes5 <br>culture:  AE <br>ddCt:  3.94069973366667 <br>RNA-Seq: 0.106571829126023","Target:  Hey1 <br>culture:  AE <br>ddCt:  0.370162497600001 <br>RNA-Seq: -0.0817626077523333","Target:  Hey2 <br>culture:  AE <br>ddCt:  2.17344967833333 <br>RNA-Seq: 0.259054740529616","Target:  Kalrn <br>culture:  AE <br>ddCt:  2.348599937 <br>RNA-Seq: 0.706059667149804","Target:  Kcnj10 <br>culture:  AE <br>ddCt:  -1.0282239788 <br>RNA-Seq: -1.12338238776721","Target:  Mki67 <br>culture:  AE <br>ddCt:  0.246910489666668 <br>RNA-Seq: -0.0469925338846402","Target:  Nfia <br>culture:  AE <br>ddCt:  -0.132036868733333 <br>RNA-Seq: 0.138162814861627","Target:  Nrp2 <br>culture:  AE <br>ddCt:  1.41189038833333 <br>RNA-Seq: 0.578369890242769","Target:  Olig2 <br>culture:  AE <br>ddCt:  0.212158372333334 <br>RNA-Seq: -0.0199316980459264","Target:  Pdlim1 <br>culture:  AE <br>ddCt:  -0.200801979 <br>RNA-Seq: -2.00376533342855","Target:  Pld2 <br>culture:  AE <br>ddCt:  0.504082341866667 <br>RNA-Seq: 0.58153712388685","Target:  S100b <br>culture:  AE <br>ddCt:  0.665106893000001 <br>RNA-Seq: 0.04955368626096","Target:  S1pr1 <br>culture:  AE <br>ddCt:  1.45222068206667 <br>RNA-Seq: 0.621691049422349","Target:  Sema3c <br>culture:  AE <br>ddCt:  -3.27676577033333 <br>RNA-Seq: -3.45242497789922","Target:  Shh <br>culture:  AE <br>ddCt:  -6.988695061 <br>RNA-Seq: -0.0922918177921022","Target:  Slc1a2 <br>culture:  AE <br>ddCt:  2.47176637806667 <br>RNA-Seq: 0.555805135748008","Target:  Slc1a3 <br>culture:  AE <br>ddCt:  1.132301416 <br>RNA-Seq: 0.508929435154106","Target:  Slc1a4 <br>culture:  AE <br>ddCt:  0.593665554333334 <br>RNA-Seq: 0.174646184503153","Target:  Slc6a11 <br>culture:  AE <br>ddCt:  4.69386855766667 <br>RNA-Seq: 2.83706392504871","Target:  Slc7a11 <br>culture:  AE <br>ddCt:  5.467586995 <br>RNA-Seq: 4.4871894099144","Target:  Smim12 <br>culture:  AE <br>ddCt:  0.00963401700000119 <br>RNA-Seq: -0.522916023898517","Target:  Sox9 <br>culture:  AE <br>ddCt:  -0.0125607454666658 <br>RNA-Seq: 0.697593529984109","Target:  Sparc <br>culture:  AE <br>ddCt:  -0.580043653666666 <br>RNA-Seq: -0.492482954415104","Target:  Sparcl1 <br>culture:  AE <br>ddCt:  2.10990377833333 <br>RNA-Seq: 0.911998437282203","Target:  Srbd1 <br>culture:  AE <br>ddCt:  0.0976476403333341 <br>RNA-Seq: -0.0655672202770066","Target:  Srp68 <br>culture:  AE <br>ddCt:  -0.0976476403333329 <br>RNA-Seq: -0.0256081916056847","Target:  Syt11 <br>culture:  AE <br>ddCt:  1.01392025246667 <br>RNA-Seq: 0.460439573608215","Target:  Thbs1 <br>culture:  AE <br>ddCt:  -3.42200539826667 <br>RNA-Seq: -0.30153552652793","Target:  Tln2 <br>culture:  AE <br>ddCt:  -1.44696693033333 <br>RNA-Seq: -0.440817202859173","Target:  Tnf <br>culture:  AE <br>ddCt:  -0.753650823666666 <br>RNA-Seq: 0.0888018632005441","Target:  Tnfrsf19 <br>culture:  AE <br>ddCt:  0.818232009666667 <br>RNA-Seq: 0.179889133654525","Target:  Vim <br>culture:  AE <br>ddCt:  -0.325481713133333 <br>RNA-Seq: -0.598326714768591","Target:  Zbtb20 <br>culture:  AE <br>ddCt:  -0.221912030333332 <br>RNA-Seq: 0.0935074772959418","Target:  eGFP <br>culture:  AE <br>ddCt:  4.65773795633333 <br>RNA-Seq: 0.737541201114097"],"type":"scatter","name":"AE","marker":{"color":"rgba(102,194,165,1)","line":{"color":"rgba(102,194,165,1)"}},"textfont":{"color":"rgba(102,194,165,1)"},"error_y":{"color":"rgba(102,194,165,1)"},"error_x":{"color":"rgba(102,194,165,1)"},"line":{"color":"rgba(102,194,165,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[-2.54877878033333,2.65842584233333,1.11653633833333,1.38917935313333,0.187551481533333,-2.38204562513333,-1.073452396,-2.28265969766667,0.0467877063333336,4.21925440433333,1.06238106366667,0.246284917533333,3.77232440633333,-3.05675242393333,0.850793596733334,-0.246459548333333,0.575472105,2.58061542033333,1.77838254733333,-0.436108220333334,2.26120719013333,-2.79839837386667,1.4224077322,0.197371349666667,4.61804516433333,0.298413663666667,2.47594438566667,1.930521089,-0.273167863666667,-2.35928181433333,0.419628588866666,1.18154798833333,0.419107759,-0.776623521666667,1.29733204026667,2.01876960766667,2.35920847653333,-3.258970947,-9.900796623,4.14492749826667,1.78925202846667,1.3446324886,5.8474935956,6.85331745593333,0.128940961666667,0.840332995400001,0.0527667323999996,3.19475567333333,0.0282235343333341,-0.0282235343333333,1.60074316826667,-3.75241486606667,-1.96113828566667,-1.03205395366667,2.849547325,-0.6464872472,0.787209311,6.44757532366667],"y":[-3.24102803576479,2.07269485089492,1.41890000550794,0.774661469902383,-0.0719095014666929,-3.39755005033455,-1.88912781327682,-2.40257746300226,0.156833460037795,3.98476618698455,1.18821733841244,-0.238997503106477,2.79395416417664,-3.68877656500765,-0.463378307048829,-1.51317767690799,-0.143534307167131,1.61506253185531,1.91011164652229,0.0270128018949737,1.11321423362791,-2.99720431526734,1.65261901268043,0.0332965602299855,1.17455375917578,0.0246521519051557,1.83585993358708,1.81362986424495,-0.72614147293874,-2.48764645454363,0.4765218928601,1.25286616509415,-0.961336141960253,-2.4435990937215,1.22234675482879,0.116921445898669,2.14573239078304,-3.54025507045475,-6.48987084422573,3.68278021278992,1.61348901050679,1.03180422281834,4.86060714358585,6.47087505058089,-0.425365172466472,1.17271133992979,-0.211981978605655,2.93845695811414,0.00918061631337689,-0.0354228241135968,1.27756337164948,-2.8371660228555,-1.94917814636222,-0.00127027337151419,2.32762908560117,-1.1480123262562,0.722590699018232,5.494421902088],"mode":"markers","text":["Target:  Adcy1 <br>culture:  AEN <br>ddCt:  -2.54877878033333 <br>RNA-Seq: -3.24102803576479","Target:  Aldoc <br>culture:  AEN <br>ddCt:  2.65842584233333 <br>RNA-Seq: 2.07269485089492","Target:  Appl2 <br>culture:  AEN <br>ddCt:  1.11653633833333 <br>RNA-Seq: 1.41890000550794","Target:  Aqp4 <br>culture:  AEN <br>ddCt:  1.38917935313333 <br>RNA-Seq: 0.774661469902383","Target:  Atp1b1 <br>culture:  AEN <br>ddCt:  0.187551481533333 <br>RNA-Seq: -0.0719095014666929","Target:  Ccnd1 <br>culture:  AEN <br>ddCt:  -2.38204562513333 <br>RNA-Seq: -3.39755005033455","Target:  Ccnd2 <br>culture:  AEN <br>ddCt:  -1.073452396 <br>RNA-Seq: -1.88912781327682","Target:  Cdk1 <br>culture:  AEN <br>ddCt:  -2.28265969766667 <br>RNA-Seq: -2.40257746300226","Target:  Clcn5 <br>culture:  AEN <br>ddCt:  0.0467877063333336 <br>RNA-Seq: 0.156833460037795","Target:  Cldn10 <br>culture:  AEN <br>ddCt:  4.21925440433333 <br>RNA-Seq: 3.98476618698455","Target:  Dapp1 <br>culture:  AEN <br>ddCt:  1.06238106366667 <br>RNA-Seq: 1.18821733841244","Target:  Emc7 <br>culture:  AEN <br>ddCt:  0.246284917533333 <br>RNA-Seq: -0.238997503106477","Target:  Ephb1 <br>culture:  AEN <br>ddCt:  3.77232440633333 <br>RNA-Seq: 2.79395416417664","Target:  Ephb2 <br>culture:  AEN <br>ddCt:  -3.05675242393333 <br>RNA-Seq: -3.68877656500765","Target:  Fabp7 <br>culture:  AEN <br>ddCt:  0.850793596733334 <br>RNA-Seq: -0.463378307048829","Target:  Fam43a <br>culture:  AEN <br>ddCt:  -0.246459548333333 <br>RNA-Seq: -1.51317767690799","Target:  Fzd1 <br>culture:  AEN <br>ddCt:  0.575472105 <br>RNA-Seq: -0.143534307167131","Target:  Fzd10 <br>culture:  AEN <br>ddCt:  2.58061542033333 <br>RNA-Seq: 1.61506253185531","Target:  Gja1 <br>culture:  AEN <br>ddCt:  1.77838254733333 <br>RNA-Seq: 1.91011164652229","Target:  Gli1 <br>culture:  AEN <br>ddCt:  -0.436108220333334 <br>RNA-Seq: 0.0270128018949737","Target:  Glul <br>culture:  AEN <br>ddCt:  2.26120719013333 <br>RNA-Seq: 1.11321423362791","Target:  Gpc4 <br>culture:  AEN <br>ddCt:  -2.79839837386667 <br>RNA-Seq: -2.99720431526734","Target:  Gsn <br>culture:  AEN <br>ddCt:  1.4224077322 <br>RNA-Seq: 1.65261901268043","Target:  Hars2 <br>culture:  AEN <br>ddCt:  0.197371349666667 <br>RNA-Seq: 0.0332965602299855","Target:  Hes5 <br>culture:  AEN <br>ddCt:  4.61804516433333 <br>RNA-Seq: 1.17455375917578","Target:  Hey1 <br>culture:  AEN <br>ddCt:  0.298413663666667 <br>RNA-Seq: 0.0246521519051557","Target:  Hey2 <br>culture:  AEN <br>ddCt:  2.47594438566667 <br>RNA-Seq: 1.83585993358708","Target:  Kalrn <br>culture:  AEN <br>ddCt:  1.930521089 <br>RNA-Seq: 1.81362986424495","Target:  Kcnj10 <br>culture:  AEN <br>ddCt:  -0.273167863666667 <br>RNA-Seq: -0.72614147293874","Target:  Mki67 <br>culture:  AEN <br>ddCt:  -2.35928181433333 <br>RNA-Seq: -2.48764645454363","Target:  Nfia <br>culture:  AEN <br>ddCt:  0.419628588866666 <br>RNA-Seq: 0.4765218928601","Target:  Nrp2 <br>culture:  AEN <br>ddCt:  1.18154798833333 <br>RNA-Seq: 1.25286616509415","Target:  Olig2 <br>culture:  AEN <br>ddCt:  0.419107759 <br>RNA-Seq: -0.961336141960253","Target:  Pdlim1 <br>culture:  AEN <br>ddCt:  -0.776623521666667 <br>RNA-Seq: -2.4435990937215","Target:  Pld2 <br>culture:  AEN <br>ddCt:  1.29733204026667 <br>RNA-Seq: 1.22234675482879","Target:  S100b <br>culture:  AEN <br>ddCt:  2.01876960766667 <br>RNA-Seq: 0.116921445898669","Target:  S1pr1 <br>culture:  AEN <br>ddCt:  2.35920847653333 <br>RNA-Seq: 2.14573239078304","Target:  Sema3c <br>culture:  AEN <br>ddCt:  -3.258970947 <br>RNA-Seq: -3.54025507045475","Target:  Shh <br>culture:  AEN <br>ddCt:  -9.900796623 <br>RNA-Seq: -6.48987084422573","Target:  Slc1a2 <br>culture:  AEN <br>ddCt:  4.14492749826667 <br>RNA-Seq: 3.68278021278992","Target:  Slc1a3 <br>culture:  AEN <br>ddCt:  1.78925202846667 <br>RNA-Seq: 1.61348901050679","Target:  Slc1a4 <br>culture:  AEN <br>ddCt:  1.3446324886 <br>RNA-Seq: 1.03180422281834","Target:  Slc6a11 <br>culture:  AEN <br>ddCt:  5.8474935956 <br>RNA-Seq: 4.86060714358585","Target:  Slc7a11 <br>culture:  AEN <br>ddCt:  6.85331745593333 <br>RNA-Seq: 6.47087505058089","Target:  Smim12 <br>culture:  AEN <br>ddCt:  0.128940961666667 <br>RNA-Seq: -0.425365172466472","Target:  Sox9 <br>culture:  AEN <br>ddCt:  0.840332995400001 <br>RNA-Seq: 1.17271133992979","Target:  Sparc <br>culture:  AEN <br>ddCt:  0.0527667323999996 <br>RNA-Seq: -0.211981978605655","Target:  Sparcl1 <br>culture:  AEN <br>ddCt:  3.19475567333333 <br>RNA-Seq: 2.93845695811414","Target:  Srbd1 <br>culture:  AEN <br>ddCt:  0.0282235343333341 <br>RNA-Seq: 0.00918061631337689","Target:  Srp68 <br>culture:  AEN <br>ddCt:  -0.0282235343333333 <br>RNA-Seq: -0.0354228241135968","Target:  Syt11 <br>culture:  AEN <br>ddCt:  1.60074316826667 <br>RNA-Seq: 1.27756337164948","Target:  Thbs1 <br>culture:  AEN <br>ddCt:  -3.75241486606667 <br>RNA-Seq: -2.8371660228555","Target:  Tln2 <br>culture:  AEN <br>ddCt:  -1.96113828566667 <br>RNA-Seq: -1.94917814636222","Target:  Tnf <br>culture:  AEN <br>ddCt:  -1.03205395366667 <br>RNA-Seq: -0.00127027337151419","Target:  Tnfrsf19 <br>culture:  AEN <br>ddCt:  2.849547325 <br>RNA-Seq: 2.32762908560117","Target:  Vim <br>culture:  AEN <br>ddCt:  -0.6464872472 <br>RNA-Seq: -1.1480123262562","Target:  Zbtb20 <br>culture:  AEN <br>ddCt:  0.787209311 <br>RNA-Seq: 0.722590699018232","Target:  eGFP <br>culture:  AEN <br>ddCt:  6.44757532366667 <br>RNA-Seq: 5.494421902088"],"type":"scatter","name":"AEN","marker":{"color":"rgba(252,141,98,1)","line":{"color":"rgba(252,141,98,1)"}},"textfont":{"color":"rgba(252,141,98,1)"},"error_y":{"color":"rgba(252,141,98,1)"},"error_x":{"color":"rgba(252,141,98,1)"},"line":{"color":"rgba(252,141,98,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[-0.923648206,1.10510540593333,0.358404632666667,0.770285669,0.5033491,-0.929240394466667,-0.430700793666666,-0.77392134,-0.778762529333333,1.46731928133333,0.478973636666667,0.1329454204,1.286670054,-0.445276155666667,-0.158171656666667,-0.666571578666667,1.04131958333333,1.75053626,1.20346982013333,0.510320342000001,0.737051488466666,-0.375804485133333,0.202052145666666,0.0523364300000004,1.79597073,0.5873710132,1.22956689066667,0.553843414666667,0.533013012466667,-1.00475460666667,0.3039419152,-0.199439764666667,0.542008237066667,-0.317063834666667,0.502662007666667,1.83954885286667,0.946128943733333,-0.311999692666667,-1.868522398,1.180408191,0.688407453666667,0.535102136666667,2.51823441133333,0.693352864666667,0.225551240000001,0.307324426533334,0.145248718666666,1.17436993673333,0.0691561633333337,-0.0691561633333336,0.3710056246,-0.504244901,-0.283117775333333,-1.598935196,1.96365259666667,-0.2877568656,0.6852027572,0.987047979999999],"y":[-0.833620739388172,1.12248574915958,0.241101819760998,0.742753907299444,0.580447171269884,-0.937218811147191,-0.338521988192918,-0.519611316823828,-0.727333470481427,1.24545895502098,0.318273556015303,0.123311117194453,0.810793099471548,-0.373189320104644,-0.0908010965880132,-1.05303430049474,0.855286698456114,1.82791421063067,1.17913998669187,0.197100497098357,0.305416921601048,-0.184667188108163,0.298694415330239,0.00284347706891908,-0.0477384775779433,0.51806644384168,1.06537579537468,0.0756555788871658,0.618077044935739,-0.721697099468275,0.398048281582724,-0.163037238648455,-0.177371993081826,-0.366434105208242,0.439345223481033,1.40130750836045,1.00324879610493,-0.0669719910453915,-1.5317808755015,1.05368318822018,0.713559089961759,0.477382519380916,1.682871310057,0.857938749570636,-0.105773032321251,0.291108877473361,0.197037730414645,0.957150486764143,0.03966700327547,-0.00963917523652208,0.312462166262698,-0.421791217597075,-0.171063846357219,-1.03278917655841,1.8429512862423,-0.383806087762664,0.61950342899039,0.810120789471433],"mode":"markers","text":["Target:  Adcy1 <br>culture:  AN <br>ddCt:  -0.923648206 <br>RNA-Seq: -0.833620739388172","Target:  Aldoc <br>culture:  AN <br>ddCt:  1.10510540593333 <br>RNA-Seq: 1.12248574915958","Target:  Appl2 <br>culture:  AN <br>ddCt:  0.358404632666667 <br>RNA-Seq: 0.241101819760998","Target:  Aqp4 <br>culture:  AN <br>ddCt:  0.770285669 <br>RNA-Seq: 0.742753907299444","Target:  Atp1b1 <br>culture:  AN <br>ddCt:  0.5033491 <br>RNA-Seq: 0.580447171269884","Target:  Ccnd1 <br>culture:  AN <br>ddCt:  -0.929240394466667 <br>RNA-Seq: -0.937218811147191","Target:  Ccnd2 <br>culture:  AN <br>ddCt:  -0.430700793666666 <br>RNA-Seq: -0.338521988192918","Target:  Cdk1 <br>culture:  AN <br>ddCt:  -0.77392134 <br>RNA-Seq: -0.519611316823828","Target:  Clcn5 <br>culture:  AN <br>ddCt:  -0.778762529333333 <br>RNA-Seq: -0.727333470481427","Target:  Cldn10 <br>culture:  AN <br>ddCt:  1.46731928133333 <br>RNA-Seq: 1.24545895502098","Target:  Dapp1 <br>culture:  AN <br>ddCt:  0.478973636666667 <br>RNA-Seq: 0.318273556015303","Target:  Emc7 <br>culture:  AN <br>ddCt:  0.1329454204 <br>RNA-Seq: 0.123311117194453","Target:  Ephb1 <br>culture:  AN <br>ddCt:  1.286670054 <br>RNA-Seq: 0.810793099471548","Target:  Ephb2 <br>culture:  AN <br>ddCt:  -0.445276155666667 <br>RNA-Seq: -0.373189320104644","Target:  Fabp7 <br>culture:  AN <br>ddCt:  -0.158171656666667 <br>RNA-Seq: -0.0908010965880132","Target:  Fam43a <br>culture:  AN <br>ddCt:  -0.666571578666667 <br>RNA-Seq: -1.05303430049474","Target:  Fzd1 <br>culture:  AN <br>ddCt:  1.04131958333333 <br>RNA-Seq: 0.855286698456114","Target:  Fzd10 <br>culture:  AN <br>ddCt:  1.75053626 <br>RNA-Seq: 1.82791421063067","Target:  Gja1 <br>culture:  AN <br>ddCt:  1.20346982013333 <br>RNA-Seq: 1.17913998669187","Target:  Gli1 <br>culture:  AN <br>ddCt:  0.510320342000001 <br>RNA-Seq: 0.197100497098357","Target:  Glul <br>culture:  AN <br>ddCt:  0.737051488466666 <br>RNA-Seq: 0.305416921601048","Target:  Gpc4 <br>culture:  AN <br>ddCt:  -0.375804485133333 <br>RNA-Seq: -0.184667188108163","Target:  Gsn <br>culture:  AN <br>ddCt:  0.202052145666666 <br>RNA-Seq: 0.298694415330239","Target:  Hars2 <br>culture:  AN <br>ddCt:  0.0523364300000004 <br>RNA-Seq: 0.00284347706891908","Target:  Hes5 <br>culture:  AN <br>ddCt:  1.79597073 <br>RNA-Seq: -0.0477384775779433","Target:  Hey1 <br>culture:  AN <br>ddCt:  0.5873710132 <br>RNA-Seq: 0.51806644384168","Target:  Hey2 <br>culture:  AN <br>ddCt:  1.22956689066667 <br>RNA-Seq: 1.06537579537468","Target:  Kalrn <br>culture:  AN <br>ddCt:  0.553843414666667 <br>RNA-Seq: 0.0756555788871658","Target:  Kcnj10 <br>culture:  AN <br>ddCt:  0.533013012466667 <br>RNA-Seq: 0.618077044935739","Target:  Mki67 <br>culture:  AN <br>ddCt:  -1.00475460666667 <br>RNA-Seq: -0.721697099468275","Target:  Nfia <br>culture:  AN <br>ddCt:  0.3039419152 <br>RNA-Seq: 0.398048281582724","Target:  Nrp2 <br>culture:  AN <br>ddCt:  -0.199439764666667 <br>RNA-Seq: -0.163037238648455","Target:  Olig2 <br>culture:  AN <br>ddCt:  0.542008237066667 <br>RNA-Seq: -0.177371993081826","Target:  Pdlim1 <br>culture:  AN <br>ddCt:  -0.317063834666667 <br>RNA-Seq: -0.366434105208242","Target:  Pld2 <br>culture:  AN <br>ddCt:  0.502662007666667 <br>RNA-Seq: 0.439345223481033","Target:  S100b <br>culture:  AN <br>ddCt:  1.83954885286667 <br>RNA-Seq: 1.40130750836045","Target:  S1pr1 <br>culture:  AN <br>ddCt:  0.946128943733333 <br>RNA-Seq: 1.00324879610493","Target:  Sema3c <br>culture:  AN <br>ddCt:  -0.311999692666667 <br>RNA-Seq: -0.0669719910453915","Target:  Shh <br>culture:  AN <br>ddCt:  -1.868522398 <br>RNA-Seq: -1.5317808755015","Target:  Slc1a2 <br>culture:  AN <br>ddCt:  1.180408191 <br>RNA-Seq: 1.05368318822018","Target:  Slc1a3 <br>culture:  AN <br>ddCt:  0.688407453666667 <br>RNA-Seq: 0.713559089961759","Target:  Slc1a4 <br>culture:  AN <br>ddCt:  0.535102136666667 <br>RNA-Seq: 0.477382519380916","Target:  Slc6a11 <br>culture:  AN <br>ddCt:  2.51823441133333 <br>RNA-Seq: 1.682871310057","Target:  Slc7a11 <br>culture:  AN <br>ddCt:  0.693352864666667 <br>RNA-Seq: 0.857938749570636","Target:  Smim12 <br>culture:  AN <br>ddCt:  0.225551240000001 <br>RNA-Seq: -0.105773032321251","Target:  Sox9 <br>culture:  AN <br>ddCt:  0.307324426533334 <br>RNA-Seq: 0.291108877473361","Target:  Sparc <br>culture:  AN <br>ddCt:  0.145248718666666 <br>RNA-Seq: 0.197037730414645","Target:  Sparcl1 <br>culture:  AN <br>ddCt:  1.17436993673333 <br>RNA-Seq: 0.957150486764143","Target:  Srbd1 <br>culture:  AN <br>ddCt:  0.0691561633333337 <br>RNA-Seq: 0.03966700327547","Target:  Srp68 <br>culture:  AN <br>ddCt:  -0.0691561633333336 <br>RNA-Seq: -0.00963917523652208","Target:  Syt11 <br>culture:  AN <br>ddCt:  0.3710056246 <br>RNA-Seq: 0.312462166262698","Target:  Thbs1 <br>culture:  AN <br>ddCt:  -0.504244901 <br>RNA-Seq: -0.421791217597075","Target:  Tln2 <br>culture:  AN <br>ddCt:  -0.283117775333333 <br>RNA-Seq: -0.171063846357219","Target:  Tnf <br>culture:  AN <br>ddCt:  -1.598935196 <br>RNA-Seq: -1.03278917655841","Target:  Tnfrsf19 <br>culture:  AN <br>ddCt:  1.96365259666667 <br>RNA-Seq: 1.8429512862423","Target:  Vim <br>culture:  AN <br>ddCt:  -0.2877568656 <br>RNA-Seq: -0.383806087762664","Target:  Zbtb20 <br>culture:  AN <br>ddCt:  0.6852027572 <br>RNA-Seq: 0.61950342899039","Target:  eGFP <br>culture:  AN <br>ddCt:  0.987047979999999 <br>RNA-Seq: 0.810120789471433"],"type":"scatter","name":"AN","marker":{"color":"rgba(141,160,203,1)","line":{"color":"rgba(141,160,203,1)"}},"textfont":{"color":"rgba(141,160,203,1)"},"error_y":{"color":"rgba(141,160,203,1)"},"error_x":{"color":"rgba(141,160,203,1)"},"line":{"color":"rgba(141,160,203,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

## Correlation Data

    ## # A tibble: 174 × 4
    ## # Groups:   culture [3]
    ##    culture Target mean_ddCt seq_lfc
    ##    <chr>   <chr>      <dbl>   <dbl>
    ##  1 AE      Adcy1     -1.52   -0.421
    ##  2 AE      Aldoc      1.88    0.286
    ##  3 AE      Appl2      0.293   0.529
    ##  4 AE      Aqp4       1.43    0.185
    ##  5 AE      Atp1b1    -0.208  -0.350
    ##  6 AE      Ccnd1     -1.31   -1.66 
    ##  7 AE      Ccnd2     -0.154  -0.435
    ##  8 AE      Cdk1      -0.279  -0.264
    ##  9 AE      Clcn5      0.476   0.268
    ## 10 AE      Cldn10     2.10    0.454
    ## # ℹ 164 more rows

# Correlation of RT-qPCR to uncorrected LFC from RNA-seq data

    ## # A tibble: 174 × 3
    ##    Target  culture seq_lfc
    ##    <chr>   <chr>     <dbl>
    ##  1 Slc7a11 AN       0.862 
    ##  2 Slc7a11 AE       5.68  
    ##  3 Slc7a11 AEN      6.86  
    ##  4 Ephb2   AN      -0.365 
    ##  5 Ephb2   AE      -2.44  
    ##  6 Ephb2   AEN     -3.28  
    ##  7 Sema3c  AN      -0.0662
    ##  8 Sema3c  AE      -3.12  
    ##  9 Sema3c  AEN     -3.28  
    ## 10 Slc1a2  AN       1.05  
    ## # ℹ 164 more rows

# Correlation with uncorrected RNA-seq Data

## AN Fit

    ## 
    ## Call:
    ## lm(formula = mean_ddCt ~ seq_lfc, data = uncor_corr_data %>% 
    ##     filter(culture == "AN"))
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -0.57507 -0.16617 -0.05160  0.04665  1.79807 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  0.05265    0.04669   1.128    0.264    
    ## seq_lfc      1.11889    0.06089  18.374   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.3342 on 56 degrees of freedom
    ## Multiple R-squared:  0.8577, Adjusted R-squared:  0.8552 
    ## F-statistic: 337.6 on 1 and 56 DF,  p-value: < 2.2e-16

## EA Fit

    ## 
    ## Call:
    ## lm(formula = mean_ddCt ~ seq_lfc, data = uncor_corr_data %>% 
    ##     filter(culture == "AE"))
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -0.77218 -0.05822  0.02721  0.09987  0.37234 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) -0.05990    0.02485   -2.41   0.0193 *  
    ## seq_lfc      1.02271    0.01166   87.68   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.1859 on 56 degrees of freedom
    ## Multiple R-squared:  0.9928, Adjusted R-squared:  0.9926 
    ## F-statistic:  7688 on 1 and 56 DF,  p-value: < 2.2e-16

## EAN Fit

    ## 
    ## Call:
    ## lm(formula = mean_ddCt ~ seq_lfc, data = uncor_corr_data %>% 
    ##     filter(culture == "AEN"))
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -0.86008 -0.20248 -0.08165  0.05933  1.73687 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  0.21707    0.05683    3.82 0.000337 ***
    ## seq_lfc      1.00193    0.02118   47.30  < 2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.4268 on 56 degrees of freedom
    ## Multiple R-squared:  0.9756, Adjusted R-squared:  0.9751 
    ## F-statistic:  2238 on 1 and 56 DF,  p-value: < 2.2e-16

# Plot of Correlation between RNA-seq and qPCR using uncorrected RNA-seq estimations

![](figures/qPCR_correlation_noCorrection-1.png)

# Environment

    ## R version 4.1.3 (2022-03-10)
    ## Platform: x86_64-apple-darwin17.0 (64-bit)
    ## Running under: macOS Big Sur/Monterey 10.16
    ## 
    ## Matrix products: default
    ## BLAS:   /Library/Frameworks/R.framework/Versions/4.1/Resources/lib/libRblas.0.dylib
    ## LAPACK: /Library/Frameworks/R.framework/Versions/4.1/Resources/lib/libRlapack.dylib
    ## 
    ## locale:
    ## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ## [1] plotly_4.10.1 ggplot2_3.4.2 stringr_1.5.0 tidyr_1.3.0   dplyr_1.1.2  
    ## [6] readxl_1.4.2 
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] RColorBrewer_1.1-3 highr_0.10         cellranger_1.1.0   pillar_1.9.0      
    ##  [5] compiler_4.1.3     tools_4.1.3        digest_0.6.31      lattice_0.21-8    
    ##  [9] nlme_3.1-162       viridisLite_0.4.1  jsonlite_1.8.4     evaluate_0.20     
    ## [13] lifecycle_1.0.3    tibble_3.2.1       gtable_0.3.3       mgcv_1.8-42       
    ## [17] pkgconfig_2.0.3    rlang_1.1.0        Matrix_1.5-4       cli_3.6.1         
    ## [21] rstudioapi_0.14    crosstalk_1.2.0    yaml_2.3.7         xfun_0.39         
    ## [25] fastmap_1.1.1      withr_2.5.0        httr_1.4.5         knitr_1.42        
    ## [29] generics_0.1.3     vctrs_0.6.2        htmlwidgets_1.6.2  webshot_0.5.4     
    ## [33] grid_4.1.3         tidyselect_1.2.0   glue_1.6.2         data.table_1.14.8 
    ## [37] R6_2.5.1           fansi_1.0.4        rmarkdown_2.21     farver_2.1.1      
    ## [41] purrr_1.0.1        magrittr_2.0.3     ellipsis_0.3.2     splines_4.1.3     
    ## [45] scales_1.2.1       htmltools_0.5.5    colorspace_2.1-0   labeling_0.4.2    
    ## [49] utf8_1.2.3         stringi_1.7.12     lazyeval_0.2.2     munsell_0.5.0
