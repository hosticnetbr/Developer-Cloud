#!/usr/bin/env bash

set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo
echo "========================================"
echo " Developer Cloud Test Suite"
echo "========================================"
echo

FAILED=0

for TEST in $(find "$ROOT/tests" -name "*.test.sh" | sort)
do
    echo "▶ $(basename "$TEST")"

    if bash "$TEST"
    then
        echo "   ✔ OK"
    else
        echo "   ✘ FAILED"
        FAILED=1
    fi

    echo
done

if [[ $FAILED -eq 0 ]]
then
    echo "Todos os testes passaram."
else
    echo "Existem testes com falha."
fi

exit $FAILED
