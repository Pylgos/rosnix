{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  dynamixel_sdk,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  libyamlcpp,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    rt_manipulators_cpp = substituteSource {
      src = fetchgit {
        name = "rt_manipulators_cpp-source";
        url = "https://github.com/ros2-gbp/rt_manipulators_cpp-release.git";
        rev = "bb2d50792170208923b06cfb63055701e6f17baa";
        hash = "sha256-YUJkRUHMLukwe5vyCr9kFhmmkkBb/ezgelg3SKIop3w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rt_manipulators_cpp";
  version = "1.0.0-4";
  src = sources.rt_manipulators_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dynamixel_sdk libyamlcpp yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "RT Manipulators C++ Library";
  };
}
