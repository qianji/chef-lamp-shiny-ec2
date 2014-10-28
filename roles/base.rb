name "base"
description "Base role applied to all nodes."
run_list(
  #"recipe[users::sysadmins]",
  "recipe[sudo]",
  "recipe[apt]",
  "recipe[git]",
  "recipe[build-essential]",
  "recipe[vim]",
  #"recipe[rstudio::shiny]",
  #"recipe[rstudio::server]"
) 
override_attributes(
  :authorization => {
    :sudo => {
      :users => ["ubuntu", "vagrant"],
      :passwordless => true
    }
  }
)
