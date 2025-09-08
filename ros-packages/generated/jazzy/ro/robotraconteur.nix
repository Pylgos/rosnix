{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "robotraconteur";
  version = "1.2.6-1";
  src = finalAttrs.passthru.sources."robotraconteur";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "libbluetooth" "libbluetooth-dev" "libboost-atomic" "libboost-chrono" "libboost-date-time" "libboost-filesystem" "libboost-program-options" "libboost-random" "libboost-regex" "libboost-system" "libboost-thread" "libdbus-dev" "libssl-dev" "libusb-1.0" "libusb-1.0-dev" "python3" "python3-dev" "python3-numpy" "python3-setuptools" "zlib" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libbluetooth" "libbluetooth-dev" "libboost-atomic" "libboost-chrono" "libboost-date-time" "libboost-filesystem" "libboost-program-options" "libboost-random" "libboost-regex" "libboost-system" "libboost-thread" "libdbus-dev" "libssl-dev" "libusb-1.0" "libusb-1.0-dev" "python3" "python3-dev" "python3-numpy" "python3-setuptools" "zlib" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "robotraconteur" = substituteSource {
      src = fetchgit {
        name = "robotraconteur-source";
        url = "https://github.com/ros2-gbp/robotraconteur-release.git";
        rev = "3652422fc9b8a3276ed14f99e6c8088ca46c8d0f";
        hash = "sha256-DXpza5+W8S5YXjSnTcFQMcaLsMcWFgJDymhlOBrxt7A=";
      };
    };
  });
  meta = {
    description = "The robotraconteur package";
  };
})
