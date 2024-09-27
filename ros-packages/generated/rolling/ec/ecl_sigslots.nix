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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_sigslots-bf1c66ab1688b4bf9d7051d232c5142eceb2d7fa = substituteSource {
      src = fetchgit {
        name = "ecl_sigslots-bf1c66ab1688b4bf9d7051d232c5142eceb2d7fa-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "bf1c66ab1688b4bf9d7051d232c5142eceb2d7fa";
        hash = "sha256-c5lvTwI1CTmfeMKJsCuyr/ilN2KWeABt+RYdAxB9cdI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_sigslots";
  version = "1.2.1-4";
  src = sources.ecl_sigslots-bf1c66ab1688b4bf9d7051d232c5142eceb2d7fa;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_config ecl_license ecl_threads ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides a signal/slot mechanism (in the same vein as qt sigslots, boost::signals etc for intra-process communication. These include some improvements - they do not need a preprocessor, are fully type safe, allow for simple connections via a posix style string identifier and are multithread-safe.";
  };
}
