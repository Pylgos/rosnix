{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  hls-lfcd-lds-driver,
  joy-linux,
  mkSourceSet,
  nav2-map-server,
  raspimouse,
  raspimouse-msgs,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  rt-usb-9axisimu-driver,
  sensor-msgs,
  slam-toolbox,
  std-msgs,
  std-srvs,
  substituteSource,
  usb-cam,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse_ros2_examples";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."raspimouse_ros2_examples";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs hls-lfcd-lds-driver joy-linux nav2-map-server raspimouse raspimouse-msgs rclcpp rclcpp-components rclcpp-lifecycle rt-usb-9axisimu-driver sensor-msgs slam-toolbox std-msgs std-srvs usb-cam ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" "v4l-utils" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_ros2_examples" = substituteSource {
      src = fetchgit {
        name = "raspimouse_ros2_examples-source";
        url = "https://github.com/ros2-gbp/raspimouse_ros2_examples-release.git";
        rev = "2d3d11b6b458438b092fc43cfc498f8608b5df51";
        hash = "sha256-ZnoUjM3+5Xzjs16/tDed38YeZ8padd0IfZB/GRzI1xM=";
      };
    };
  });
  meta = {
    description = "Raspberry Pi Mouse examples";
  };
})
