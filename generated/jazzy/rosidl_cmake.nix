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
        rev = "a003cbd7665f995804f8d856ecb01f3245a3c077";
        hash = "sha256-aCwffyruQROE+FYmTQdkdKA3SYXXi8PJIe9CrlJbqUc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_cmake";
  version = "4.6.4-1";
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
