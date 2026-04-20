{
  ament-cmake-auto,
  buildAmentCmakePackage,
  cv-bridge,
  depthai-ros-msgs-v3,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  vision-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthai_filters_v3";
  version = "3.1.1-2";
  src = finalAttrs.passthru.sources."depthai_filters_v3";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ cv-bridge depthai-ros-msgs-v3 image-transport message-filters rclcpp rclcpp-components sensor-msgs vision-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ cv-bridge depthai-ros-msgs-v3 image-transport message-filters rclcpp rclcpp-components sensor-msgs vision-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "depthai_filters_v3" = substituteSource {
      src = fetchgit {
        name = "depthai_filters_v3-source";
        url = "https://github.com/luxonis/depthai-ros-v3-release.git";
        rev = "86caa3d92ca5f0c775c7875cac39906361725847";
        hash = "sha256-zGYKLx/gQ19FtAzFILe/dLl92SzPFnY9WMRbGBB4NBU=";
      };
    };
  });
  meta = {
    description = "Depthai filters package";
  };
})
