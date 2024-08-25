{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  console-bridge,
  console_bridge_vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  rcpputils,
  substituteSource,
}:
let
  sources = rec {
    class_loader = substituteSource {
      src = fetchgit {
        name = "class_loader-source";
        url = "https://github.com/ros2-gbp/class_loader-release.git";
        rev = "769259c0b275d43eccf56c3ad2c5a0b7f9bfe0f1";
        hash = "sha256-VkYLe2iawf0S5dULWUBCq93K3PyWEyiwiARhE8Y5cMM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "class_loader";
  version = "2.7.0-3";
  src = sources.class_loader;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ console-bridge console_bridge_vendor rcpputils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The class_loader package is a ROS-independent package for loading plugins during runtime and the foundation of the higher level ROS \"pluginlib\" library. class_loader utilizes the host operating system's runtime loader to open runtime libraries (e.g. .so/.dll files), introspect the library for exported plugin classes, and allows users to instantiate objects of these exported classes without the explicit declaration (i.e. header file) for those classes.";
  };
}
