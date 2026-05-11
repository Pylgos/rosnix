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
  version = "3.2.0-1";
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
        rev = "7dba13d2ed63aa673232bd1680401b81170b730e";
        hash = "sha256-7vPahJ8PJkS5gcTTSi3/2FY6hswelI1P5pTv11kYlyY=";
      };
    };
  });
  meta = {
    description = "Depthai filters package";
  };
})
