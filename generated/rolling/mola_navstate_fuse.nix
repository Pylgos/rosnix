{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mola_imu_preintegration,
  mola_kernel,
  mrpt_libobs,
  substituteSource,
}:
let
  sources = rec {
    mola_navstate_fuse = substituteSource {
      src = fetchgit {
        name = "mola_navstate_fuse-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "d533c9bab64c74ee5d1b9581091e298d6e56f015";
        hash = "sha256-mG2+9WFv2xdX2viqBzV4ZlHmRFqDQ+WDpPAWrQG/FGw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_navstate_fuse";
  version = "1.1.3-1";
  src = sources.mola_navstate_fuse;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_imu_preintegration mola_kernel mrpt_libobs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
}
