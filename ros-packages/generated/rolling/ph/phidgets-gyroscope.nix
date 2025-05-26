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
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "phidgets_gyroscope";
  version = "2.3.4-1";
  src = finalAttrs.passthru.sources."phidgets_gyroscope";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ launch phidgets-api rclcpp rclcpp-components sensor-msgs std-msgs std-srvs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api rclcpp rclcpp-components sensor-msgs std-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_gyroscope" = substituteSource {
      src = fetchgit {
        name = "phidgets_gyroscope-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "c99502cae445ac67e33a4be58c092c59c2652786";
        hash = "sha256-BeLAY/xcSwxua6J4yGssCfoS2+yJUfZxpn0nET6O3cw=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Gyroscope devices";
  };
})
