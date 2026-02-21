## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(rosario)

## -----------------------------------------------------------------------------
data("ex1")
ex1

## ----message = FALSE----------------------------------------------------------
rosario_shifts <- rosario(ex1[1,])
head(rosario_shifts)

## ----fig.width=7.5, fig.height=6----------------------------------------------
plot_rosario(ex1[1, ], cols = 5)

## -----------------------------------------------------------------------------
temp_overlap(ex1, method = "pianka")

#or

temp_overlap(ex1, method = "czekanowski")

## -----------------------------------------------------------------------------
set.seed(1)
mod <- get_null_model(ex1, method = "pianka", nsim = 100, parallel = FALSE)
mod$p_value

## -----------------------------------------------------------------------------
temp_overlap_plot(mod)

