{
  buildRosPackage,
  clang,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  gbenchmark,
  gmock,
  gtest,
  hdf5,
  sophus,
  substituteSource,
  tbb,
}:
let
  sources = rec {
    beluga = substituteSource {
      src = fetchgit {
        name = "beluga-source";
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
  src = sources.beluga;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen hdf5 sophus tbb ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ clang gbenchmark gmock gtest ];
  missingDependencies = [ "range-v3" ];
  meta = {
    description = "A generic MCL library for ROS2.";
  };
}
