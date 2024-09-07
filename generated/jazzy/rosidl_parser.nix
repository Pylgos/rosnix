{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rosidl_adapter,
  substituteSource,
}:
let
  sources = rec {
    rosidl_parser = substituteSource {
      src = fetchgit {
        name = "rosidl_parser-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "cfa2918fe3fba7824521c75587efdbf9699f3d42";
        hash = "sha256-/u0nPY8WCriPo5fUb/RNqTC4DMnbYtU0V+xV5Xmht4s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_parser";
  version = "4.6.4-1";
  src = sources.rosidl_parser;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.lark rosidl_adapter ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ python3Packages.lark rosidl_adapter ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The parser for `.idl` ROS interface files.";
  };
}
