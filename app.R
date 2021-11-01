require(shiny)
require(shinydashboard)

source('plt.R')

header = dashboardHeader(title='a Shiny example')

sidebar = sidebarMenu(
    radioButtons( inputId  = 'dim_type',
                  label    = 'choose a layout:',
                  choices  = c('tSNE', 'UMAP'),
                  inline   = TRUE,
                  selected = 'tSNE' ),
    menuItem('Merged: Treat1 & Treat2', tabName='Merged')
) %>% dashboardSidebar()

body_mrg = fluidRow( 
    box(title='A. by treatment',  width=6, collapsible=TRUE, 
        plotOutput('mrg_by_batch') ),

    box(title='B. gene expression ', width=6, collapsible=TRUE,
        selectizeInput( 
            inputId  = 'mrg_expr_gnnames',
            label  = 'gene(s) to display (gene names: Gene_0001 to Gene_0100):',
            choices  = NULL,
            multiple = TRUE ),
        plotOutput('mrg_expr') )
)

serverMrg <- function(input, output, session) {
    updateSelectizeInput( session,
                          inputId  = 'mrg_expr_gnnames',
                          choices  = sort(rownames(inpl$exprmat)),
                          selected = c('Gene_0001', 'Gene_0002', 'Gene_0100'),
                          server   = TRUE )
    
    output$mrg_by_batch = renderPlot(pltMrgByBatch(input))
    output$mrg_expr     = renderPlot(pltMrgExpr(input))
}

body = tabItems(
    tabItem(tabName = 'Merged',
            h4('Analysis of Treat1 and Treat2 samples',align='center'),
            body_mrg )
) %>% dashboardBody()


server <- function(input, output, session) {
    serverMrg(input, output, session)
}

ui = dashboardPage(header, sidebar, body)

shinyApp(ui=ui, server=server)
