{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_cmake";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."autoware_cmake";
  propagatedNativeBuildInputs = [ ament-cmake-auto ament-lint-auto ros-environment ];
  propagatedBuildInputs = [ ament-cmake-auto ament-lint-auto ros-environment ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_cmake" = substituteSource {
      src = fetchgit {
        name = "autoware_cmake-source";
        url = "https://github.com/ros2-gbp/autoware_cmake-release.git";
        rev = "11618febe49a21293b5fcabff96b11d5315e6e57";
        hash = "sha256-QftFf1uphG9Xpxz8sDZVlvwSR9rqz+rj1dygEEWIZqg=";
      };
    };
  });
  meta = {
    description = "CMake scripts for Autoware";
  };
})
