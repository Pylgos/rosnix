{
  ament_cmake,
  ament_cmake_auto,
  ament_lint_auto,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  ouxt_common,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    boost_geometry_util = substituteSource {
      src = fetchFromGitHub {
        name = "boost_geometry_util-source";
        owner = "ros2-gbp";
        repo = "boost_geometry_util-release";
        rev = "0bd80646060cacb6f6f79ac0727f9399856bc2fb";
        hash = "sha256-5P2YMX4buwUYt7NAF7FiWJguryH/I8GC2y+vIK5KI0w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "boost_geometry_util";
  version = "0.0.1-4";
  src = sources.boost_geometry_util;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ouxt_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Utility library for boost geometry";
  };
}
