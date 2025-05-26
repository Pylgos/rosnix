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
        rev = "066222aa97a40a77394d22313f40b68ca0cc9fc2";
        hash = "sha256-39iZHN6Ey1Pyk8u5jd1ucp1h4lE3Wr5R1GnZmnBNKv0=";
      };
    };
  });
  meta = {
    description = "A C++ Wrapper for the Phidgets C API";
  };
})
