{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mola_imu_preintegration,
  mola_kernel,
  mrpt_libobs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mola_navstate_fuse = substituteSource {
      src = fetchgit {
        name = "mola_navstate_fuse-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "c63d11e4a214fe71fafe8ea188808bb008352c3c";
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_common mola_imu_preintegration mola_kernel mrpt_libobs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
}
