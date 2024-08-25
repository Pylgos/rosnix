{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  libusb1,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    libcaer = substituteSource {
      src = fetchgit {
        name = "libcaer-source";
        url = "https://github.com/ros2-gbp/libcaer-release.git";
        rev = "f4ffb04ff39ae17193f09b04ab19e2cd4e96cb00";
        hash = "sha256-dwttE1L2vvosLFP5cMWaZTptd7PcE7Cb6Znyo9FB22o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libcaer";
  version = "1.0.2-2";
  src = sources.libcaer;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libusb1 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "library for event based sensors";
  };
}
