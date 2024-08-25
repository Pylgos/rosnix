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
        rev = "2614864434f193b3b71076744337419a0138df7e";
        hash = "sha256-1I50K0T66XY1/1i+VW6N5U4GBE+IO0PgoXOTokA/MHI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_parser";
  version = "4.6.3-1";
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
