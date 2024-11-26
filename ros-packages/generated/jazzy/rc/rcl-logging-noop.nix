{
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  mkSourceSet,
  rcl-logging-interface,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl_logging_noop";
  version = "3.1.0-2";
  src = finalAttrs.passthru.sources."rcl_logging_noop";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-empy" ]; };
  propagatedBuildInputs = [ rcl-logging-interface rcutils ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_logging_noop" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_noop-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "423b070d9aea34e99dacd881947dfdbeb124c159";
        hash = "sha256-XpmOGX13xXUHBOzLXAuAXWun1j/BzpliZo8V4xX5T94=";
      };
    };
  });
  meta = {
    description = "An rcl logger implementation that doesn't do anything with log messages.";
  };
})
