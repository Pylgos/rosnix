{
  bluez,
  buildPackages,
  buildRosPackage,
  cmake,
  dbus,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  libusb1,
  openssl,
  python3,
  python3Packages,
  substituteSource,
  zlib,
}:
let
  sources = rec {
    robotraconteur = substituteSource {
      src = fetchgit {
        name = "robotraconteur-source";
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
  src = sources.robotraconteur;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ python3 buildPackages.python3Packages.numpy buildPackages.python3Packages.setuptools ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bluez dbus libusb1 openssl python3 python3Packages.boost zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ gtest ];
  missingDependencies = [  ];
  meta = {
    description = "The robotraconteur package";
  };
}
