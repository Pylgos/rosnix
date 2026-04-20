{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sdl2_vendor";
  version = "3.3.0-3";
  src = finalAttrs.passthru.sources."sdl2_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "sdl2" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "sdl2" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sdl2_vendor" = substituteSource {
      src = fetchgit {
        name = "sdl2_vendor-source";
        url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
        rev = "bf998888b1b75e03fe402bfefb8ccb9f0649de5a";
        hash = "sha256-FPIFbwhynn0Z2eddBdAgdM0oExj1aEQTgF2n59zGr40=";
      };
    };
  });
  meta = {
    description = "Vendor library for SDL2.";
  };
})
