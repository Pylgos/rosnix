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
    robotraconteur-f51604d5db6bf1bca472264625b373fbd67bb55e = substituteSource {
      src = fetchgit {
        name = "robotraconteur-f51604d5db6bf1bca472264625b373fbd67bb55e-source";
        url = "https://github.com/ros2-gbp/robotraconteur-release.git";
        rev = "f51604d5db6bf1bca472264625b373fbd67bb55e";
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
  src = sources.robotraconteur-f51604d5db6bf1bca472264625b373fbd67bb55e;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" "python3-setuptools" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libbluetooth-dev" "libdbus-dev" "libssl-dev" "libusb-1.0-dev" "python3" "python3-numpy" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  meta = {
    description = "The robotraconteur package";
  };
}
