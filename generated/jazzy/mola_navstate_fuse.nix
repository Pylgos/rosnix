{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mola_imu_preintegration,
  mola_kernel,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mola_navstate_fuse = substituteSource {
      src = fetchgit {
        name = "mola_navstate_fuse-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "0835d0faf5f07f602c7553bc4de482c2e6220576";
        hash = "sha256-PQsBaKHhsJrCw1Hs/OysuklUGf+vyoEavJ62nvDAkDY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_navstate_fuse";
  version = "1.1.0-1";
  src = sources.mola_navstate_fuse;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_imu_preintegration mola_kernel mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
}
