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
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."phidgets_api";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ libphidget22 ];
  passthru = {
    sources = mkSourceSet (sources: {
      "phidgets_api" = substituteSource {
        src = fetchgit {
          name = "phidgets_api-source";
          url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
          rev = "5eb18fb60ce31a04ee0263b59aee64a66a321521";
          hash = "sha256-yApWn4EjkZOKG71s1bRI+kpC+mFXm6uJk5hROmuXNFc=";
        };
      };
    });
  };
  meta = {
    description = "A C++ Wrapper for the Phidgets C API";
  };
})
