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
  version = "3.1.0-2";
  src = finalAttrs.passthru.sources."rcl_logging_interface";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcutils ];
  checkInputs = [ ament-lint-auto ament-lint-common rcpputils ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rcl_logging_interface" = substituteSource {
        src = fetchgit {
          name = "rcl_logging_interface-source";
          url = "https://github.com/ros2-gbp/rcl_logging-release.git";
          rev = "0f02a66b68786b02e070f4e4a90d73f26f115413";
          hash = "sha256-r7WviMcNX31Wz2qwm6JYMErRwdpCCnHYKsXyqBxrTrc=";
        };
      };
    });
  };
  meta = {
    description = "Interface that rcl_logging backends needs to implement.";
  };
})
