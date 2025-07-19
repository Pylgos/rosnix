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
        rev = "f3ed1089d4e4ce8d95fa5e95ba1138a259ed8b63";
        hash = "sha256-FPIFbwhynn0Z2eddBdAgdM0oExj1aEQTgF2n59zGr40=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://www.libsdl.org/release/SDL2-2.0.20.tar.gz";
          to = "URL ${sources."sdl2_vendor/SDL2-2"}";
        }
      ];
    };
    "sdl2_vendor/SDL2-2" = substituteSource {
      src = fetchzip {
        name = "SDL2-2-source";
        url = "https://www.libsdl.org/release/SDL2-2.0.20.tar.gz";
        hash = "sha256-DyBhGqPrQBiCq7gcAZhgD4X0KQ0mT6utCCXhJECpT3c=";
      };
    };
  });
  meta = {
    description = "Vendor library for SDL2.";
  };
})
