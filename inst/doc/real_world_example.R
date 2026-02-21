## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, warning=FALSE, message=FALSE--------------------------------------
library(rosario)
library(dplyr)
library(lubridate)

## ----set-working-directory, eval = FALSE--------------------------------------
# options(timeout = 600)
# download.file("https://ndownloader.figshare.com/files/61985230", destfile = "Sim_data.csv", mode = "wb")

## ----eval = FALSE-------------------------------------------------------------
# Sim_dat <- read.csv("Sim_data.csv")
# head(Sim_dat)

## ----eval = FALSE-------------------------------------------------------------
# bin_species <- function(dat, species_code, bin_mins = 30) {
#   dat %>%
#     filter(species == species_code) %>%
#     mutate(
#       timestamp = mdy_hm(timestamp),
#       bin = floor_date(timestamp, "hour") +
#         minutes(floor(minute(timestamp) / bin_mins) * bin_mins),
#       hour_min_sec = format(as.POSIXct(bin), "%H:%M:%S")
#     ) %>%
#     count(hour_min_sec, name = "count") %>%
#     tidyr::pivot_wider(
#       names_from = hour_min_sec,
#       values_from = count,
#       values_fill = 0
#     )
# }

## ----eval = FALSE-------------------------------------------------------------
# mule_deer <- bin_species(Sim_dat, "hemionus")     # Mule deer
# elk      <- bin_species(Sim_dat, "canadensis")    # Elk
# wtd      <- bin_species(Sim_dat, "virginianus")   # White-tailed deer

## ----eval = FALSE-------------------------------------------------------------
# binned_df <- dplyr::bind_rows(
#   MuleDeer = mule_deer,
#   Elk      = elk,
#   WTD      = wtd,
#   .id = "species"
# )
# 
# # Convert to a numeric matrix (rows = species; columns = time bins)
# rownames(binned_df) <- binned_df$species
# data_matrix <- binned_df %>%
#   select(-species) %>%
#   mutate(across(everything(), as.numeric)) %>%
#   as.matrix()
# rownames(data_matrix) <- binned_df$species
# 
# dim(data_matrix)

## ----eval = FALSE-------------------------------------------------------------
# data_matrix_prop <- rescale_matrix(data_matrix)
# rowSums(data_matrix_prop)

## ----eval = FALSE-------------------------------------------------------------
# cervid_shifts <- rosario(data_matrix[1, ])  # example: generate shifts for Mule deer
# head(cervid_shifts)

## ----eval = FALSE-------------------------------------------------------------
# plot_rosario(data_matrix[1, ], cols = 5) # example: visualize shifts for Mule deer

## ----eval = FALSE-------------------------------------------------------------
# Results_Pianka <-temp_overlap(data_matrix, method = "pianka")
# Results_Pianka
# 
# Results_Czekanowski <-temp_overlap(data_matrix, method = "czekanowski")
# Results_Czekanowski

## ----eval = FALSE-------------------------------------------------------------
# set.seed(1)
# Null_Model_Pianka <- get_null_model(data_matrix, method = "pianka", nsim = 100, parallel = FALSE)
# Null_Model_Pianka$p_value
# 
# Null_Model_Czekanowski <- get_null_model(data_matrix, method = "czekanowski", nsim = 100, parallel = FALSE)
# Null_Model_Czekanowski$p_value

## ----eval = FALSE-------------------------------------------------------------
# temp_overlap_plot(Null_Model_Pianka)
# 
# temp_overlap_plot(Null_Model_Czekanowski)

