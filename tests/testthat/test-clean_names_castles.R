test_that("check variable names", {

    visits_clean <- clean_names_castles(visits)

    expect_named(visits, c("Name", "City", "County", "Visited"))
    expect_true(tibble::is_tibble(visits_clean))
    expect_equal(ncol(visits_clean), 4)


})
