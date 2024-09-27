{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl_adapter,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rosidl_parser" = substituteSource {
      src = fetchgit {
        name = "rosidl_parser-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "cfa2918fe3fba7824521c75587efdbf9699f3d42";
        hash = "sha256-/u0nPY8WCriPo5fUb/RNqTC4DMnbYtU0V+xV5Xmht4s=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rosidl_parser";
  version = "4.6.4-1";
  src = sources."rosidl_parser";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_adapter ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-lark-parser" ]; };
  buildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_adapter ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lark-parser" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The parser for `.idl` ROS interface files.";
  };
}
