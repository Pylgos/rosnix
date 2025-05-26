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
  version = "2.3.4-1";
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
        rev = "0b7bfc6bcfff0c554f1f3e3814b7e03f273fec86";
        hash = "sha256-39iZHN6Ey1Pyk8u5jd1ucp1h4lE3Wr5R1GnZmnBNKv0=";
      };
    };
  });
  meta = {
    description = "A C++ Wrapper for the Phidgets C API";
  };
})
