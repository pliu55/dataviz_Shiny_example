#!/usr/bin/env Rscript

#
#  pliu 20211031
#
#  deploy Shiny App to data-viz.it.wisc.edu
#  - if deploy the first time, need to connect via RStudio:
#    - runApp -> publish -> add account -> add server -> connect
#  - please keep rsconnect/ folder so that updated app will be deployed under
#    the same appID and url as well as saving deployment time
#
#  Results:
#  - https://data-viz.it.wisc.edu/content/223/
#

fapps = c( 'app.R', 'plt.R', 'inpl.rds' )

options(rsconnect.check.certificate = FALSE)

rsconnect::deployApp( appDir  = './',
                      appName = 'mock_Shiny',
                      appFiles = fapps,
                      account = 'pliu55', ## change to your wisc NetID
                      server  = 'data-viz.it.wisc.edu' )
