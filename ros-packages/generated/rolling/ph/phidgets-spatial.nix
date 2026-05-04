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
  version = "2.4.0-2";
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
        rev = "db98619cf89a8c9f1c907b7ac5400c78e30f2b19";
        hash = "sha256-YZ8z7QslbdSU+xuGZa6CBlYMN8g3iq9t72PFSvYZbvA=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Spatial 3/3/3 devices";
  };
})
