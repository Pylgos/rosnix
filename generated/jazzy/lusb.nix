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
    lusb = substituteSource {
      src = fetchFromGitHub {
        name = "lusb-source";
        owner = "DataspeedInc-release";
        repo = "lusb-release";
        rev = "37d85f008df91a5f6e79482a7538328264e1993d";
        hash = "sha256-SD5KijVFijbNlJHhaYmWwiZUZ9DLVPLymvxKIj2AuoE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lusb";
  version = "2.0.2-1";
  src = sources.lusb;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libusb-1.0-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Library for interfacing to USB devices";
  };
}
