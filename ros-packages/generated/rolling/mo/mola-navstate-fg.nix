{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  mkSourceSet,
  mola-common,
  mola-imu-preintegration,
  mola-kernel,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "mola_navstate_fg" = substituteSource {
      src = fetchgit {
        name = "mola_navstate_fg-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "b2b9992be53670bf967b5697e7d239e49c71258a";
        hash = "sha256-hF47MOqOMRAdiB4tTvtVgWd+joy9HjnYpwjJB/fu/qk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mola_navstate_fg";
  version = "1.2.1-1";
  src = sources."mola_navstate_fg";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gtsam mola-common mola-imu-preintegration mola-kernel mrpt-libobs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-chrono-dev" "libboost-date-time-dev" "libboost-filesystem-dev" "libboost-program-options-dev" "libboost-regex-dev" "libboost-serialization-dev" "libboost-system-dev" "libboost-thread-dev" "libboost-timer-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
}
