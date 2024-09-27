{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  sophus,
  substituteSource,
}:
let
  sources = rec {
    beluga-5a4b604ada6fee862adc8b71acd5e7a8b76ad2bd = substituteSource {
      src = fetchgit {
        name = "beluga-5a4b604ada6fee862adc8b71acd5e7a8b76ad2bd-source";
        url = "https://github.com/ros2-gbp/beluga-release.git";
        rev = "5a4b604ada6fee862adc8b71acd5e7a8b76ad2bd";
        hash = "sha256-z5Drm8uEZ590QUMtDES+CD3DJd7gm0OYs542R0quhY8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "beluga";
  version = "2.0.2-1";
  src = sources.beluga-5a4b604ada6fee862adc8b71acd5e7a8b76ad2bd;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ sophus ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libhdf5-dev" "range-v3" "tbb" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" "clang-format" "clang-tidy" "gtest" "libgmock-dev" ]; };
  meta = {
    description = "A generic MCL library for ROS2.";
  };
}
