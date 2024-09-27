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
    rosidl_cmake-a003cbd7665f995804f8d856ecb01f3245a3c077 = substituteSource {
      src = fetchgit {
        name = "rosidl_cmake-a003cbd7665f995804f8d856ecb01f3245a3c077-source";
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
  src = sources.rosidl_cmake-a003cbd7665f995804f8d856ecb01f3245a3c077;
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
