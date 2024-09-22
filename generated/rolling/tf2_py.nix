{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python_cmake_module,
  rclpy,
  rosSystemPackages,
  rpyutils,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    tf2_py = substituteSource {
      src = fetchFromGitHub {
        name = "tf2_py-source";
        owner = "ros2-gbp";
        repo = "geometry2-release";
        rev = "410b0e646b74fd47195aee9b35573f6698e675ec";
        hash = "sha256-jb4d2AA/+0KmQBELol40hrrL2pcLiQD/Bp1ovQuqrlc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_py";
  version = "0.38.2-1";
  src = sources.tf2_py;
  nativeBuildInputs = [ ament_cmake python_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclpy rpyutils tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The tf2_py package";
  };
}
