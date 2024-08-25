{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libusb1,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    lusb = substituteSource {
      src = fetchgit {
        name = "lusb-source";
        url = "https://github.com/DataspeedInc-release/lusb-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libusb1 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Library for interfacing to USB devices";
  };
}
