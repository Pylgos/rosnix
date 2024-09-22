{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_license = substituteSource {
      src = fetchFromGitHub {
        name = "ecl_license-source";
        owner = "ros2-gbp";
        repo = "ecl_tools-release";
        rev = "6cac334990aa3f48432e60c033a56aa590a79261";
        hash = "sha256-7IkZyQJw9go1s2je+YLPGemSTMtC8PNA66qCC6akU6w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_license";
  version = "1.0.3-5";
  src = sources.ecl_license;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Maintains the ecl licenses and also provides an install target for deploying licenses with the ecl libraries.";
  };
}
