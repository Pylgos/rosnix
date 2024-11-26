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
  pname = "libcaer";
  version = "1.0.2-2";
  src = finalAttrs.passthru.sources."libcaer";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "pkg-config" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libusb-1.0-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libcaer" = substituteSource {
      src = fetchgit {
        name = "libcaer-source";
        url = "https://github.com/ros2-gbp/libcaer-release.git";
        rev = "f4ffb04ff39ae17193f09b04ab19e2cd4e96cb00";
        hash = "sha256-dwttE1L2vvosLFP5cMWaZTptd7PcE7Cb6Znyo9FB22o=";
      };
    };
  });
  meta = {
    description = "library for event based sensors";
  };
})
