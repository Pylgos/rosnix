{
  ament-cmake-auto,
  buildAmentCmakePackage,
  cv-bridge,
  depthai-ros-msgs,
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
  pname = "depthai_filters";
  version = "3.0.7-1";
  src = finalAttrs.passthru.sources."depthai_filters";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ cv-bridge depthai-ros-msgs image-transport message-filters rclcpp rclcpp-components sensor-msgs vision-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ cv-bridge depthai-ros-msgs image-transport message-filters rclcpp rclcpp-components sensor-msgs vision-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "depthai_filters" = substituteSource {
      src = fetchgit {
        name = "depthai_filters-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "7356b90bfbb389f8209bfcc605e95f78d6a0f388";
        hash = "sha256-/wzDi26XRaICk6FPipBBupxk4AScO1E1YRoY99Dz9v0=";
      };
    };
  });
  meta = {
    description = "Depthai filters package";
  };
})
