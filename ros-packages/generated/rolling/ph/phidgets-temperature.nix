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
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."phidgets_temperature";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api rclcpp rclcpp-components std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "phidgets_temperature" = substituteSource {
        src = fetchgit {
          name = "phidgets_temperature-source";
          url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
          rev = "0d528bffa077cfd054f76adf15e1481258f3b906";
          hash = "sha256-AUCf5/QLj4oi3q8yB/SIYcdPJoog9kG0irWiQraVKgQ=";
        };
      };
    });
  };
  meta = {
    description = "Driver for the Phidgets Temperature devices";
  };
})
