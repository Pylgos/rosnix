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
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."robotraconteur";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" "python3-setuptools" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libbluetooth-dev" "libdbus-dev" "libssl-dev" "libusb-1.0-dev" "python3" "python3-numpy" "zlib" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "robotraconteur" = substituteSource {
      src = fetchgit {
        name = "robotraconteur-source";
        url = "https://github.com/ros2-gbp/robotraconteur-release.git";
        rev = "f51604d5db6bf1bca472264625b373fbd67bb55e";
        hash = "sha256-lwy+TIS4VQPImEpGmeQmWXZuZMifwRv9GfxdNiF3FGM=";
      };
    };
  });
  meta = {
    description = "The robotraconteur package";
  };
})
