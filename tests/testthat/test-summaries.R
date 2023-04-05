test_that("ratio works", {
  expect_equal(
    ratio(tibble::as_tibble(mtcars), cyl),
    tibble::tribble(
      ~cyl, ~ratio,
      4, 0.34,
      6, 0.22,
      8, 0.44
    ),
    tolerance = 0.01,
  )
})

test_that("count and ratio works", {
  expect_equal(
    count_and_ratio(tibble::as_tibble(mtcars), cyl),
    tibble::tribble(
      ~cyl, ~n, ~ratio,
      4, 11, 0.34,
      6, 7, 0.22,
      8, 14, 0.44
    ),
    tolerance = 0.01,
  )
})
