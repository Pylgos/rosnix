{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    SDL2-2-vendor_source-0xsgm5029q9512nsnkr61llz918gc2c0275qmf11hh7blcd6280g = substituteSource {
      src = fetchzip {
        name = "SDL2-2-vendor_source-0xsgm5029q9512nsnkr61llz918gc2c0275qmf11hh7blcd6280g-source";
        url = "https://www.libsdl.org/release/SDL2-2.0.20.tar.gz";
        hash = "sha256-DyBhGqPrQBiCq7gcAZhgD4X0KQ0mT6utCCXhJECpT3c=";
      };
      substitutions = [
      ];
    };
    sdl2_vendor-bf998888b1b75e03fe402bfefb8ccb9f0649de5a = substituteSource {
      src = fetchgit {
        name = "sdl2_vendor-bf998888b1b75e03fe402bfefb8ccb9f0649de5a-source";
        url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
        rev = "bf998888b1b75e03fe402bfefb8ccb9f0649de5a";
        hash = "sha256-FPIFbwhynn0Z2eddBdAgdM0oExj1aEQTgF2n59zGr40=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://www.libsdl.org/release/SDL2-2.0.20.tar.gz";
          to = "URL ${SDL2-2-vendor_source-0xsgm5029q9512nsnkr61llz918gc2c0275qmf11hh7blcd6280g}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "sdl2_vendor";
  version = "3.3.0-3";
  src = sources.sdl2_vendor-bf998888b1b75e03fe402bfefb8ccb9f0649de5a;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "sdl2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Vendor library for SDL2.";
  };
}
