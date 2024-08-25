{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rosidl_pycommon,
  substituteSource,
}:
let
  sources = rec {
    rosidl_cmake = substituteSource {
      src = fetchgit {
        name = "rosidl_cmake-source";
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
  src = sources.rosidl_cmake;
  nativeBuildInputs = [ ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_cmake buildPackages.python3Packages.empy rosidl_pycommon ];
  buildInputs = [ ament_cmake_python ];
  propagatedBuildInputs = [ ament_cmake python3Packages.empy rosidl_pycommon ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The CMake functionality to invoke code generation for ROS interface files.";
  };
}
