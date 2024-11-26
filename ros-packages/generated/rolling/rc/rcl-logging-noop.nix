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
  version = "3.2.2-1";
  src = finalAttrs.passthru.sources."rcl_logging_noop";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-empy" ]; };
  propagatedBuildInputs = [ rcl-logging-interface rcutils ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common launch-testing ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rcl_logging_noop" = substituteSource {
        src = fetchgit {
          name = "rcl_logging_noop-source";
          url = "https://github.com/ros2-gbp/rcl_logging-release.git";
          rev = "31c929d69f73eacc3310ff50b7de3da2da0eeb6b";
          hash = "sha256-2pJ/id1j4yATVc02tUOuKww3hq/Gv4gXAk69FNrc6iA=";
        };
      };
    });
  };
  meta = {
    description = "An rcl logger implementation that doesn't do anything with log messages.";
  };
})
