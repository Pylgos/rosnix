{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt_libobs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mola_imu_preintegration-126bd367225626b96d1448e5e64ee8884ef5f478 = substituteSource {
      src = fetchgit {
        name = "mola_imu_preintegration-126bd367225626b96d1448e5e64ee8884ef5f478-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "126bd367225626b96d1448e5e64ee8884ef5f478";
        hash = "sha256-EWrctG8g4yWs7i4/MLeTHcPJhsVP8O6nt6oBIE7qZjc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_imu_preintegration";
  version = "1.2.0-1";
  src = sources.mola_imu_preintegration-126bd367225626b96d1448e5e64ee8884ef5f478;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_common mrpt_libobs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Integrator of IMU angular velocity readings";
  };
}
