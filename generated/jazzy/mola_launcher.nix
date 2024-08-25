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
  mola_kernel,
  mrpt2,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    mola_launcher = substituteSource {
      src = fetchgit {
        name = "mola_launcher-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "0f977ec4bb5f7e2ef758b3346c4637ed3c1aafd2";
        hash = "sha256-nQC558fmH6+rMaVCb1C8HmKkIev/VhpUuiybkLeEbRs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_launcher";
  version = "1.1.0-1";
  src = sources.mola_launcher;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_xmllint ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_kernel mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Launcher app for MOLA systems";
  };
}
