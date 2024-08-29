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
  mrpt_libbase,
  mrpt_libtclap,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    mola_launcher = substituteSource {
      src = fetchgit {
        name = "mola_launcher-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "9de03546f4242ee601a8495402f303359d65eeb2";
        hash = "sha256-HKPWZ3brQDYwBZSyP50bSlDEQm5M9VBiPwtV8HDd2xY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_launcher";
  version = "1.1.3-1";
  src = sources.mola_launcher;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_xmllint ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_kernel mrpt_libbase mrpt_libtclap ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Launcher app for MOLA systems";
  };
}
