{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  ouxt-lint-common,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "quaternion_operation";
  version = "0.0.7-5";
  src = finalAttrs.passthru.sources."quaternion_operation";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ geometry-msgs rclcpp tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ouxt-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "quaternion_operation" = substituteSource {
      src = fetchgit {
        name = "quaternion_operation-source";
        url = "https://github.com/ros2-gbp/quaternion_operation-release.git";
        rev = "5caa679fcf2a9098a3c9fb91fe47c62b4006baf6";
        hash = "sha256-EOoZrowJNVGtJNutD+5WlSgVWbmOGlzSJyvsALmfji8=";
      };
    };
  });
  meta = {
    description = "The quaternion_operation package";
  };
})
