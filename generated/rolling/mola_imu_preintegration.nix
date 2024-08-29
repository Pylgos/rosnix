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
        rev = "b4f4a6f319a1de7b88afb69d58c851dbf44f584f";
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
