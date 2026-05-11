{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-agnocast-wrapper,
  autoware-cmake,
  autoware-lint-common,
  autoware-vehicle-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_vehicle_velocity_converter";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_vehicle_velocity_converter";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-agnocast-wrapper autoware-vehicle-msgs geometry-msgs rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-agnocast-wrapper autoware-vehicle-msgs geometry-msgs rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_vehicle_velocity_converter" = substituteSource {
      src = fetchgit {
        name = "autoware_vehicle_velocity_converter-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "55cd2ceeb98e0ed8f76dcbed0b873cf0d1016725";
        hash = "sha256-JeKiXXW6Hh+9dIFHdsYZoVQcFoU+B/6kUzeKfF8qeWg=";
      };
    };
  });
  meta = {
    description = "The autoware_vehicle_velocity_converter package";
  };
})
