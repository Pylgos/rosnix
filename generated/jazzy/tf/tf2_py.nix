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
  rosSystemPackages,
  rpyutils,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    tf2_py-22c2b92c6a7e4e4c8bd5efc270e79169c44ef8e9 = substituteSource {
      src = fetchgit {
        name = "tf2_py-22c2b92c6a7e4e4c8bd5efc270e79169c44ef8e9-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "22c2b92c6a7e4e4c8bd5efc270e79169c44ef8e9";
        hash = "sha256-e1+9fb5F1BhljMWTl9g6uvKXX2MFX1U7Vi4m3YjK93k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_py";
  version = "0.36.4-1";
  src = sources.tf2_py-22c2b92c6a7e4e4c8bd5efc270e79169c44ef8e9;
  nativeBuildInputs = [ ament_cmake python_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclpy tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The tf2_py package";
  };
}
