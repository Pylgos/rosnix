{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mola_imu_preintegration = substituteSource {
      src = fetchgit {
        name = "mola_imu_preintegration-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "e2fbe1a94d9b959de9292ea4cab1d23258f152d3";
        hash = "sha256-j+6bqUE0nxAGzLLUQdMSirTd82IXWrAZvAHEJ3QDTLY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_imu_preintegration";
  version = "1.1.0-1";
  src = sources.mola_imu_preintegration;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Integrator of IMU angular velocity readings";
  };
}
