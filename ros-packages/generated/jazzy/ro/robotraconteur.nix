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
    robotraconteur-ee1fbebc5e9d29bcb6250b83c47f98316cee882d = substituteSource {
      src = fetchgit {
        name = "robotraconteur-ee1fbebc5e9d29bcb6250b83c47f98316cee882d-source";
        url = "https://github.com/ros2-gbp/robotraconteur-release.git";
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
  src = sources.robotraconteur-ee1fbebc5e9d29bcb6250b83c47f98316cee882d;
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
