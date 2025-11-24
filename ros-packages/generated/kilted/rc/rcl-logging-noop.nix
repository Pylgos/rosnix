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
  version = "3.2.4-1";
  src = finalAttrs.passthru.sources."rcl_logging_noop";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-empy" ]; };
  propagatedNativeBuildInputs = [ rcl-logging-interface rcutils ];
  buildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-empy" ]; };
  propagatedBuildInputs = [ rcl-logging-interface rcutils ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_logging_noop" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_noop-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "c65af6a659b27a36885b99b4a7f13c9457e4577c";
        hash = "sha256-O8T9UTeMFlc2uNXB3ueCwH/HEI6bB31jS0tqsTKUQvc=";
      };
    };
  });
  meta = {
    description = "An rcl logger implementation that doesn't do anything with log messages.";
  };
})
