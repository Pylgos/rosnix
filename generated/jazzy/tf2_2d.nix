{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclcpp,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    tf2_2d = substituteSource {
      src = fetchgit {
        name = "tf2_2d-source";
        url = "https://github.com/ros2-gbp/tf2_2d-release.git";
        rev = "0fc501d87112fe781ad6945eb8c997ac317dbdd4";
        hash = "sha256-4ty09wIhIUq3vI2s5th/54iRL5jTzcYeDumtwzLqeVk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_2d";
  version = "1.0.1-4";
  src = sources.tf2_2d;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen python3Packages.boost rclcpp tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A set of 2D geometry classes modeled after the 3D geometry classes in tf2.";
  };
}
