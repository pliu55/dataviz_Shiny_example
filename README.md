# A mini Shiny example

## Setup on [connect.doit.wisc.edu](https://connect.doit.wisc.edu) -- new service by DoIT 

This Shiny app is available at [here](https://connect.doit.wisc.edu/content/26)

To setup:

1. Contact rstudiosupport@office365.wisc.edu to request a __Connect__ (not __Workbench__) account
2. Login [connect.doit.wisc.edu](https://connect.doit.wisc.edu) and follow instructions there to connect to your local machine to the __Connect__ service. Specifically, on MacOS, you may need to
   1. (Optional) Set the environmental variable `$RSTUDIO_WHICH_R` to specify the R binary to use
   2. Start RStudio. (If you have set `$RSTUDIO_WHICH_R` above, RStudio needs to be opened from a terminal by `open -na Rstudio`)
   3. In RStudio's Preferences panel: Publishing -> Connect -> Posit Connect -> enter `connect.doit.wisc.edu` -> Next -> Click the `Connect` button on the pop-up website -> Click `Connect Account` button in RStuido -> Click `OK` button in RStudio
4. Edit `deploy.connect.R` (not `deploy.data-viz.R`) to change the account name, `pliu55`, to your own wisc NetID
5. Run `deploy.connect.R` to deploy this app


## Setup on [data-viz.it.wisc.edu](https://data-viz.it.wisc.edu/) -- service to-be-expired on 2023-08-31

This Shiny app is available at [here](https://data-viz.it.wisc.edu/content/223/)

To setup:

1. Contact rstudiosupport@office365.wisc.edu to request an account on the UW
   RStudio Connect service
2. Follow instructions on [data-viz.it.wisc.edu](https://data-viz.it.wisc.edu) to connect to your account using
   RStudio. On MacOS, you may need to
   1. (Optional) Set the environmental variable `$RSTUDIO_WHICH_R` to specify the R binary to use
   2. Open RStudio. If you have set `$RSTUDIO_WHICH_R` above, RStudio needs to be opened from a terminal by `open -na Rstudio`
   3. In RStudio's Preferences panel: Publishing -> Connect -> RStudio Connect -> enter `data-viz.it.wisc.edu` -> Next -> confirm on data-viz's website -> confirm on RStudio
3. Edit `deploy.data-viz.R` to change the account name, `pliu55`, to your own wisc NetID
4. Run `deploy.data-viz.R` to deploy this app


## Migration from [data-viz.it.wisc.edu](https://data-viz.it.wisc.edu) to [connect.doit.wisc.edu](https://connect.doit.wisc.edu)

See instructions from [here](https://connect.doit.wisc.edu/migration_instructions/)

