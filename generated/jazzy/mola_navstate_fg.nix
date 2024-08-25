{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  mola_common,
  mola_imu_preintegration,
  mola_kernel,
  mrpt2,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    mola_navstate_fg = substituteSource {
      src = fetchgit {
        name = "mola_navstate_fg-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "650cb52b06f8148fa575b212a51f02b0cf15ca0f";
        hash = "sha256-joA7D0cBowzo3blx0HyPCESQ7S1V3SeDeQHnRdBs3ys=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_navstate_fg";
  version = "1.1.0-1";
  src = sources.mola_navstate_fg;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gtsam mola_common mola_imu_preintegration mola_kernel mrpt2 python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
}
