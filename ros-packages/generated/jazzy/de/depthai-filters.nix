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
  version = "2.10.3-1";
  src = finalAttrs.passthru.sources."depthai_filters";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ cv-bridge depthai-ros-msgs image-transport message-filters rclcpp rclcpp-components sensor-msgs vision-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "depthai_filters" = substituteSource {
      src = fetchgit {
        name = "depthai_filters-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "f72cd680978cbdb881fcd37dcf2deb02d52cd489";
        hash = "sha256-q9+XFs4sMG1UjyuGtfAzAqDt6XYb0RrfDRQvAgllJ0I=";
      };
    };
  });
  meta = {
    description = "Depthai filters package";
  };
})
