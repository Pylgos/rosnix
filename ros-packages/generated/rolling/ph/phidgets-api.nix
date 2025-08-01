{
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libphidget22,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "phidgets_api";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."phidgets_api";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ libphidget22 ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ libphidget22 ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_api" = substituteSource {
      src = fetchgit {
        name = "phidgets_api-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "f88525f8ededae43beaf33e9aa82aea10a722d01";
        hash = "sha256-K1PNmWPOjzvj9QBICOyH+eGF07F5Iz1Xg2bmJLxw0ZE=";
      };
    };
  });
  meta = {
    description = "A C++ Wrapper for the Phidgets C API";
  };
})
