#!/usr/bin/env bats


@test "PHP ext 'iconv' is installed" {
  run docker run --rm --entrypoint sh $IMAGE -c 'php -m | grep iconv'
  [ "$status" -eq 0 ]
}

@test "PHP ext 'intl' is installed" {
  run docker run --rm --entrypoint sh $IMAGE -c 'php -m | grep intl'
  [ "$status" -eq 0 ]
}

@test "PHP ext 'xsl' is installed" {
  run docker run --rm --entrypoint sh $IMAGE -c 'php -m | grep xsl'
  [ "$status" -eq 0 ]
}


@test "Graphviz library is installed" {
  run docker run --rm --entrypoint sh $IMAGE -c 'test -d /usr/lib/graphviz'
  [ "$status" -eq 0 ]
}

@test "Graphviz 'dot' utility is installed" {
  run docker run --rm --entrypoint sh $IMAGE -c 'which dot'
  [ "$status" -eq 0 ]
}

@test "Graphviz 'dot' utility runs ok" {
  run docker run --rm --entrypoint sh $IMAGE -c 'dot -?'
  [ "$status" -eq 0 ]
}


@test "post_push hook is up-to-date" {
  run sh -c "cat Makefile | grep 'TAGS ?= ' | cut -d ' ' -f 3"
  [ "$status" -eq 0 ]
  [ ! "$output" = '' ]
  expected="$output"

  run sh -c "cat hooks/post_push | grep 'for tag in' | cut -d '{' -f 2 | cut -d '}' -f 1"
  [ "$status" -eq 0 ]
  [ ! "$output" = '' ]
  actual="$output"

  [ "$actual" = "$expected" ]
}
