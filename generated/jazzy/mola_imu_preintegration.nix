{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt_libobs,
  substituteSource,
}:
let
  sources = rec {
    mola_imu_preintegration = substituteSource {
      src = fetchgit {
        name = "mola_imu_preintegration-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "6b09d41b676c86f79410658cb30bc7849d326496";
        hash = "sha256-jOGsHgHD8ececCAVu5y0cjNGXfavMrrkqtnImlKI8ZQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_imu_preintegration";
  version = "1.1.3-1";
  src = sources.mola_imu_preintegration;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mrpt_libobs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Integrator of IMU angular velocity readings";
  };
}
