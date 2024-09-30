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
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "irobot_create_gz_toolbox" = substituteSource {
      src = fetchgit {
        name = "irobot_create_gz_toolbox-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "ada75bad2e41122c32af63843c74f5826fdf816b";
        hash = "sha256-VYTMIj+MLARWxYH91hYlU3sej6qrAsoHZfKHrmJGx/w=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "irobot_create_gz_toolbox";
  version = "3.0.2-2";
  src = sources."irobot_create_gz_toolbox";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ control-msgs irobot-create-msgs irobot-create-toolbox nav-msgs rclcpp rclcpp-action rcutils ros-gz-interfaces sensor-msgs std-msgs tf2 tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Nodes and tools for simulating in Ignition iRobot(R) Create(R) 3 Educational Robot.";
  };
}
