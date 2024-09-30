{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-pycommon,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rosidl_cmake" = substituteSource {
      src = fetchgit {
        name = "rosidl_cmake-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "0f5ee17083706de046e907372f66b137cf4615a8";
        hash = "sha256-4caiKoxDJJ4Ke2FAxY3dHcBQKatOrivwGo826EkFYEA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rosidl_cmake";
  version = "4.8.1-1";
  src = sources."rosidl_cmake";
  nativeBuildInputs = [ ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-empy" ]; };
  buildInputs = [ ament-cmake-python ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake rosidl-pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-empy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The CMake functionality to invoke code generation for ROS interface files.";
  };
}
