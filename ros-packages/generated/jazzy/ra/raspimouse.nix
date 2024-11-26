{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  nav-msgs,
  raspimouse-msgs,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."raspimouse";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs lifecycle-msgs nav-msgs raspimouse-msgs rclcpp rclcpp-components rclcpp-lifecycle std-msgs std-srvs tf2 tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse" = substituteSource {
      src = fetchgit {
        name = "raspimouse-source";
        url = "https://github.com/ros2-gbp/raspimouse2-release.git";
        rev = "9f19aac7743212d1cd4d39554a797ab4394c2c0b";
        hash = "sha256-PY8swejilTE3aMAvKQSi8dMYKiTMghIN5eWau8FxiWQ=";
      };
    };
  });
  meta = {
    description = "RaspiMouse ROS 2 node";
  };
})