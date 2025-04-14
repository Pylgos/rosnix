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
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."autoware_cmake";
  propagatedNativeBuildInputs = [ ament-cmake-auto ament-lint-auto ros-environment ];
  propagatedBuildInputs = [ ament-cmake-auto ament-lint-auto ros-environment ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_cmake" = substituteSource {
      src = fetchgit {
        name = "autoware_cmake-source";
        url = "https://github.com/ros2-gbp/autoware_cmake-release.git";
        rev = "8c222d216c4dbc3036d51cefcaaadad87c5e64c7";
        hash = "sha256-7HG0M4rqf9+xRDFjewtbi9Bsc2WNqOeHzt/KMY0t0BI=";
      };
    };
  });
  meta = {
    description = "CMake scripts for Autoware";
  };
})
