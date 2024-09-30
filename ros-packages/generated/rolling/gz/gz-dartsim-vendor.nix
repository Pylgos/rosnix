{
  ament-cmake,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "gz_dartsim_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_dartsim_vendor-source";
        url = "https://github.com/ros2-gbp/gz_dartsim_vendor-release.git";
        rev = "cc443f34ca4bfb21fbedfe22d2adf3468a76fb1f";
        hash = "sha256-GNwTMUXXWeR4GBVg3fGvXRTdMbMq340+qIujVA/HiYI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/dartsim/dart.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_dartsim_vendor/dart"}";
        }
      ];
    };
    "gz_dartsim_vendor/dart" = substituteSource {
      src = fetchgit {
        name = "dart-source";
        url = "https://github.com/dartsim/dart.git";
        rev = "a51e08c210d7892605c6dc0b9ae96fce4446d9fe";
        hash = "sha256-AfKPqUiW6BsM98TIzTY2ZcFP1WvURs8/dGOzanIiB9g=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "gz-dartsim-vendor";
  version = "0.1.1-1";
  src = sources."gz_dartsim_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "bullet" "eigen" "fmt" "libboost-dev" "libboost-regex-dev" "libboost-system-dev" "libccd-dev" "libfcl-dev" "liboctomap-dev" "liburdfdom-dev" "lz4" "opende" "tinyxml2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Vendor package for the DART physics engine v6.13.2";
  };
}