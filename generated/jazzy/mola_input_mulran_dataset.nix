{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mola_kernel,
  mrpt_libmaps,
  mrpt_libposes,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mola_input_mulran_dataset = substituteSource {
      src = fetchgit {
        name = "mola_input_mulran_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "54d1ecfb8924086e97ec68a259c4c2edf89bbb91";
        hash = "sha256-5ZZM31stsOUUcsnzLePMsjHS4CDPs5HHvqGEvMA9BZk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_mulran_dataset";
  version = "1.2.0-1";
  src = sources.mola_input_mulran_dataset;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_common mola_kernel mrpt_libmaps mrpt_libposes ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Offline RawDataSource from MulRan datasets";
  };
}
