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
    mola_demos = substituteSource {
      src = fetchgit {
        name = "mola_demos-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "e57dedb9a5587c1c1639a33f63a7c3968a01412c";
        hash = "sha256-L7aIC7d82AW/iTLOe6xiCGaTswNHhm238C4jaXIo3Mk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_demos";
  version = "1.1.0-1";
  src = sources.mola_demos;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_xmllint ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Demo and example launch files for MOLA";
  };
}
