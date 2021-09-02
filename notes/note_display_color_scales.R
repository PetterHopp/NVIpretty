# Taken mostly from https://tradeblotter.wordpress.com/2013/02/28/the-paul-tol-21-color-salute/

# Function for plotting colors side-by-side
pal <- function(col, border = "light gray", ...){
  n <- length(col)
  title <- deparse(substitute(col))
  plot(0, 0, type="n", xlim = c(0, 1), ylim = c(0, 1),
       axes = FALSE, main=title,xlab = "", ylab = "", ...)
  rect(0:(n-1)/n, 0, 1:n/n, 1, col = col, border = border)
}

# Function for plotting colors as pie
palpie <- function(col)
{
  par(mar=c(1,1,1,1))
  ones <- rep(1, length=length(col))
  names(ones) <- col
  
  title <- deparse(substitute(col))
  
  pie(ones, col=col, cex=1, main = title)
  par(mar=c(5.1, 4.1, 4.1, 2.1))
}

########## DEFINE Color palettes #########

#From Paul Tol: https://personal.sron.nl/~pault/
Tol_bright <- c('#EE6677', '#228833', '#4477AA', '#CCBB44', '#66CCEE', '#AA3377', '#BBBBBB')

# 
Tol_muted <- c('#88CCEE', '#44AA99', '#117733', '#332288', '#DDCC77', '#999933','#CC6677', '#882255', '#AA4499', '#DDDDDD')

# Denne brukes i kart nå, litt blass, men fin i Excel
Tol_light <- c('#BBCC33', '#AAAA00', '#77AADD', '#EE8866', '#EEDD88', '#FFAABB', '#99DDFF', '#44BB99', '#DDDDDD')

#From Color Universal Design (CUD): https://jfly.uni-koeln.de/color/
Okabe_Ito <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7", "#000000")

# From Katie
Katie <- c("#D55E00","#E69F00","#F0E442","#56B4E9","#009E73","black","grey")

# Others
ECDC <- c("#65B32E","#7CBDC4","#C0D236","#3E5B84","#008C75","#82428D","#E8683F","#B81A5D")

colorBlindBlack8  <- c("#000000", "#E69F00", "#56B4E9", "#009E73", 
                       "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
colorBlindGrey8   <- c("#999999", "#E69F00", "#56B4E9", "#009E73", 
                       "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
safe_colorblind_palette <- c("#88CCEE", "#CC6677", "#DDCC77", "#117733", "#332288", "#AA4499", 
                             "#44AA99", "#999933", "#882255", "#661100", "#6699CC", "#888888")


########################## SHOW as multiple strips ###################
par(mfrow=c(3,3))

pal(Okabe_Ito)
pal(Tol_bright)
pal(Tol_muted)
pal(Tol_light)
pal(Katie)
pal(ECDC)
pal(colorBlindBlack8)
pal(colorBlindGrey8)
pal(safe_colorblind_palette )


########################## SHOW as multiple PIE Charts ###################
par(mfrow=c(3,3))

palpie(Okabe_Ito)
palpie(Tol_bright)
palpie(Tol_muted)
palpie(Tol_light)
palpie(Katie)
palpie(ECDC)
palpie(colorBlindBlack8)
palpie(colorBlindGrey8)
palpie(safe_colorblind_palette )


########################## SHOW as single PIE Chart ###################
par(mfrow=c(1,1))

palpie(Okabe_Ito)
palpie(Tol_bright)
palpie(Tol_muted)
palpie(Tol_light)
palpie(Katie)
palpie(ECDC)
palpie(colorBlindBlack8)
palpie(colorBlindGrey8)
palpie(safe_colorblind_palette )



