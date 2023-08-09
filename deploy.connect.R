#
#  pliu 2023-08-09
#
#  deploy Shiny App to connect.it.wisc.edu
#  - if deploy the first time, see README.mdi to connect via RStudio:
#  - please keep rsconnect/ folder so that updated app will be deployed under
#    the same appID and url as well as saving deployment time
#
#  Results:
#  - https://connect.doit.wisc.edu/content/26/
#

fapps = c( 'app.R', 'plt.R', 'inpl.rds' )

options(rsconnect.check.certificate = FALSE)

rsconnect::deployApp( appDir  = './',
                      appName = 'mock_Shiny',
                      appFiles = fapps,
                      account = 'pliu55', ## change to your wisc NetID
                      server  = 'connect.doit.wisc.edu' )
