{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python_cmake_module,
  rclpy,
  rpyutils,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    tf2_py = substituteSource {
      src = fetchgit {
        name = "tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
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
  nativeBuildInputs = [ ament_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclpy rpyutils tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The tf2_py package";
  };
}
