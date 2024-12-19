{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl_logging_interface";
  version = "3.1.1-1";
  src = finalAttrs.passthru.sources."rcl_logging_interface";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcutils ];
  checkInputs = [ ament-lint-auto ament-lint-common rcpputils ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_logging_interface" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_interface-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "e069b5f3e9c487f57fc978c0ba5cdf2b2a2c15d5";
        hash = "sha256-xzyCeOjwOUQyy6/EzxL6NRMy+QyzE5/DP9MEBrCkYHM=";
      };
    };
  });
  meta = {
    description = "Interface that rcl_logging backends needs to implement.";
  };
})
