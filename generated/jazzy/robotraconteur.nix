{
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
    robotraconteur = substituteSource {
      src = fetchFromGitHub {
        name = "robotraconteur-source";
        owner = "ros2-gbp";
        repo = "robotraconteur-release";
        rev = "ee1fbebc5e9d29bcb6250b83c47f98316cee882d";
        hash = "sha256-lwy+TIS4VQPImEpGmeQmWXZuZMifwRv9GfxdNiF3FGM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robotraconteur";
  version = "1.2.2-1";
  src = sources.robotraconteur;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" "python3-numpy" "python3-setuptools" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libbluetooth-dev" "libdbus-dev" "libssl-dev" "libusb-1.0-dev" "python3" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  meta = {
    description = "The robotraconteur package";
  };
}
