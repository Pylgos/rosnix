{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  mola_common,
  mola_imu_preintegration,
  mola_kernel,
  mrpt_libobs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mola_navstate_fg-706010b8f68c58da55e60bf7f4bc895b3acbf1be = substituteSource {
      src = fetchgit {
        name = "mola_navstate_fg-706010b8f68c58da55e60bf7f4bc895b3acbf1be-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "706010b8f68c58da55e60bf7f4bc895b3acbf1be";
        hash = "sha256-ueZBXbUfcBoe9eqLISnU1KMJrMxvgUWdJCwPtI5HCQg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_navstate_fg";
  version = "1.2.0-1";
  src = sources.mola_navstate_fg-706010b8f68c58da55e60bf7f4bc895b3acbf1be;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gtsam mola_common mola_imu_preintegration mola_kernel mrpt_libobs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-chrono-dev" "libboost-date-time-dev" "libboost-filesystem-dev" "libboost-program-options-dev" "libboost-regex-dev" "libboost-serialization-dev" "libboost-system-dev" "libboost-thread-dev" "libboost-timer-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
}
