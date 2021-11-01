require(data.table)
require(magrittr)
require(Matrix)
require(ggplot2)

inpl = readRDS('inpl.rds')

pltMrgExpr <- function(input) {
    shiny::req(input$dim_type)
    shiny::req(input$mrg_expr_gnnames)

    rdmdt = getMrgRDMData(input$dim_type)
    pltdt = getGnsExpr(inpl$exprmat, input$mrg_expr_gnnames) %>%
            merge(rdmdt, by='cell', all=TRUE) %>% .[order(expr)]

    p = ggplot(pltdt, aes(x=crdx, y=crdy, color=expr)) +
        geom_point(shape=16, size=3, stroke=1) + theme_classic() + 
        scale_color_gradientn( 
            name='total\ngene\nexpression\nlevel',
            colors= rev(RColorBrewer::brewer.pal(11, 'RdYlBu')) ) + 
        xlab(paste0(input$dim_type, ' dimension 1')) +
        ylab(paste0(input$dim_type, ' dimension 2'))

    return(p)
}

pltMrgByBatch <- function(input) {
    shiny::req(input$dim_type)
    pltdt = getMrgRDMData(input$dim_type)

    p = ggplot(pltdt, aes(x=crdx, y=crdy, color=treatment)) +
        geom_point(shape=16, size=3, stroke=1) + theme_classic() + 
        scale_color_discrete(name='Treatment') + 
        xlab(paste0(input$dim_type, ' dimension 1')) +
        ylab(paste0(input$dim_type, ' dimension 2'))

    return(p)
}

getMrgRDMData <- function(dim_type) {
    dimtype = tolower(dim_type) %>% gsub('-', '', .)
    inpl$rdmdt[, c('cell', 'treatment', paste0(dimtype, 1:2)), with=FALSE] %>%
    setnames(3:4, c('crdx', 'crdy')) %>%
    return()
}

getGnsExpr <- function(exprmat, gnnames) {
    expr_vec = exprmat[gnnames, ]
    if ( length(gnnames) > 1 ) expr_vec = colSums(expr_vec)

    data.table(cell=names(expr_vec), expr=expr_vec) %>% return()
}
