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
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."autoware_cmake";
  propagatedNativeBuildInputs = [ ament-cmake-auto ament-lint-auto ros-environment ];
  propagatedBuildInputs = [ ament-cmake-auto ament-lint-auto ros-environment ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_cmake" = substituteSource {
      src = fetchgit {
        name = "autoware_cmake-source";
        url = "https://github.com/ros2-gbp/autoware_cmake-release.git";
        rev = "35f9ab39154ece2cd71151b18f4b566edc4fb7cc";
        hash = "sha256-/fPv+rpKR6hfXqNo9kOsu+5z6poyDvK3kOOujWfBq9o=";
      };
    };
  });
  meta = {
    description = "CMake scripts for Autoware";
  };
})
