{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_pycommon,
  substituteSource,
}:
let
  sources = rec {
    rosidl_cmake-0f5ee17083706de046e907372f66b137cf4615a8 = substituteSource {
      src = fetchgit {
        name = "rosidl_cmake-0f5ee17083706de046e907372f66b137cf4615a8-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "0f5ee17083706de046e907372f66b137cf4615a8";
        hash = "sha256-4caiKoxDJJ4Ke2FAxY3dHcBQKatOrivwGo826EkFYEA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_cmake";
  version = "4.8.1-1";
  src = sources.rosidl_cmake-0f5ee17083706de046e907372f66b137cf4615a8;
  nativeBuildInputs = [ ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake rosidl_pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-empy" ]; };
  buildInputs = [ ament_cmake_python ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake rosidl_pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-empy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The CMake functionality to invoke code generation for ROS interface files.";
  };
}
