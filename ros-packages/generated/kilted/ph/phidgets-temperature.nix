{
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  phidgets-api,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "phidgets_temperature";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."phidgets_temperature";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ launch phidgets-api rclcpp rclcpp-components std-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api rclcpp rclcpp-components std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_temperature" = substituteSource {
      src = fetchgit {
        name = "phidgets_temperature-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "a83b846c58a663ef81ffefb4f419b076d0bee6fb";
        hash = "sha256-VLGMFEQok4Nvug9gwpWgFYkbVxcc9GuDUPvJ47MwTOs=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Temperature devices";
  };
})
