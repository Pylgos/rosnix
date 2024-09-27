{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    libcaer-f4ffb04ff39ae17193f09b04ab19e2cd4e96cb00 = substituteSource {
      src = fetchgit {
        name = "libcaer-f4ffb04ff39ae17193f09b04ab19e2cd4e96cb00-source";
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
  src = sources.libcaer-f4ffb04ff39ae17193f09b04ab19e2cd4e96cb00;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libusb-1.0-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "library for event based sensors";
  };
}
