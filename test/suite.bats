#!/usr/bin/env bats


@test "post_push hook is up-to-date" {
  run sh -c "cat Makefile | grep $DOCKERFILE: \
                          | cut -d ':' -f 2 \
                          | cut -d '\\' -f 1 \
                          | tr -d ' '"
  [ "$status" -eq 0 ]
  [ "$output" != '' ]
  expected="$output"

  run sh -c "cat '$DOCKERFILE/hooks/post_push' \
               | grep 'for tag in' \
               | cut -d '{' -f 2 \
               | cut -d '}' -f 1"
  [ "$status" -eq 0 ]
  [ "$output" != '' ]
  actual="$output"

  [ "$actual" == "$expected" ]
}


@test "phpdoc is installed" {
  run docker run --rm --entrypoint sh $IMAGE -c 'which phpdoc'
  [ "$status" -eq 0 ]
}

@test "phpdoc runs ok" {
  run docker run --rm --entrypoint sh $IMAGE -c 'phpdoc -h'
  [ "$status" -eq 0 ]
}


@test "PHP ext 'iconv' is installed" {
  [ "$DOCKERFILE" == "1" ] && skip
  run docker run --rm --entrypoint sh $IMAGE -c 'php -m | grep -Fx iconv'
  [ "$status" -eq 0 ]
}

@test "PHP ext 'intl' is installed" {
  [ "$DOCKERFILE" == "1" ] && skip
  run docker run --rm --entrypoint sh $IMAGE -c 'php -m | grep -Fx intl'
  [ "$status" -eq 0 ]
}

@test "PHP ext 'xsl' is installed" {
  [ "$DOCKERFILE" == "1" ] && skip
  run docker run --rm --entrypoint sh $IMAGE -c 'php -m | grep -Fx xsl'
  [ "$status" -eq 0 ]
}

@test "PHP ext 'zip' is installed" {
  [ "$DOCKERFILE" == "1" ] && skip
  run docker run --rm --entrypoint sh $IMAGE -c 'php -m | grep -Fx zip'
  [ "$status" -eq 0 ]
}


@test "Graphviz library is installed" {
  [ "$DOCKERFILE" == "1" ] && skip
  run docker run --rm --entrypoint sh $IMAGE -c 'test -d /usr/lib/graphviz'
  [ "$status" -eq 0 ]
}

@test "Graphviz 'dot' utility is installed" {
  [ "$DOCKERFILE" == "1" ] && skip
  run docker run --rm --entrypoint sh $IMAGE -c 'which dot'
  [ "$status" -eq 0 ]
}

@test "Graphviz 'dot' utility runs ok" {
  [ "$DOCKERFILE" == "1" ] && skip
  run docker run --rm --entrypoint sh $IMAGE -c 'dot -?'
  [ "$status" -eq 0 ]
}


@test "PHP error_reporting level is E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED & E_WARNING" {
  [ "$DOCKERFILE" != "1" ] && skip
  run docker run --rm --entrypoint sh $IMAGE -c \
    'php -i | grep -Fx "error_reporting => 22517 => 22517"'
  [ "$status" -eq 0 ]
}
