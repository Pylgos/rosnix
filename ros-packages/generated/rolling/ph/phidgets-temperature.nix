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
  version = "2.3.4-1";
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
        rev = "ffc47a9e55a375c6d432d6b760947f6fc11dbaff";
        hash = "sha256-0kQhhVSGaMjSN6l+HHEXwH1dmT4tUBkGnAvI+dUXT94=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Temperature devices";
  };
})
