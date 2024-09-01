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
        rev = "1f5ee7c892f026a96f5cab09961b0622ef6f5f4c";
        hash = "sha256-TATkY16Ygvjapj2LsTtV0TxnVp37lOfJddAYTTuaCqE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rt_manipulators_cpp";
  version = "1.1.0-1";
  src = sources.rt_manipulators_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dynamixel_sdk eigen libyamlcpp yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "RT Manipulators C++ Library";
  };
}
