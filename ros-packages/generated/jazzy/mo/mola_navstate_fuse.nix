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
    mola_navstate_fuse-808b9fb33b56945dee567552da4742d10c8d05f8 = substituteSource {
      src = fetchgit {
        name = "mola_navstate_fuse-808b9fb33b56945dee567552da4742d10c8d05f8-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "808b9fb33b56945dee567552da4742d10c8d05f8";
        hash = "sha256-p37HW/+v5T4mKnI1SZXjCuNmHqNhwu0Brw8LfWV/m0M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_navstate_fuse";
  version = "1.2.0-1";
  src = sources.mola_navstate_fuse-808b9fb33b56945dee567552da4742d10c8d05f8;
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
