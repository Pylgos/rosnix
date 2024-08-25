{
  ament_cmake,
  ament_cmake_auto,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  ouxt_common,
  python3Packages,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    boost_geometry_util = substituteSource {
      src = fetchgit {
        name = "boost_geometry_util-source";
        url = "https://github.com/ros2-gbp/boost_geometry_util-release.git";
        rev = "e62a890a7f907b19266df8846abc46b3e92e291f";
        hash = "sha256-5P2YMX4buwUYt7NAF7FiWJguryH/I8GC2y+vIK5KI0w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "boost_geometry_util";
  version = "0.0.1-5";
  src = sources.boost_geometry_util;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs python3Packages.boost rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ouxt_common ];
  missingDependencies = [  ];
  meta = {
    description = "Utility library for boost geometry";
  };
}
