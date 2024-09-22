{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    sdl2_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "sdl2_vendor-source";
        owner = "ros2-gbp";
        repo = "joystick_drivers-release";
        rev = "4cf8f214e4f8808ca3bb93089a81d24a31e9258f";
        hash = "sha256-FPIFbwhynn0Z2eddBdAgdM0oExj1aEQTgF2n59zGr40=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://www.libsdl.org/release/SDL2-2.0.20.tar.gz";
          to = "URL ${sdl2_vendor-vendor_source-SDL2-2-0}";
        }
      ];
    };
    sdl2_vendor-vendor_source-SDL2-2-0 = substituteSource {
      src = fetchzip {
        name = "sdl2_vendor-vendor_source-SDL2-2-0-source";
        url = "https://www.libsdl.org/release/SDL2-2.0.20.tar.gz";
        hash = "sha256-DyBhGqPrQBiCq7gcAZhgD4X0KQ0mT6utCCXhJECpT3c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sdl2_vendor";
  version = "3.3.0-2";
  src = sources.sdl2_vendor;
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
