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
        rev = "0b8e589caba181f7fb5cf1a454194d448dc88ade";
        hash = "sha256-feXyp5DwFitnQkJnc/xvpaVlWU4Al2f0nMyKQt2ejEo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_parser";
  version = "4.8.1-1";
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
