context( "String" )

test_that( "String comparison works", {
  res <- test_compare_Strings( "aaa", "aab" )
  target <- list( 
    "a  < b" = TRUE, 
    "a  > b" = FALSE,  
    "a == b" = FALSE,
    "a == a" = TRUE
  )
  expect_equal( res, target )
})
             
test_that( "wstring are supported", {
  expect_equal( CharacterVector_wstring(), c("foobar", "foobar" ) )
  expect_equal( wstring_return(), "foo" )
  expect_equal( wstring_param( "foo", "bar" ), "foobar" )
  expect_equal( wrap_vector_wstring( ), c("foo", "bar" ) )
})

test_that( "String handles encoding #219", {
  a <- b <- "å"
  Encoding(a) <- "UTF-8"
  Encoding(b) <- "unknown"
  
  expect_true( String_encoding_equality(a,b) )  
})
