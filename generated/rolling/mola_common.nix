{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    mola_common = substituteSource {
      src = fetchgit {
        name = "mola_common-source";
        url = "https://github.com/ros2-gbp/mola_common-release.git";
        rev = "5ac43ad82c58ebe66a9ec65bf475744de841e42f";
        hash = "sha256-/Tdh6DToezWhDazCgDASE+Avu+8dWQAnzATlFBfVIQY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_common";
  version = "0.4.0-1";
  src = sources.mola_common;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_xmllint ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Common CMake scripts to all MOLA modules";
  };
}
