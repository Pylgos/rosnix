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
  version = "2.0.0-2";
  src = finalAttrs.passthru.sources."raspimouse";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs lifecycle-msgs nav-msgs raspimouse-msgs rclcpp rclcpp-components rclcpp-lifecycle std-msgs std-srvs tf2 tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs lifecycle-msgs nav-msgs raspimouse-msgs rclcpp rclcpp-components rclcpp-lifecycle std-msgs std-srvs tf2 tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse" = substituteSource {
      src = fetchgit {
        name = "raspimouse-source";
        url = "https://github.com/ros2-gbp/raspimouse2-release.git";
        rev = "a1b4e26599a4367ebe9551429bd1e9adad3ad38a";
        hash = "sha256-PY8swejilTE3aMAvKQSi8dMYKiTMghIN5eWau8FxiWQ=";
      };
    };
  });
  meta = {
    description = "RaspiMouse ROS 2 node";
  };
})
