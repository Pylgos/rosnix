{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_license,
  ecl_threads,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_sigslots = substituteSource {
      src = fetchgit {
        name = "ecl_sigslots-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "3538d06591cc853d4e0cdef4e822477bd8125aac";
        hash = "sha256-c5lvTwI1CTmfeMKJsCuyr/ilN2KWeABt+RYdAxB9cdI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_sigslots";
  version = "1.2.1-5";
  src = sources.ecl_sigslots;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_license ecl_threads ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Provides a signal/slot mechanism (in the same vein as qt sigslots, boost::signals etc for intra-process communication. These include some improvements - they do not need a preprocessor, are fully type safe, allow for simple connections via a posix style string identifier and are multithread-safe.";
  };
}
