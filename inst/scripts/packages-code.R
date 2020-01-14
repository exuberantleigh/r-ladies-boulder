#install.packages(c("devtools", "roxygen2", "usethis", "knitr", spelling"))
library(devtools)  # devtools will load roxygen2 and usethis as dependencies
# library(roxygen2)
# library(usethis)

#--- unique path to package ----------------------------------------------------
#--- NOTE: use of "my" is a terrible practice is real life! --------------------
create_package("~/Desktop/rlb/toyPackage")
# Should not be within another R package, project, or git repo

# --- Connect to git and github ------------------------------------------------
use_git()
use_github()

# --- Generate on open source license ------------------------------------------

use_mit_license()
# use_gpl3_license()
# use_apl2_license()
# use_cc0_license()

# --- Create folder structure for unit tests------------------------------------

use_testthat()

#--- Create data folder --------------------------------------------------------

use_data_raw()

# --- Other bells and whistles -------------------------------------------------

use_spell_check()
use_news_md()
use_vignette("How to use this awesome package")
use_version()

# --- I have a package structure, now what? ------------------------------------

use_r("my_func")    # creates and opens R files, shortcut to open R files, ctrl + .
use_test("my_func")

# --- Tools to manage your DESCRIPTION and NAMESPACE ---------------------------
use_package("dplyr")
use_pipe()
use_tibble()

# --- I have a package with functions, now what? -------------------------------

check()    # cmd + shift + e
test()     # cmd + shift + t
document() # cmd + shift + d
# load_all, unlike source, functions/data are not dumped to your global environment
load_all() # cmd + shift + L
install()
# install.packages("path/to/package/folder", repos = NULL, type = "source")
