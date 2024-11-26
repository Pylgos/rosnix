{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-msgs,
  irobot-create-toolbox,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-action,
  rcutils,
  ros-gz-interfaces,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_gz_toolbox";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."irobot_create_gz_toolbox";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs irobot-create-msgs irobot-create-toolbox nav-msgs rclcpp rclcpp-action rcutils ros-gz-interfaces sensor-msgs std-msgs tf2 tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "irobot_create_gz_toolbox" = substituteSource {
      src = fetchgit {
        name = "irobot_create_gz_toolbox-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "b324bdab0659ed27178ce3a1a681dc8ea2231cd6";
        hash = "sha256-EuWsOYAT03YXB0qK8b7hhlSNgcPT3MfcMHWXVS+H1CA=";
      };
    };
  });
  meta = {
    description = "Nodes and tools for simulating in Ignition iRobot(R) Create(R) 3 Educational Robot.";
  };
})
