{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  clips-vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_utils";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."cx_utils";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ clips-vendor rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "spdlog" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clips-vendor rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "spdlog" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cx_utils" = substituteSource {
      src = fetchgit {
        name = "cx_utils-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "04336b7d22daeb5284e1800dffa801d14d9f7514";
        hash = "sha256-tn4z4fbbR10PeP5BPL2BEKeGzXpoV6EOjrIXY6g0B60=";
      };
    };
  });
  meta = {
    description = "Utilities for the ROS2 CLIPS-Executive";
  };
})
