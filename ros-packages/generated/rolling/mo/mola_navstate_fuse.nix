{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola_common,
  mola_imu_preintegration,
  mola_kernel,
  mrpt_libobs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "mola_navstate_fuse" = substituteSource {
      src = fetchgit {
        name = "mola_navstate_fuse-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "284342909b34654f82afcbd1ec6ef339c7569df4";
        hash = "sha256-p37HW/+v5T4mKnI1SZXjCuNmHqNhwu0Brw8LfWV/m0M=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mola_navstate_fuse";
  version = "1.2.0-1";
  src = sources."mola_navstate_fuse";
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
