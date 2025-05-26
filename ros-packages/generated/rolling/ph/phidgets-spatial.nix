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
  pname = "phidgets_spatial";
  version = "2.3.4-1";
  src = finalAttrs.passthru.sources."phidgets_spatial";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ launch phidgets-api rclcpp rclcpp-components sensor-msgs std-msgs std-srvs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api rclcpp rclcpp-components sensor-msgs std-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_spatial" = substituteSource {
      src = fetchgit {
        name = "phidgets_spatial-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "3d74240bc114467b791cbaef72ca33fcb0755a8b";
        hash = "sha256-+C+4cfF92B+XPVhIQfn0B+YTwH0a9Hcz+fUqvT69jHc=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Spatial 3/3/3 devices";
  };
})
