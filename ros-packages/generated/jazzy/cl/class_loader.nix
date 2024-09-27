{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  console_bridge_vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  rcpputils,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    class_loader-769259c0b275d43eccf56c3ad2c5a0b7f9bfe0f1 = substituteSource {
      src = fetchgit {
        name = "class_loader-769259c0b275d43eccf56c3ad2c5a0b7f9bfe0f1-source";
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
  src = sources.class_loader-769259c0b275d43eccf56c3ad2c5a0b7f9bfe0f1;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ console_bridge_vendor rcpputils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libconsole-bridge-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The class_loader package is a ROS-independent package for loading plugins during runtime and the foundation of the higher level ROS \"pluginlib\" library. class_loader utilizes the host operating system's runtime loader to open runtime libraries (e.g. .so/.dll files), introspect the library for exported plugin classes, and allows users to instantiate objects of these exported classes without the explicit declaration (i.e. header file) for those classes.";
  };
}
