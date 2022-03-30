setlocal enableDelayedExpansion
set WORKSPACE=BEFORE
(
  set WORKSPACE=AFTER
  echo Normal Expansion = %WORKSPACE%
  echo Delayed Expansion = !WORKSPACE!
)
