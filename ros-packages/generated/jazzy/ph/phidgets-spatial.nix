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
  version = "2.3.3-2";
  src = finalAttrs.passthru.sources."phidgets_spatial";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api rclcpp rclcpp-components sensor-msgs std-msgs std-srvs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "phidgets_spatial" = substituteSource {
        src = fetchgit {
          name = "phidgets_spatial-source";
          url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
          rev = "089fa8bf3aade8c1a78df5c040bffa2c4ba35742";
          hash = "sha256-My63osp4yOvSPXWqo60ZVvGbG6cF/ApGd5AegiOUg/M=";
        };
      };
    });
  };
  meta = {
    description = "Driver for the Phidgets Spatial 3/3/3 devices";
  };
})
