{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mola_kernel,
  mrpt_libmath,
  mrpt_libobs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mola_input_euroc_dataset-df8b3f381d42225e0e8a03f36bdbd4848cc00e52 = substituteSource {
      src = fetchgit {
        name = "mola_input_euroc_dataset-df8b3f381d42225e0e8a03f36bdbd4848cc00e52-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "df8b3f381d42225e0e8a03f36bdbd4848cc00e52";
        hash = "sha256-GXNSYASRlkoaQ75ahKzXusE47N5LLNdG4jvBwbeELFI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_euroc_dataset";
  version = "1.2.0-1";
  src = sources.mola_input_euroc_dataset-df8b3f381d42225e0e8a03f36bdbd4848cc00e52;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_common mola_kernel mrpt_libmath mrpt_libobs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Offline RawDataSource from EUROC SLAM datasets";
  };
}
