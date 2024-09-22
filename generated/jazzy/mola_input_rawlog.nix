{
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_kernel,
  mrpt_libobs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mola_input_rawlog = substituteSource {
      src = fetchFromGitHub {
        name = "mola_input_rawlog-source";
        owner = "ros2-gbp";
        repo = "mola-release";
        rev = "d8b973f01097f4604a3e79eb3c53378b5d57173f";
        hash = "sha256-0piDWRm9hnDz9+8h9VjRep22aBCiUdQfQ8VnUuHgeh4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_rawlog";
  version = "1.2.0-1";
  src = sources.mola_input_rawlog;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_kernel mrpt_libobs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Offline RawDataSource from MRPT rawlog datasets";
  };
}
