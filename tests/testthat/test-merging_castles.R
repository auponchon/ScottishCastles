test_that("merging works", {

    visit<-clean_names_castles(visits)
    loc<-clean_names_castles(locations)

    casty <- merge_castles(visit, loc,"img1","img2","img3","img4",reg)
    expect_true(tibble::is_tibble(casty))
    expect_equal(ncol(casty), 8)
})
