{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-interpolation,
  autoware-lint-common,
  autoware-perception-msgs,
  autoware-utils-geometry,
  autoware-utils-math,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pcl-conversions,
  pcl-ros,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_object_recognition_utils";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_object_recognition_utils";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-interpolation autoware-perception-msgs autoware-utils-geometry autoware-utils-math geometry-msgs pcl-conversions pcl-ros rclcpp sensor-msgs std-msgs tf2 tf2-eigen ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-interpolation autoware-perception-msgs autoware-utils-geometry autoware-utils-math geometry-msgs pcl-conversions pcl-ros rclcpp sensor-msgs std-msgs tf2 tf2-eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_object_recognition_utils" = substituteSource {
      src = fetchgit {
        name = "autoware_object_recognition_utils-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "f9ededccd0dc0464eb5288b634ea4e0a0e18dba9";
        hash = "sha256-dE8jj8Di4u0VHOf0wDaVih0pXuBtj770jFewr4035AU=";
      };
    };
  });
  meta = {
    description = "The autoware_object_recognition_utils package";
  };
})
